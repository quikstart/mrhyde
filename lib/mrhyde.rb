# encoding: utf-8

## stdlibs
require 'pp'
require 'yaml'
require 'uri'


## 3rd party libs
require 'textutils'      ## used for File.read_utf8
require 'drjekyll'
require 'quik'           ## used for wizards, (open)config etc. 

## our own code
require 'mrhyde/version'    # note: let version always go first
require 'mrhyde/builder'

require 'mrhyde/cli/opts'
require 'mrhyde/cli/main'


module MrHyde
  def self.main
    exit Tool.new.run( ARGV )
  end
end # module MrHyde


MrHyde.main if __FILE__ == $0
