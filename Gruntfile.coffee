ALL_TASKS = ['jst:all', 'coffee:all', 'concat:all', 'stylus:all', 'clean:compiled']

# formbuilder.js must be compiled in this order:
# 1. rivets-config
# 2. main
# 3. fields js
# 4. fields templates

module.exports = (grunt) ->

  path = require('path')
  exec = require('child_process').exec

  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-concat')
  grunt.loadNpmTasks('grunt-contrib-cssmin')
  grunt.loadNpmTasks('grunt-contrib-jst')
  grunt.loadNpmTasks('grunt-contrib-stylus')
  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-clean')
  grunt.loadNpmTasks('grunt-release')
  grunt.loadNpmTasks('grunt-karma')

  grunt.initConfig

    pkg: '<json:package.json>'
    srcFolder: 'src'
    compiledFolder: 'compiled'  # Temporary holding area.
    distFolder: 'dist'
    vendorFolder: 'vendor'
    testFolder: 'test'

    jst:
      all:
        options:
          namespace: 'Formbuilder.templates'
          processName: (filename) ->
            signalStr = "templates/" #strip extra filepath and extensions
            filename.slice(filename.indexOf(signalStr)+signalStr.length, filename.indexOf(".html"))

        files:
          '<%= compiledFolder %>/templates.js': '<%= srcFolder %>/templates/**/*.html'

    coffee:
      all:
        files:
          '<%= compiledFolder %>/scripts.js': [
            '<%= srcFolder %>/scripts/underscore_mixins.coffee'
            '<%= srcFolder %>/scripts/rivets-config.coffee'
            '<%= srcFolder %>/scripts/main.coffee'
            # compile just fields which are implemented server-side yet
            '<%= srcFolder %>/scripts/fields/checkboxes.coffee'
            '<%= srcFolder %>/scripts/fields/date.coffee'
            '<%= srcFolder %>/scripts/fields/dropdown.coffee'
            '<%= srcFolder %>/scripts/fields/email.coffee'
            '<%= srcFolder %>/scripts/fields/number.coffee'
            '<%= srcFolder %>/scripts/fields/paragraph.coffee'
            '<%= srcFolder %>/scripts/fields/radio.coffee'
            '<%= srcFolder %>/scripts/fields/section_break.coffee'
            '<%= srcFolder %>/scripts/fields/text.coffee'
            '<%= srcFolder %>/scripts/fields/time.coffee'
            '<%= srcFolder %>/scripts/fields/website.coffee'
            '<%= srcFolder %>/scripts/fields/submit.coffee'
            '<%= srcFolder %>/scripts/fields/reset.coffee'
          ]

    concat:
      all:
        files:
          '<%= distFolder %>/formbuilder.js': '<%= compiledFolder %>/*.js'
          '<%= vendorFolder %>/js/vendor.js': [
            'bower_components/ie8-node-enum/index.js'
            'bower_components/jquery/jquery.js'
            'bower_components/jquery-ui/ui/jquery.ui.core.js'
            'bower_components/jquery-ui/ui/jquery.ui.widget.js'
            'bower_components/jquery-ui/ui/jquery.ui.mouse.js'
            'bower_components/jquery-ui/ui/jquery.ui.draggable.js'
            'bower_components/jquery-ui/ui/jquery.ui.droppable.js'
            'bower_components/jquery-ui/ui/jquery.ui.sortable.js'
            'bower_components/jquery.scrollWindowTo/index.js'
            'bower_components/underscore/underscore-min.js'
            'bower_components/underscore.mixin.deepExtend/index.js'
            'bower_components/rivets/dist/rivets.js'
            'bower_components/backbone/backbone.js'
            'bower_components/backbone-deep-model/src/deep-model.js'
          ]
      mobile_friendly:
        files:
          '<%= distFolder %>/formbuilder.js': '<%= compiledFolder %>/*.js'
          '<%= vendorFolder %>/js/vendor_mobile_friendly.js': [
            'bower_components/ie8-node-enum/index.js'
            'bower_components/jquery.scrollWindowTo/index.js'
            'bower_components/underscore.mixin.deepExtend/index.js'
            'bower_components/rivets/dist/rivets.js'
            'bower_components/backbone-deep-model/src/deep-model.js'
          ]

    cssmin:
      dist:
        files:
          '<%= distFolder %>/formbuilder-min.css': '<%= distFolder %>/formbuilder.css'

    stylus:
      all:
        files:
          '<%= compiledFolder %>/formbuilder.css': '<%= srcFolder %>/styles/**.styl'
          '<%= distFolder %>/formbuilder.css': '<%= compiledFolder %>/**/*.css'

    clean:
      compiled:
        ['<%= compiledFolder %>']

    uglify:
      dist:
        files:
          '<%= distFolder %>/formbuilder-min.js': '<%= distFolder %>/formbuilder.js'

    watch:
      all:
        files: ['<%= srcFolder %>/**/*.{coffee,styl,html}']
        tasks: ALL_TASKS

    # To test, run `grunt --no-write -v release`
    release:
      npm: false

    karma:
      unit:
        configFile: '<%= testFolder %>/karma.conf.coffee'


  grunt.registerTask 'default', ALL_TASKS
  grunt.registerTask 'mobile_friendly', ['jst:all', 'coffee:all', 'concat:mobile_friendly', 'stylus:all', 'clean:compiled']
  grunt.registerTask 'dist', ['cssmin:dist', 'uglify:dist']
  grunt.registerTask 'test', ['dist', 'karma']
