module Mutations
  class CreatePostMutation < BaseMutation
    field :post, Types::PostType, null: false

     argument :title, String, required: true do
      description "Title field is a string type."
     end
    argument :content, String required: true do
    description "Main content."
    end
   
  def resolve(title:, content:)
    @post = Post.new(title: title, content: content)
    
    if (@post.save)
      {
        post: @post,
        errors: []
    }
  else {
    posts: nil,
    errors: @post.errors.full_message
      }
    end
end
end
