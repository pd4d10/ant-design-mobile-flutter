const fs = require("fs");
const { createElement } = require("react");
const { renderToString } = require("react-dom/server");
const icons = require(`antd-mobile-icons`);

try {
  fs.rmSync("dist", { recursive: true });
} catch {}
fs.mkdirSync("dist/svg", { recursive: true });

Object.entries(icons).forEach(([key, Component]) => {
  const svg = renderToString(createElement(Component));

  fs.writeFileSync(`dist/svg/${key}.svg`, svg);
});
