if ENV['CODECLIMATE_REPO_TOKEN']
  require 'codeclimate-test-reporter'
  CodeClimate::TestReporter.start
end

require 'ebanx'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/pride'

class MiniTest::Spec
  def ebanx
    Ebanx.tap do |e|
      e.integration_key = ENV.fetch('INTEGRATION_KEY')
      e.test_mode       = true
    end
  end
end