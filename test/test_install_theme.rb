# encoding: utf-8

###
# to run use
#   ruby -I ./lib -I ./test test/test_install_theme.rb


require 'helper'


class TestInstallTheme < MiniTest::Test

  def test_starter

    $QUIK_WIZARD_IN = EchoIO.new( <<EOS )
Another Beautiful Static Site
H. J.
EOS

    _ = MrHyde::Builder.load_file( "#{MrHyde.root}/test/scripts/starter.rb", o: './o')

    assert true  ## if we get here; everything is ok
  end

end # class TestInstallTheme
