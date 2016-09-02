require_relative '../test_helper'

describe Ebanx::Command::GetMerchantSettlementInfo do
  it 'performs a successful settlement info' do
    params = { nil: nil }
    response = ebanx.do_get_merchant_settlement_info params
    response.http_code.must_equal 200
    response.response['status'].must_equal 'SUCCESS'
  end
end