require_relative '../test_helper'

describe Ebanx::Command::GetMerchantSettlementExtract do
  it "can't run without arguments" do
    lambda { ebanx.do_get_merchant_settlement_extract }.must_raise ArgumentError
  end

  it 'performs a successful settlement extract' do
    params = {
        country_abbreviation: 'br',
        currency_code: 'USD',
        date_field: 'open_date',
        date: '2010-10-10',
        hour: '10:10'
    }

    response = ebanx.do_get_merchant_settlement_extract params
    response.http_code.must_equal 200
    response.response['status'].must_equal 'SUCCESS'
  end
end
