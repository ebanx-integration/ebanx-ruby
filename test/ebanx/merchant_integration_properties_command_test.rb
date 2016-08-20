require_relative '../test_helper'

describe Ebanx::Command::MerchantIntegrationProperties do
  before do
    @params = {
      url_response: 'http://google.com.br',
      url_status_change_notification: 'http://google.com.br'
    }
  end

  it "can't run without arguments" do
    lambda { ebanx.do_merchant_integration_properties }.must_raise ArgumentError
  end


  it "performs a successful merchant integration properties" do
    response = ebanx.do_merchant_integration_properties @params
    response.http_code.must_equal 201
    response.response['status'].must_equal 'SUCCESS'
  end
end