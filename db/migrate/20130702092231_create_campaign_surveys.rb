class CreateCampaignSurveys < ActiveRecord::Migration
  def change
    create_table :campaign_surveys do |t|
      t.integer :campaign_id
      t.integer :survey_num
      t.string :survey_question
      t.string :survey_option1
      t.string :survey_option2
      t.string :survey_option3
      t.string :survey_option4
      t.string :survey_option5
      t.string :survey_option6
      t.string :survey_option7
      t.string :survey_option8
      t.string :survey_option9
      t.string :survey_option10
      t.string :survey_option11
      t.string :survey_option12
      t.string :survey_option13
      t.string :survey_option14
      t.string :survey_option15
      t.timestamps
    end
  end
end
