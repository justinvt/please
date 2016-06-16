"use strict";
var system = require("system");
var url = system.args[1] || "http://pornhub.com"
console.log(system.args[1]);
var webPage = require('webpage');
var page = webPage.create();
page.viewportSize = { width: 1920, height: 1080 };
page.open(url, function start(status) {
  page.render('google_home.png', {format: 'png', quality: '100'});
  phantom.exit();
});
