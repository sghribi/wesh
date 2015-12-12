angular.module '%module%.user'
.factory 'Users', ($resource, SERVER_API_URL, storage) ->
  $resource SERVER_API_URL + 'users/:id', {id: '@id', access_token: '@access_token'},
    get:
      url: SERVER_API_URL + 'users/:id'
      method: 'GET'
      params:
        Authorization: 'Bearer ' + storage.accessToken
    login:
      url: SERVER_API_URL + 'oauth/v2/token'
      method: 'POST'
