# encoding: utf-8

###
# to run use
#   ruby -I ./lib -I ./test test/test_url.rb


require 'helper'


class TestUrl < MiniTest::Test

  def test_clean_path
    path = '/'
    path = path.sub( /\/$/, '' )
    assert_equal '', path

    path = ''
    path = path.sub( /\/$/, '' )
    assert_equal '', path

    path = '/test/'
    path = path.sub( /\/$/, '' )
    assert_equal '/test', path
  end


  def test_site_url

    str = 'http://example.com'
    
    url = URI.parse( str )

    pp url
    
    assert_equal 'example.com', url.host
    assert_equal '', url.path
  end

end # class TestUrl
