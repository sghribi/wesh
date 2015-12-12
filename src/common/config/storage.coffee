###*
  @ngdoc object
  @name storage
  @module %module%.common
  @description

  This value object is an application-wide data-store.
  It's published in `$rootScope` for easy-access in views.
###

angular.module '%module%.common'
.value 'storage', {}

.run ($rootScope, storage, PERMANENT_KEYS) ->

  # Init storage
  $rootScope.storage = storage

  # Initializing storage
  for key in PERMANENT_KEYS
    try
      storage[key] = JSON.parse localStorage[key]
    catch
      storage[key] = localStorage[key]

  # Synchronize storage and localStorage
  updateLocalStorage = ->
    localStorage.clear()
    for key in PERMANENT_KEYS when storage[key]
      if typeof storage[key] is 'object'
        localStorage[key] = JSON.stringify storage[key]
      else
        localStorage[key] = storage[key]

  $rootScope.$watch 'storage', updateLocalStorage, true
