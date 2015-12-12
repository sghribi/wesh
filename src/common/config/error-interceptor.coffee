angular.module '%module%.common'
.factory 'ErrorInterceptor', ($q, storage, $injector) ->
  responseError: (res) ->
    if res.status in [401, 403]
      # Circular dep when using AccountManager.logout()
      delete storage.accessToken
      delete storage.user
      $injector.get('$state').transitionTo 'login'
    $q.reject res

.factory 'NetworkErrorInterceptor', ($q, $cordovaToast) ->
  responseError: (res) ->
    if res.status is 0
      $cordovaToast.show 'Erreur réseau.', 'short', 'bottom'
    $q.reject res

.config ($httpProvider) ->
  $httpProvider.interceptors.push 'ErrorInterceptor'
  $httpProvider.interceptors.push 'NetworkErrorInterceptor'
