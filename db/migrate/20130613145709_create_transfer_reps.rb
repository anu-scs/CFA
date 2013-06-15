class CreateTransferReps < ActiveRecord::Migration
	def change
		create_table :transfer_reps do |t|
			t.boolean :active
			t.string :name
			t.string :name_alt_search
			t.string :Short_description
			t.string :description
			t.string :phone
			t.string :fax
			t.string :party
			t.string :state
			t.string :type
			t.string :contact_url
			t.boolean :featured
			
			t.timestamps
		end
  end
end
