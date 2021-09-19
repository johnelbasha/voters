class CreateCampaignCanidateResults < ActiveRecord::Migration[6.1]
  def change
    create_table :campaign_canidate_results do |t|
      t.references :campaign, null: false, foreign_key: true
      t.references :candidate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
