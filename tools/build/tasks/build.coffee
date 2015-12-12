gulp = require 'gulp'
gulp.task 'build', [
  'assets'
  'vendor'
  'config'
  'index'
  'app'
  'templates'
]
