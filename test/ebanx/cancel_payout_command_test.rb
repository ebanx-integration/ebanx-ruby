require_relative '../test_helper'

describe Ebanx::Command::PayoutCancel do
  it "can't run without arguments" do
    lambda { ebanx.do_payout_cancel }.must_raise ArgumentError
  end
end
