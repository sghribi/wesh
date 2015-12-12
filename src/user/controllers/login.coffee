angular.module '%module%.user'
.controller 'LoginCtrl', ($scope, AccountManager, storage) ->

  $scope.formError = false
  $scope.disabled = false
  $scope.username = storage.username

  $scope.login = (username, password) ->
    $scope.disabled = true

    AccountManager.login username, password, (username, error) ->
      $scope.disabled = false

      if error?.data
        $scope.formError = true
      else
        $scope.formError = false
