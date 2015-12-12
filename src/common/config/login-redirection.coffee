angular.module '%module%.common'
.factory 'LoginRedirection', ($state, $ionicViewService) ->
  state =
    name: null
    params: null

  save: (toState, toParams) ->
    state.name = toState.name
    state.params = toParams
    $state.go 'user.login'

  restore: ->
    if state.name
      $state.go state.name, state.params
      state.name = null
      state.params = null
    else
      # Clear ionic history to prevent backing on login/register page
      $ionicViewService.nextViewOptions
        disableBack: true
      $state.go 'homepage'
