const fs = require("fs");
const { createElement } = require("react");
const { renderToString } = require("react-dom/server");
const icons = require(`antd-mobile-icons`);

try {
  fs.rmSync("dist", { recursive: true });
  fs.mkdirSync("dist/svg", { recursive: true });
} catch {}

Object.entries(icons).forEach(([key, Component]) => {
  const svg = renderToString(createElement(Component));

  fs.writeFileSync(`dist/svg/${key}.svg`, svg);
});
