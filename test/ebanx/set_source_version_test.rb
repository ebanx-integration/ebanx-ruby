require_relative '../test_helper'

describe Ebanx::Command do
  before do
    @source = 'TEST-SOURCE'
    @version = '1.2.3'
  end
  
  it "set source version succesfully" do
    ebanx.add_source_data @source, @version
    return_header = ebanx.format_user_data
    return_header['X-Ebanx-Client-User-Agent'].must_equal "SDK-RUBY/1.4.2 TEST-SOURCE/1.2.3"
  end
end
