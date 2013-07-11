(function($, window, document) {
  var Plugin, defaults, pluginName;
  pluginName = "defaultPluginName";
  defaults = {
    propertyName: "value"
  };
  Plugin = function(element, options) {
    this.element = element;
    this.options = $.extend({}, defaults, options);
    this._defaults = defaults;
    this._name = pluginName;
    return this.init();
  };
  Plugin.prototype = {
    init: function() {},
    yourOtherFunction: function(el, options) {}
  };
  return $.fn[pluginName] = function(options) {
    return this.each(function() {
      if (!$.data(this, "plugin_" + pluginName)) {
        return $.data(this, "plugin_" + pluginName, new Plugin(this, options));
      }
    });
  };
})(jQuery, window, document);