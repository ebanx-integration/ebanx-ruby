require_relative '../test_helper'

describe Ebanx::Command::GetMerchantSettlementStatement do
  it 'performs a successful settlement statement' do
    params = { start_date: '2016-11-01', end_date: '2016-11-03' }
    response = ebanx.do_get_merchant_settlement_statement params
    response.http_code.must_equal 200
    response.response['status'].must_equal 'SUCCESS'
  end
end