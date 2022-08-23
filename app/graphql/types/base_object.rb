module Types
  class BaseObject < GraphQL::Schema::Object
  
    private
def current_user
  context[:current_user]
end

def authenticate!
   if current_user.blank?
     raise GraphQL::ExecutionError, "Authentication failed, you must be signed in!"

  end
end
  end
end
