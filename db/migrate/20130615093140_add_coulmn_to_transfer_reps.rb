class AddCoulmnToTransferReps < ActiveRecord::Migration
  def change
		add_column :transfer_reps, :dc_address, :text
		add_column :transfer_reps, :dc_phone, :string
		add_column :transfer_reps, :dc_fax, :string
		add_column :transfer_reps, :homepage_url, :string
		add_column :transfer_reps, :twitter, :string
		add_column :transfer_reps, :district_offices, :text
		add_column :transfer_reps, :party_code, :string
		add_column :transfer_reps, :district_code, :string
		add_column :transfer_reps, :scrape_member_code, :string
		add_column :transfer_reps, :party_name, :string
		add_column :transfer_reps, :leadership, :string
		add_column :transfer_reps, :freshman, :string
		add_column :transfer_reps, :first_elected_to_office, :string
		add_column :transfer_reps, :year_of_next_election, :string
		add_column :transfer_reps, :previous_political_work, :text
		add_column :transfer_reps, :committee_membership, :text
		add_column :transfer_reps, :gender, :string
		add_column :transfer_reps, :hometown, :string
		add_column :transfer_reps, :professional_experience, :text
		add_column :transfer_reps, :education, :string
		add_column :transfer_reps, :family, :string
		add_column :transfer_reps, :faith, :string
		add_column :transfer_reps, :organizational_memberships, :text
  end
end
