require_relative '../test_helper'

describe Ebanx::Command::Zipcode do
  it "can't run without arguments" do
    lambda { ebanx.do_zipcode }.must_raise ArgumentError
  end
end