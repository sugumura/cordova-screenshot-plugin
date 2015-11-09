var argscheck = require('cordova/argscheck'),
    channel = require('cordova/channel'),
    utils = require('cordova/utils'),
    exec = require('cordova/exec'),
    cordova = require('cordova');

Screenshot = function() {};

Screenshot.prototype.now = function() {
    return {
        then: function(success, fail) {
            cordova.exec(success, fail, "Screenshot", "now", []);
        }
    }
};

module.exports = new Screenshot();
