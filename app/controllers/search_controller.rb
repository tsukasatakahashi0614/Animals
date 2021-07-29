class SearchController < ApplicationController
  def search
    @genres = Genre.all
    @value = params['search']['value']         # データを代入
    @how = params['search']['how']             # データを代入
    @post = search_for(@how, @value) # def search_forを実行(引数に検索ワードと検索方法)
    @value = @value.to_i
    if @value != 0
      @genre = Genre.find(@value)
      p @value
    end
  end

  private

  def partical(value)
    Post.where('body LIKE ?', "%#{value}%").order(created_at: :desc)
  end

  def match(value)
    Post.where(body: value).or(Post.where(genre_id: value)).order(created_at: :desc)
  end

  def search_for(how, value)
    case how                     # 引数のhowと一致する処理に進むように定義しています。
    when 'match'                 # ジャンル検索の場合はmatchで固定してるので、必ず'match'の処理に進みます。
      match(value)
    when 'partical'
      partical(value)
    end
  end
end
