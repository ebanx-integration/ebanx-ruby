require_relative '../test_helper'

describe Ebanx::Command::GetMerchantAmountBalanceByCountry do
  it 'performs a successful account balance by country' do
    params = { country_abbreviation: 'br' }
    response = ebanx.do_get_merchant_amount_balance_by_country params
    response.http_code.must_equal 200
    response.response['status'].must_equal 'SUCCESS'
  end

  it "can't run without arguments" do
    lambda { ebanx.do_get_merchant_amount_balance_by_country }.must_raise ArgumentError
  end
end