module Mutations
  class DestroyPost < BaseMutation
    argument :id, Integer, required: true
    field :message, String, null: true
    field :error, String, null: true
    def resolve(id:)
    post = Post.find_by_id(id)
    return { error: "Post not exist" } unless post
    post.destroy!
     { message: "UserID was deleted sucessfully" }
    end
  end
end
