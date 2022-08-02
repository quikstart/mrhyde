require 'hoe'
require './lib/mrhyde/version.rb'

Hoe.spec 'mrhyde-tools' do

  self.version = MrHyde::VERSION

  self.summary = "mrhyde - jekyll command line tool .:. static site quick starter script wizard"
  self.description = summary

  self.urls    = ['https://github.com/mrhydescripts/mrhyde']

  self.author  = 'Gerald Bauer'
  self.email   = 'wwwmake@googlegroups.com'

  # switch extension to .markdown for gihub formatting
  self.readme_file  = 'README.md'
  self.history_file = 'HISTORY.md'

  self.extra_deps = [
    ['logutils'],
    ['textutils'],
    ['drjekyll', '>= 0.1.1'],
    ['quik',     '>= 0.3'],    
  ]

  self.licenses = ['Public Domain']

  self.spec_extras = {
    required_ruby_version: '>= 1.9.2'
  }

end
