module Types
  class MutationType < Types::BaseObject
    field :sign_out_user, mutation: Mutations::SignOutUser
      # TODO: remove me
      field :create_post, mutation: Mutations::CreatePost
      field :update_post, mutation: Mutations::UpdatePost
      field :destroy_post, mutation: Mutations::DestroyPost
  
# Login User method==========>
    field :login,Types::UserType, null: false do
      argument :email, String, required: true
      argument :password, String, required: true
     end
     def login(email:, password:)
      user= User.find_by(email: email)
      if user && user.valid_password?(password)      
         user.token = user.to_sgid(expires_in: 10.minutes, for:'graphql')    
         puts "Token :==>:==>:==>:==>:==>:==>:==>:==>#{user.token}"
        user
      else
        raise GraphQL::ExecutionError.new("Invalid email or password")
      end
    end
# Register User method==========>
field :register, Types::UserType, null: false do
argument :email, String, required: true
argument :password, String, required: true
end
def register(**args)
  user= User.new(args)
  if user.save
    user
  else
    raise GraphQL::ExecutionError.new("Register Failed!")
  end
end


end
end

