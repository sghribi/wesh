###*
  @ngdoc object
  @name storage
  @module %module%.common
  @description

  This value object is an application-wide data-store.
  It's published in `$rootScope` for easy-access in views.
###

angular.module '%module%.common'
.run ($window, FACEBOOK_APP_ID) ->
  $window.fbAsyncInit = ->
    FB.init
      appId: FACEBOOK_APP_ID
      status: true
      cookie: true
      xfbml: true
      version: 'v2.4'
