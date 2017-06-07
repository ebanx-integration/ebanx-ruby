require_relative '../test_helper'

describe Ebanx::Command::TransferCreate do
  it "gets EBANX Exception for Invalid Amount" do
    err = lambda { ebanx.do_transfer_create({amount: "AAAA"}) }.must_raise EbanxApiException
    assert_equal('Invalid amount', err.message)
  end

  it "can't run without arguments" do
    lambda { ebanx.do_transfer_create }.must_raise ArgumentError
  end
end
