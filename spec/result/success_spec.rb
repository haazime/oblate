require 'spec_helper'

RSpec.describe Oblate::Result::Success do
  it do
    result = described_class.new

    aggregate_failures do
      expect(result).to be_succeeded
      expect(result).to_not be_failed
    end
  end

  it do
    resource = double(:resource)
    result = described_class.new(resource: resource, notified?: true)

    aggregate_failures do
      expect(result.resource).to eq(resource)
      expect(result).to be_notified
    end
  end
end
