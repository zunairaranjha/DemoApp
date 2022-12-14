module Types
  class QueryType < Types::BaseObject

   # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    # TODO: remove me
    
    #::==> query to show all users ====>
    field :users, [Types::UserType], null: true
    def users
      User.all
    end
    field :user, [Types::UserType], null: false do
      argument :id, ID, required: true
    end
    def user(id:)
      User.find(id)
    end   
   #::==> query to show all posts ====>
    field :posts, [Types::PostType], null: true,
      description: "Return list of Posts."
    def posts
     Post.all
    end
    field :post, Types::PostType, null: false do
      argument :id, ID, required: true
    end
    def post(id:)
      Post.find(id)
    end
    field :me, [Types::PostType], null: false,
    description: "Details on the authenticated  User."
    def me
     authenticate!
     current_user
   end
  end
end
