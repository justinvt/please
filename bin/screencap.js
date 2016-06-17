"use strict"
var system = require("system");
var webPage = require('webpage');

var defaults = {
  url: "http://reddit.com",
  time: "time_" + Math.round(new Date().getTime()/1000).toString(),
  format: "jpg"
}

var url = system.args[1] || defaults.url;
var id = system.args[2] || defaults.time;
var format = system.args[3] ||  defaults.format;

var asset_root = "app/assets";
var local = ['images/pages', id, 'image' + '.' + format].join("/");

var page = webPage.create();

console.log(  [id, format, url, asset_root,local].join("\n") );

page.viewportSize = { width: 1400, height: 720 };
page.open(url, function start(status) {
  page.render([asset_root,local].join("/"), {format: format, quality: '95'});
  phantom.exit();
});
console.log(local);