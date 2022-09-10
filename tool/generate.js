const fs = require("fs");
const { createElement } = require("react");
const { renderToString } = require("react-dom/server");
const icons = require(`antd-mobile-icons`);

try {
  fs.mkdirSync("svg");
} catch {}

Object.entries(icons).forEach(([key, Component]) => {
  const svg = renderToString(createElement(Component));

  fs.writeFileSync(`svg/${key}.svg`, svg);
});
