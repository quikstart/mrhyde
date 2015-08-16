#encoding: utf-8

module MrHyde

class Builder

  def self.load_file( path, opts={} )
    code = File.read_utf8( path )
    self.load( code, opts )
  end

  def self.load( code, opts={} )
    builder = Builder.new( opts )
    builder.instance_eval( code )
    builder
  end


  include Wizard   ## mixin helpers for say, ask, yes?, no?, select, etc.

  def initialize( opts={} )
    puts "starting new MrHyde script (sitefile) #{opts.inspect}; lets go"
    
    @test       = opts[:dry_run] || opts[:test] || false
    @output_dir = opts[:o] || '.'
  end

  ## "global" builder options
  def test?()      @test;       end   ## dry_run option (defaults to false)
  def output_dir() @output_dir; end   ## ouptput (root) dir (defaults to . e.g. working folder)


  def install_theme( name, opts= {} )
    puts "  handle install_theme #{name}, #{opts.inspect}"

    ## note for now assume name is key
    ##   e.g. always downcase (e.g. Starter => starter)
    @theme_key = key = name.downcase

    ## themes_dir = "#{DrJekyll.root}/test/data"
    ## catalog = Catalog.new( "#{themes_dir}/themes.yml" )
    url = "https://github.com/drjekyllthemes/themes/raw/master/o/themes.yml"

    if test?
      # do nothing; dry run
    else
      catalog = DrJekyll::Catalog.from_url( url )
      theme = catalog.find( key )
      if theme
        pak = DrJekyll::Package.new( key, theme )
        pak.download
        pak.unzip( "#{@output_dir}/#{key}" )
      else
        ## todo: issue warning - why, why not??
        fail "*** theme '#{key}' not found; sorry"
      end
    end
  end


  def config( opts={} )
    puts "  handle config block"
    c = OpenConfig.new
    yield( c )
    ## pp c
    h = c.to_h

    ##
    # check for site.url  if present also
    #  add site.baseurl|path

    site_url = h['url']

    if site_url.nil? || site_url.empty?        ## special case site_url is empty string ""
      ## note: always add site url for now
      ## todo/fix: warn if we overwrite "empty" site.url - why? why not?
      h['url']     = 'http://example.com'   # note: no trailing slash (/) e.g. example.com/
      h['baseurl'] = ''                     # note: no trailing slash (/) e.g. /
      h['path']    = ''                     # (better) alias for baseurl
    else
      ## site_baseurl = h['baseurl']
      ## site_path    = h['path']

      ### calculate path/baseurl
      url = URI.parse( site_url )
      path = url.path.sub(/\/$/, '' )  ## note: cut off trailing slash if present e.g. '/' becomes ''

      h['baseurl'] = path
      h['path']    = path
      ## todo/fix: warn if we overwrite baseurl/path we new values - why? why not?
    end

    pp h


    if test?
      ## do nothing; dry run
    else
      org = YAML.load_file( "#{@output_dir}/#{@theme_key}/_config.yml" )
      pp org

      ## for now always add props at the end
      ##   improve later (patch using regex etc. - why? why not?)

      new_settings = YAML.dump( h )
      ## note: cut off leading --- if present
      new_settings = new_settings.sub( /^-{3}\s*/, '')

      File.open( "#{@output_dir}/#{@theme_key}/_config.yml", "a" ) do |f|
        f.puts
        f.puts "######################################"
        f.puts "### Mr Hyde's Settings"
        f.puts
        f.puts new_settings
      end
    end

  end # method config

end # class Builder

end # module MrHyde

