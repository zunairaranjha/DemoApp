class CreateAddIpToUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :add_ip_to_users do |t|
      #add_column :users, :ip, :string

      t.timestamps
    end
  end
end
