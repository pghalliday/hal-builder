module.exports = (grunt) ->
  grunt.initConfig
    clean: 
      build: ['lib']
      coverage: ['lib-cov']
    coffee:
      build:
        expand: true 
        src: ['src/**/*.coffee', 'test/**/*.coffee']
        dest: 'lib'
        ext: '.js'
    copy:
      coverage:
        src: ['lib/test/**']
        dest: 'lib-cov/'
    blanket:
      coverage:
        src: ['lib/src/']
        dest: 'lib-cov/lib/src'
    mochaTest:
      test:
        options: 
          reporter: 'spec'
        src: ['lib-cov/lib/test/**/*.js']
      report:
        options: 
          reporter: 'html-cov'
          quiet: true
          captureFile: 'coverage.html'
        src: ['lib-cov/lib/test/**/*.js']
      coverage:
        options:
          reporter: 'travis-cov'
        src: ['lib-cov/lib/test/**/*.js']

  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-blanket'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-mocha-test'

  grunt.registerTask 'build', [
    'clean:build'
    'coffee:build'
  ]

  grunt.registerTask 'coverage', [
    'clean:coverage'
    'build'
    'copy:coverage'
    'blanket:coverage'
  ]

  grunt.registerTask 'default', [
    'coverage'
    'mochaTest'
  ]
