angular.module '%module%.common'
.config ->

  ionic.Platform.ready ->
    cordova.plugins.Keyboard.disableScroll false
    cordova.plugins.Keyboard.hideKeyboardAccessoryBar false
    cordova.plugins.Keyboard.disableScroll false
