require 'spec_helper'

describe CreateUser do
  let(:interactor) { CreateUser.new }
  let(:attributes) { Hash[] }

  it "succeeds" do
    expect(interactor.call(attributes)).to be_a_success
  end
end