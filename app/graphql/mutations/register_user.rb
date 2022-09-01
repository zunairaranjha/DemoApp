module Mutations
  class RegisterUser < BaseMutation
field :user, Types::UserType, null: false do
argument :email, String, required: true
    argument :password, String, required: true
    argument :name, String, required: true
      end
    def resolve(**args)
      user = User.new(args)
      if user.save
        user
      else
        raise GraphQL::ExecutionError.new("Register Failed!")
      end
    end
    
    
    end
    end
    
    
 
