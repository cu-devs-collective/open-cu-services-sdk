const urls = [
  {
    name: "CU LMS API",
    url: "https://raw.githubusercontent.com/cu-devs-collective/open-cu-services-openapi/master/spec/lmsapi/lmsapi.re.openapi.yaml"
  }
];

const requestPreviewPlugin = function () {
  return {
    statePlugins: {
      spec: {
        wrapActions: {
          executeRequest: (originalExecuteRequest) => (request) => originalExecuteRequest({
            ...request,
            fetch: createRequestPreviewFetch()
          })
        }
      }
    },
    wrapComponents: {
      execute: (Original, system) => {
        const React = system.React;

        return class GenerateRequestButton extends React.Component {
          componentDidMount() {
            this.renameButton();
          }

          componentDidUpdate() {
            this.renameButton();
          }

          renameButton() {
            const button = this.root && this.root.querySelector("button.execute");

            if (button) {
              button.textContent = "Generate request";
              button.setAttribute("aria-label", "Generate request");
            }
          }

          render() {
            return React.createElement(
              "span",
              {
                ref: (element) => {
                  this.root = element;
                }
              },
              React.createElement(Original, this.props)
            );
          }
        };
      }
    }
  };
};

function createRequestPreviewFetch() {
  return function requestPreviewFetch(request) {
    const responseText = "Request generated locally. No HTTP request was sent.";
    const interceptedRequest = request.requestInterceptor
      ? request.requestInterceptor(request)
      : Promise.resolve(request);

    return interceptedRequest.then((mutatedRequest) => ({
      ok: true,
      url: mutatedRequest.url,
      status: 599,
      statusText: "Request Not Sent",
      headers: {
        "content-type": "text/plain"
      },
      text: responseText,
      data: responseText
    }));
  };
}

function createSwaggerConfig() {
  const config = {
    urls: urls,
    "urls.primaryName": "CU LMS API",
    dom_id: "#swagger-ui",
    deepLinking: true,
    queryConfigEnabled: false,
    tryItOutEnabled: true,
    requestSnippetsEnabled: true,
    plugins: [
      requestPreviewPlugin
    ],
    presets: [
      SwaggerUIBundle.presets.apis,
      SwaggerUIStandalonePreset
    ],
    layout: "StandaloneLayout"
  };

  const query = new URLSearchParams(window.location.search);
  const url = query.get("url");

  if (url) {
    config.url = url;
    delete config.urls;
    delete config["urls.primaryName"];
  }

  return config;
}

window.onload = function () {
  window.ui = SwaggerUIBundle(createSwaggerConfig());
};
