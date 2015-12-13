angular.module '%module%.user'
.factory 'PushManager', ($rootScope, storage) ->

  register = ->
    io = Ionic.io
    push = new Ionic.Push
      onNotification: (notification) ->
        $rootScope.$broadcast 'notification', notification
      pluginConfig:
        android:
          iconColor: '#FFFFFF'

    user = Ionic.User.current()

    if not user.id
      user.id = storage.user.id

    user.set 'name', storage.user.name
    user.save()

    push.register (data) ->
      push.addTokenToUser user
      user.save

  register: register

  #@TODO: unregister
