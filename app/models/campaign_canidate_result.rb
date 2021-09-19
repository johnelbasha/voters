class CampaignCanidateResult < ApplicationRecord
  belongs_to :campaign
  belongs_to :candidate
end
