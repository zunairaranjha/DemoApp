class AddIpToUser < ApplicationRecord
    def change
        add_column :users, :ip, :string
      end
end
