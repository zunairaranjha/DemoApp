class Mutations::RegisterUser < Mutations::BaseMutation

    argument :email, String, required: true
    argument :password, String, required: true
    argument :name, String, required: true
   
    field :user, Types::UserType, null: false 

    def resolve(**args)
      user = User.new(args)
      if user.save
        { user: user, errors: [] }

      else
        { user: nil, errors: user.errors.full_messages }
      end
    end
    
    
    end
    
    
 
