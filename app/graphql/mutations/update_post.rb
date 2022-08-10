module Mutations
  class UpdatePost < BaseMutation
    argument :id, Integer, required: true
    argument :title, String, required: true
    argument :content, String, required: true
    argument :user_id, Integer, required: true
    field :post, Types::PostType, null: true
    field :errors, [String], null: false
    def resolve(id:, user_id:, **attributes)
    post = Post.find_by_id(id)
    return { errors: ["Post not exist"] } unless post
    post = Post.find_by_id(user_id)
    return { errors: ["UserID not exist"] } unless post
    post.assign_attributes(attributes)
    if post.save
    { post: post, errors: [] }
    else
    { post: nil, errors: post.errors.full_messages }
    end
    end
  end
end
