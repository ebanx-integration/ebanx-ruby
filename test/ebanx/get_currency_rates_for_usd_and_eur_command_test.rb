require_relative '../test_helper'

describe Ebanx::Command::GetCurrencyRatesForUsdAndEur do
  it "performs a successful" do
    params = { nil: nil }
    response = ebanx.do_get_currency_rates_for_usd_and_eur params
    response.http_code.must_equal 200
    response.response['status'].must_equal 'SUCCESS'
  end
end
