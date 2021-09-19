class AddVotesToCampaignCanidateResults < ActiveRecord::Migration[6.1]
  def change
    add_column :campaign_canidate_results, :Votes, :integer
  end
end
