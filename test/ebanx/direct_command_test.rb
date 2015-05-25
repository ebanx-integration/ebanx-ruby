require_relative '../test_helper'

describe Ebanx::Command::Direct do
  before do
    @params = {
      payment: {
        name: 'João da Silva',
        email: 'joao@mailinator.com',
        currency_code: 'BRL',
        amount_total: 100.50,
        merchant_payment_code: Random.rand(10000000000),
        payment_type_code: 'boleto',
        document: '13326724691',
        birth_date: '01/01/1980',
        zipcode: '70000-000',
        address: 'Rua Brasil',
        street_number: '1',
        city: 'Brasília',
        state: 'DF',
        country: 'br',
        phone_number: '6130001111',
        due_date: (Time.now + 86400).strftime('%d/%m/%Y')
      }
    }
  end

  it "can't run without arguments" do
    lambda { ebanx.do_direct }.must_raise ArgumentError
  end

  it "performs a successful request" do
    response = ebanx.do_direct @params
    response.http_code.must_equal 200
    response.response['status'].must_equal 'SUCCESS'
  end
end