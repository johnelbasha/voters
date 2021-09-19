class CreateCampaigns < ActiveRecord::Migration[6.1]
  def change
    create_table :campaigns do |t|
      t.string :campaign_key

      t.timestamps
    end
  end
end
