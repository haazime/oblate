require 'spec_helper'

RSpec.describe Oblate::Service do
  let(:service_class) { ArticleService }
  let(:user) { double(:user) }
  let(:params) { double(:params) }

  describe 'call as class method' do
    it do
      expect_any_instance_of(service_class).to receive(:post).with(user, params)
      service_class.post(user, params)
    end
  end

  describe 'succeeded' do
    it do
      article = double(:article)

      allow(params).to receive(:valid?) { true }
      allow(Article).to receive(:create!) { article }

      service = service_class.new(model: Article)
      result = service.post(user, params)

      aggregate_failures do
        expect(result).to be_succeeded
        expect(result.article).to eq(article)
      end
    end
  end
end
