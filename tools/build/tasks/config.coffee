gulp = require 'gulp'
expect = require 'gulp-expect-file'
ngConstant = require 'gulp-ng-constant'
concat = require 'gulp-concat'
addsrc = require 'gulp-add-src'

parameters = require '../parameters.coffee'

gulp.task 'config', ['app'], ->
  gulp.src parameters.paths.config.file
  .pipe expect parameters.paths.config.file
  .pipe ngConstant name: 'config'
  .pipe addsrc "#{parameters.paths.www.scripts}/#{parameters.files.app}"
  .pipe concat parameters.files.app
  .pipe gulp.dest parameters.paths.www.scripts
