window.onload = function () {
  window.ui = SwaggerUIBundle({
    urls: [
      {
        name: "CU LMS API",
        url: "https://raw.githubusercontent.com/cu-devs-collective/open-cu-services-openapi/master/spec/lmsapi/lmsapi.openapi.yaml"
      }
    ],
    "urls.primaryName": "CU LMS API",
    dom_id: "#swagger-ui",
    deepLinking: true,
    presets: [
      SwaggerUIBundle.presets.apis,
      SwaggerUIStandalonePreset
    ],
    layout: "StandaloneLayout"
  });
};
