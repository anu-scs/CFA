class CreateViciservers < ActiveRecord::Migration
  def change
    create_table :viciservers do |t|
      t.string :name
      t.text :description
      t.text :db_connection_string
      t.string :server_ip

      t.timestamps
    end
  end
end
