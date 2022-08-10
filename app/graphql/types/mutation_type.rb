module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :create_post, mutation: Mutations::CreatePost
    field :update_post, mutation: Mutations::UpdatePost
    field :destroy_post, mutation: Mutations::DestroyPost

    field :create_user, mutation: Mutations::CreateUser
    field :create_link, mutation: Mutations::CreateLink
    

  end
end
