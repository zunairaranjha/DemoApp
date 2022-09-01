# module Mutations
#   class Login < BaseMutation
#         field :user,Types::UserType, null: false do
#       argument :email, String, required: true
#       argument :password, String, required: true
#       argument :name, String, required: true

#      end
#      def resolve(email:, password:, name:)
#       user= User.find_by(email: email)
#       if user && user.valid_password?(password)      
#          user.token = user.to_sgid(expires_in: 10.minutes, for:'graphql')    
#          puts "Token :==>:==>:==>:==>:==>:==>:==>:==>#{user.token}"
#         user
#       else
#         raise GraphQL::ExecutionError.new("Invalid email or password")
#       end
#     end
# end
# end
