require_relative '../test_helper'

describe Ebanx::Command::TransferCancel do
  it "can't run without arguments" do
    lambda { ebanx.do_transfer_cancel }.must_raise ArgumentError
  end
end
