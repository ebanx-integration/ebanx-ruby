require_relative '../test_helper'

describe Ebanx::Command::GetMerchantIntegrationProperties do
  it "performs a successful" do
    params = { nil: nil }
    response = ebanx.do_get_merchant_integration_properties params
    response.http_code.must_equal 200
    response.response['status'].must_equal 'SUCCESS'
  end
end
