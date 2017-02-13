require_relative '../test_helper'

describe Ebanx::Command::Request do
  before do
    @params = {
      name: 'João da Silva',
      email: 'joao@mailinator.com',
      currency_code: 'BRL',
      amount: 100.00,
      merchant_payment_code: Random.rand(10000000000),
      payment_type_code: 'boleto',
    }
  end

  it "can't run without arguments" do
    lambda { ebanx.do_request }.must_raise ArgumentError
  end

  it "performs a successful request" do
    response = ebanx.do_request @params
    response.http_code.must_equal 200
    response.response['status'].must_equal 'SUCCESS'
  end
end
