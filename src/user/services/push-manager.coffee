angular.module '%module%.user'
.factory 'PushManager', (storage) ->

  register = ->
    io = Ionic.io
    push = new Ionic.Push
      onNotification: (notification) ->
        alert JSON.stringify notification
      pluginConfig:
        android:
          iconColor: '#000000'

    user = Ionic.User.current()

    if not user.id
      user.id = storage.user.id

    user.set 'name', storage.name
    user.save()

    push.register (data) ->
      push.addTokenToUser user
      user.save

  register: register
