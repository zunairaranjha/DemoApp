# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :encrypted_password, String, null: false
    field  :reset_password_token,String, null: false
     field :name, String, null: true

    field :token, String
  end
end
