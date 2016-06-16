"use strict";
var system = require("system");
var format = "png"
var url = system.args[1] || "http://pornhub.com"
var asset_root = "app/assets"
var local = ['images/pages', system.args[2], 'image' + '.' + format].join("/")
var webPage = require('webpage');
var page = webPage.create();
page.viewportSize = { width: 1920, height: 1080 };
page.open(url, function start(status) {
  page.render([asset_root,local].join("/"), {format: format, quality: '100'});
  phantom.exit();
});
console.log(local)