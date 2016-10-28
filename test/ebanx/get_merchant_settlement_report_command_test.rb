require_relative '../test_helper'

describe Ebanx::Command::GetMerchantSettlementReport do
  it 'performs a successful settlement report' do
    params = { settlement_id: 100 }
    response = ebanx.do_get_merchant_settlement_report params
    response.http_code.must_equal 200
    response.response['status'].must_equal 'SUCCESS'
  end
end