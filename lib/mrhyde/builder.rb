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

    ## themes_dir = "#{DrJekyll.root}/test/data"
    ## catalog = Catalog.new( "#{themes_dir}/themes.yml" )
    url = "https://github.com/drjekyllthemes/themes/raw/master/o/themes.yml"
    catalog = DrJekyll::Catalog.from_url( url )

    ## note for now assume name is key
    ##   e.g. always downcase (e.g. Starter => starter)
    key = name.downcase
    theme = catalog.find( key )
    if theme
      pak = DrJekyll::Package.new( key, theme )
      pak.download
      pak.unzip( "./o/#{key}" )
    else
    ## todo: issue warning - why, why not??
      fail "*** theme '#{key}' not found; sorry"
    end
  end

  def config( opts={} )
    puts "  handle config block"
  end

end # class Builder

end # module MrHyde

