require_relative '../test_helper'

describe Ebanx::Command::TransferSearch do
  it "can't run without arguments" do
    lambda { ebanx.do_transfer_search }.must_raise ArgumentError
  end
end
