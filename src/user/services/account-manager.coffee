angular.module '%module%.user'
.factory 'AccountManager', (
  LoginRedirection
  storage
  Users
  $ionicViewService
  $http
  SERVER_OAUTH_URL
  SERVER_OAUTH_CLIENT_ID
  SERVER_OAUTH_CLIENT_SECRET
) ->

  #@TODO: use promises instead of callbacks
  login = (username, password, callback) ->
    $http
      method: 'POST'
      url: SERVER_OAUTH_URL
      cache: false
      data:
        client_id: SERVER_OAUTH_CLIENT_ID
        client_secret: SERVER_OAUTH_CLIENT_SECRET
        grant_type: "password"
        username: username
        password: password
    .then (res) ->
      storage.username = username
      storage.access_token = res.data.access_token
      updateCurrentUser (user, error) ->
        if error
          callback null, error
        else
          LoginRedirection.restore()
    .catch (error) ->
      callback null, error

  updateCurrentUser = (callback) ->
    Users.get {id: 'me', access_token: storage.access_token}, (user) ->
      storage.user = user
      callback user, null
    , (error) ->
      callback null, error

  logout = ->
    # Clear ionic history to prevent backing on connected page
    $ionicViewService.nextViewOptions
      disableBack: true
    delete storage.access_token
    delete storage.user

  login: login
  logout: logout
  updateCurrentUser: updateCurrentUser
