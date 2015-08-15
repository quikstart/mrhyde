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
    @theme_key = name.downcase
  end

  def install_theme_v2( name, opts= {} )
    puts "  handle install_theme #{name}, #{opts.inspect}"

    ## themes_dir = "#{DrJekyll.root}/test/data"
    ## catalog = Catalog.new( "#{themes_dir}/themes.yml" )
    url = "https://github.com/drjekyllthemes/themes/raw/master/o/themes.yml"
    catalog = DrJekyll::Catalog.from_url( url )

    ## note for now assume name is key
    ##   e.g. always downcase (e.g. Starter => starter)
    @theme_key = key = name.downcase
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
    c = OpenConfig.new
    yield( c )
    ## pp c
    h = c.to_h
    pp h


    org = YAML.load_file( "./o/#{@theme_key}/_config.yml" )
    pp org


    ## for now always add props at the end
    ##   improve later (patch using regex etc. - why? why not?)

    new_settings = YAML.dump( h )
    ## note: cut off leading --- if present
    new_settings = new_settings.sub( /^-{3}\s*/, '')

    File.open( "./o/#{@theme_key}/_config.yml", "a" ) do |f|
      f.puts
      f.puts "######################################"
      f.puts "### Mr Hyde's Settings"
      f.puts
      f.puts new_settings
    end

=begin
    ### patch _config.yml
    ##  use regex for now to keep file as is

    new_props = {}
    up_props = {}

    h.each do |k,v|
      if org.has_key?(k)
        if v.is_a? Hash

        else
          puts "update setting #{k} : #{v.inspect}"
          up_props[k] = v
        end
      else
        puts "new setting #{k} : #{v.inspect}"
        new_props[k] = v
      end
    end
=end

  end # method config

end # class Builder

end # module MrHyde

