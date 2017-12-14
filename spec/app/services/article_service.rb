class ArticleService < Oblate::Service

  def initialize(model: Article)
    @model = model
  end

  def post(user, params)
    article = Article.create!(params)
    success(article: article)
  end
end
