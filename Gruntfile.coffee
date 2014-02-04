module.exports = (grunt) ->

  grunt.initConfig
    coffee:
      glob_to_multiple:
        expand: true
        cwd: './src'
        src: ['**/*.coffee']
        dest: './lib'
        ext: '.js'
    less:
      glob_to_multiple:
        expand: true
        cwd: './src'
        src: ['**/*.less']
        dest: './lib'
        ext: '.css'
    watch:
      less:
        files: 'src/**/*.less'
        tasks: ['less']
      coffee:
        files: 'src/**/*.coffee'
        tasks: ['coffee']
    bump:
      options:
        files: ['package.json']
        updateConfigs: []
        commit: true
        commitMessage: 'Release v%VERSION%'
        commitFiles: ['package.json']
        createTag: true
        tagName: 'v%VERSION%'
        tagMessage: 'Version %VERSION%'

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-bump'

  grunt.registerTask 'default', ['coffee', 'less']

