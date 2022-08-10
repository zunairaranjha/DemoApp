# frozen_string_literal: true

module Types
  class AuthProviderCredentialsInputType < Types::BaseObject
    graphql_name 'AUTH_PROVIDER_CREDENTIALS'

    argument :email, String, required: false
    argument :password, String, required: false
  end
end
