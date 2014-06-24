require 'spec_helper'
require_relative '../../lib/judopay/models/payment'

describe Judopay::Payment do
  it "should list all payments" do
    stub_get('/transactions').
      to_return(:status => 200,
                :body => lambda { |request| fixture("transactions/all.json") })

    transactions = Judopay::Payment.all
    expect(transactions).to be_a(Hash)
    expect(transactions.results[0].amount).to equal(1.01)
  end
end