class CreateDonationsTransaction < ActiveRecord::Migration
  def change
		create_table :donation_transactions do |t|
			t.integer :user_id
			t.datetime :date_time
			t.float :amount_donated
			t.float :fees_accessed
			t.string :paypal_transiction
			t.string :bitcoin_transaction
			t.integer :bitcoins_donated_amount
			t.string :google_transaction
			t.string :payment_method
			t.integer :campaign_id
			t.string :email_address
			t.string :first_name
			t.string :last_name
			t.string :address
			t.integer :zip
			t.string :country
			t.string :phone
			t.string :publish_message
			t.boolean :ok_to_publish
			t.string :publish_alias_name
			
			t.timestamps
		end
  end

end
