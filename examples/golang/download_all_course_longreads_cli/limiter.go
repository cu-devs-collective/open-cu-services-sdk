package main

import (
	"sync/atomic"
	"time"
)

type rpsLimiter struct {
	tokenCh chan struct{}
	stop    chan struct{}
	closed  atomic.Bool
}

func newRPSLimiter(rate int) *rpsLimiter {
	if rate <= 0 {
		panic("newRPSLimiter: rate must be > 0")
	}
	l := &rpsLimiter{
		tokenCh: make(chan struct{}, rate),
		stop:    make(chan struct{}),
	}
	for range rate {
		l.tokenCh <- struct{}{}
	}

	const window = time.Second
	go l.refillLoop(rate, window)
	return l
}

func (l *rpsLimiter) wait() bool {
	if l.closed.Load() {
		return false
	}
	select {
	case <-l.tokenCh:
		return true
	case <-l.stop:
		return false
	}
}

func (l *rpsLimiter) close() {
	if l.closed.Swap(true) {
		return
	}
	close(l.stop)
}

func (l *rpsLimiter) refillLoop(rate int, window time.Duration) {
	ticker := time.NewTicker(window)
	defer ticker.Stop()
	for {
		select {
		case <-l.stop:
			return
		case <-ticker.C:
			filled := 0
			for filled < rate {
				select {
				case l.tokenCh <- struct{}{}:
					filled++
				default:
					filled = rate
				}
			}
		}
	}
}
