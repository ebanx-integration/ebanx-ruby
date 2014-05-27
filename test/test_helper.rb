require 'ebanx'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/pride'

class MiniTest::Spec
  def ebanx
    Ebanx.tap do |e|
      e.integration_key = '1231000'
      e.test_mode       = true
    end
  end
end