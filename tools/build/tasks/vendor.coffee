gulp = require 'gulp'
concat = require 'gulp-concat'
filter = require 'gulp-filter'
sass = require 'gulp-sass'
mainBowerFiles = require 'main-bower-files'
plumber = require 'gulp-plumber'
wiredep = require 'wiredep'

parameters = require '../parameters.coffee'

gulp.task 'vendor', ->
  # Scripts
  files = wiredep
      devDependencies: parameters.env is not 'production'
    .js
  gulp.src files
  .pipe filter '**/*.js'
  .pipe concat parameters.files.vendors.scripts
  .pipe gulp.dest parameters.paths.www.scripts

  # Fonts
  gulp.src mainBowerFiles()
  .pipe filter [
      '**/*.woff'
      '**/*.svg'
      '**/*.eot'
      '**/*.ttf'
      '**/*.otf'
    ]
  .pipe gulp.dest "#{parameters.paths.www.main}/fonts"

  # Sass
  gulp.src [
    "bower_components/ionic/scss/ionic.scss"
    "#{parameters.paths.src.main}/common/main.scss"
  ]
  .pipe plumber()
  .pipe sass()
  .pipe concat "#{parameters.files.styles}"
  .pipe gulp.dest "#{parameters.paths.www.styles}"
