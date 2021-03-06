class PostsRepresenter
  def initialize(posts)
    @posts = posts
  end
  def as_json
    @posts.map do |post|
      {
        id: post.id,
        title: post.title,
        created_at: post.created_at
      } 
    end
  end
  private
    attr_reader :posts
end