#encoding: utf-8

module MrHyde

class Builder

  def self.load_file( path )
    code = File.read_utf8( path )
    self.load( code )
  end

  def self.load( code )
    builder = Builder.new
    builder.instance_eval( code )
    builder
  end


  include Wizard   ## mixin helpers for say, ask, yes?, no?, select, etc.

  def initialize
    puts "starting new MrHyde script (sitefile); lets go"
  end

  def install_theme( name, opts= {} )
    puts "  handle install_theme #{name}, #{opts.inspect}"
  end

  def config( opts={} )
    puts "  handle config block"
  end

end # class Builder

end # module MrHyde

