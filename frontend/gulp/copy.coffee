gulp = require 'gulp'

gulp.task 'copy', ->
  gulp.src [
    './node_modules/bootstrap/fonts/**'
    './node_modules/font-awesome/fonts/**'
  ]
  .pipe gulp.dest "./dist/fonts/"

  gulp.src [
    './copy/**'
  ]
  .pipe gulp.dest "./dist/"

