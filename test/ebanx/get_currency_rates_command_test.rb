require_relative '../test_helper'

describe Ebanx::Command::GetCurrencyRates do
  it "performs a successful" do
    params = {
        currency_codes: ['USD','EUR'],
        currency_base_codes: ['BRL','CLP']
    }

    response = ebanx.do_get_currency_rates params

    response.http_code.must_equal 200
    response.response['status'].must_equal 'SUCCESS'
    assert_equal 4, response.response['currency_rates'].size
  end
end
