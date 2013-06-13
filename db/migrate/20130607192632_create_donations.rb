class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.float :amount
      t.string :express_token
      t.string :ip_address
      t.integer :user_id
      t.string :express_payer_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.datetime :purchased_at
      t.timestamps
    end
  end
end
