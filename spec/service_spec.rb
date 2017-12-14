require 'spec_helper'
require 'article_service'

RSpec.describe 'call application service' do
  it do
    user = double(:user)
    params = double(:params)

    expect_any_instance_of(ArticleService).to receive(:post).with(user, params)
    ArticleService.post(user, params)
  end
end
