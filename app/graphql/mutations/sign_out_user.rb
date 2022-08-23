module Mutations
  class SignOutUser < BaseMutation
    null true 
    argument :token, String, required: true
    field :token, String, null: false
    field :message, String, null: false
    def resolve(token:)
      user = User.find_by(token: token)
      if user
      user.token = "" 
      user.save!
      {
          token: user.token,
          message: "signout success!"
      }
      else
          context.add_error(GraphQL::ExecutionError.new("Invalid token", extensions: { "code" => "INVALID_TOKEN" }))
      end
    end
  end
end
