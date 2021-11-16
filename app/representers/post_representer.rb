class PostRepresenter
  def initialize(post)
    @post = post
  end
  def as_json
    {
      id: post.id,
      title: post.title,
      content: post.content,
      category: post.category,
      image: post.img,
      details: {
        user: {
          id: post.user.id,
          email: post.user.email
        },
        created_at: post.created_at
      }
    }
  end
  private
  attr_reader :post
end