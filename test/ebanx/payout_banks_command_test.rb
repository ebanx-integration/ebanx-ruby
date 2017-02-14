require_relative '../test_helper'

describe Ebanx::Command::PayoutBanks do
  it "performs a successful" do
    response = ebanx.do_payout_banks
    response.http_code.must_equal 200
  end
end
