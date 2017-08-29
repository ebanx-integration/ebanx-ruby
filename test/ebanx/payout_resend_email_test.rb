require_relative '../test_helper'

describe Ebanx::Command::PayoutResendEmail do
  it "can't run without arguments" do
    lambda { ebanx.do_payout_resend_email }.must_raise ArgumentError
  end
end
