# encoding: utf-8

###
# to run use
#   ruby -I ./lib -I ./test test/test_builder.rb


require 'helper'


class TestBuilder < MiniTest::Test

  def test_starter

    $QUIK_WIZARD_IN = EchoIO.new( <<EOS )
Another Beautiful Static Site
H. J.
EOS

    _ = MrHyde::Builder.load_file( "#{MrHyde.root}/test/scripts/starter.rb", test: true )

    assert true  ## if we get here; everything is ok
  end

  def test_starterii

    $QUIK_WIZARD_IN = EchoIO.new( <<EOS )
Another Beautiful Static Site
http://example.github.io/repo
H. J.
1
EOS

    _ = MrHyde::Builder.load_file( "#{MrHyde.root}/test/scripts/starterii.rb", test: true )

    assert true  ## if we get here; everything is ok
  end


end # class TestBuilder
