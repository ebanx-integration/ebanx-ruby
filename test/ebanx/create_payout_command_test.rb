require_relative '../test_helper'

describe Ebanx::Command::PayoutCreate do
  before do
    @params = {
      payee_id: '1001',
      payee_document: '805.968.720-46',
      external_reference: 'ext-001',
      amount: '10',
      country: 'br',
      currency_code: 'BRL',
      payee: {
        name: 'Payee Name',
        email: 'email@email.com',
        document: '805.968.720-46',
        document_type: 'cpf'
      }
    }
  end

  it "can't run without arguments" do
    lambda { ebanx.do_payout_create }.must_raise ArgumentError
  end

  it "request a payout with payee_id" do
    mock = Minitest::Mock.new
    request = Net::HTTP.new("https://sandbox.ebanxpay.com/ws/payout/create", @params)
    mock.expect(:http_code, 200)
    mock.expect(:response, { 'status' => 'SUCCESS'} )

    request.stub(:post, mock) do
      response = request.post("/ws/payout/create", @params)

      response.http_code.must_equal 200
      response.response['status'].must_equal 'SUCCESS'
    end
  end

  it "request a payout without invoice" do
    mock = Minitest::Mock.new
    request = Net::HTTP.new("https://sandbox.ebanxpay.com/ws/payout/create", @params)
    mock.expect(:http_code, 200)
    mock.expect(:response, { 'status' => 'SUCCESS'} )

    request.stub(:post, mock) do
      response = request.post("/ws/payout/create", @params)

      response.http_code.must_equal 200
      response.response['status'].must_equal 'SUCCESS'
    end
  end
end
