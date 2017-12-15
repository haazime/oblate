class ArticleService < Oblate::Service

  def initialize(model: Article)
    @model = model
  end

  def post(user, params)
    return failure(params: params) unless params.valid?

    article = Article.create!(params)
    success(article: article)
  end
end
