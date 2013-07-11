# the semi-colon before function invocation is a safety net against concatenated
# scripts and/or other plugins which may not be closed properly.
(( $, window, document) -> 

    # window and document are passed through as local variable rather than global
    # as this (slightly) quickens the resolution process and can be more efficiently
    # minified (especially when both are regularly referenced in your plugin).

    # Create the defaults once
    pluginName = "defaultPluginName"
    defaults = (
        propertyName: "value"
    )

    # The actual plugin constructor
    Plugin = ( element, options ) ->
        @.element = element

        # jQuery has an extend method which merges the contents of two or
        # more objects, storing the result in the first object. The first object
        # is generally empty as we don't want to alter the default options for
        # future instances of the plugin
        @.options = $.extend( {}, defaults, options )

        @._defaults = defaults
        this._name = pluginName

        @.init()

    Plugin.prototype =

        init: () ->
            # Place initialization logic here
            # You already have access to the DOM element and
            # the options via the instance, e.g. this.element
            # and this.options
            # you can add more functions like the one below and
            # call them like so: this.yourOtherFunction(this.element, this.options).

        yourOtherFunction: (el, options) ->
            # some logic
        

    # A really lightweight plugin wrapper around the constructor,
    # preventing against multiple instantiations
    $.fn[pluginName] = ( options ) ->
        return @.each(() -> 
            if !$.data(@, "plugin_" + pluginName)
                $.data(@, "plugin_" + pluginName, new Plugin( @, options ))
        )

)( jQuery, window, document )