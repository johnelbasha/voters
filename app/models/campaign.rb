class Campaign < ApplicationRecord
  has_many :campaign_canidate_results

  validates :campaign_key, presence: true
  validates :campaign_key, uniqueness: true

end
