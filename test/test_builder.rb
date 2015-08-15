# encoding: utf-8

###
# to run use
#   ruby -I ./lib -I ./test test/test_builder.rb


require 'helper'


class TestBuilder < MiniTest::Test

  def test_starter

    $MRHYDE_WIZARD_IN = EchoIO.new( <<EOS )
Another Beautiful Static Site
H. J.
EOS

    _ = MrHyde::Builder.load_file( "#{MrHyde.root}/test/scripts/starter.rb" )

    assert true  ## if we get here; everything is ok
  end

  def test_starterii

    $MRHYDE_WIZARD_IN = EchoIO.new( <<EOS )
Another Beautiful Static Site
H. J.
1
EOS

    _ = MrHyde::Builder.load_file( "#{MrHyde.root}/test/scripts/starterii.rb" )

    assert true  ## if we get here; everything is ok
  end


end # class TestBuilder
