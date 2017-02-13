require_relative '../test_helper'

describe Ebanx::Command::PayoutSimulate do
  it "can't run without arguments" do
    lambda { ebanx.do_payout_simulate }.must_raise ArgumentError
  end

  it "performs a successful" do
    params = { amount: 10.0, country: 'br', currency_code: 'USD' }
    response = ebanx.do_payout_simulate params
    response.http_code.must_equal 200
    response.response['type'].must_equal 'success'
  end

end