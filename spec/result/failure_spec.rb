require 'spec_helper'

RSpec.describe Oblate::Result::Failure do
  it do
    result = described_class.new

    aggregate_failures do
      expect(result).to_not be_succeeded
      expect(result).to be_failed
    end
  end

  it do
    params = double(:params)
    result = described_class.new(params: params, notified?: false)

    aggregate_failures do
      expect(result.params).to eq(params)
      expect(result).to_not be_notified
    end
  end
end
