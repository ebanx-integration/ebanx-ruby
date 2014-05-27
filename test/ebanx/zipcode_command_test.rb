require_relative '../test_helper'

describe Ebanx::Command::Zipcode do
  before do
    @params = {
      zipcode: '80230010'
    }
  end

  it "can't run without arguments" do
    lambda { ebanx.do_zipcode }.must_raise ArgumentError
  end

  # Evil integration test
  it "performs a successful request" do
    response = ebanx.do_zipcode @params
    response.http_code.must_equal 200
    response.response['status'].must_equal 'SUCCESS'
  end
end