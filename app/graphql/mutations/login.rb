class Mutations::Login < Mutations::BaseMutation
    argument :email, String, required: true
      argument :password, String, required: true
       argument :name, String, required: true
       field :errors, [String], null: false

       field :user, Types::UserType, null: false 

     def resolve(email:, password:, name:)
      user= User.find_by(email: email)
      if user && user.valid_password?(password)      
         user.token = user.to_sgid(expires_in: 10.minutes, for:'graphql')    
         puts "Token :==>:==>:==>:==>:==>:==>:==>:==>#{user.token}"
         { user: user, errors: [] }
        else
          { user: nil, errors: user.errors.full_messages }
        end
    end
end
 
