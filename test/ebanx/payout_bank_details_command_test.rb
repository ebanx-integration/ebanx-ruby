require_relative '../test_helper'

describe Ebanx::Command::PayoutBankDetails do
  it "performs a successful" do
    response = ebanx.do_payout_bank_details
    response.http_code.must_equal 200
  end
end
