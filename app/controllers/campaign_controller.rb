class CampaignController < ApplicationController
  def index
    @campaigns = Campaign.all
  end

  def show
    @campaign = Campaign.find(params[:id])
    @void_candidate = Candidate.find_by(name: "VOID")
    @void_candidate = @campaign.campaign_canidate_results.find_by(candidate: @void_candidate)
    if @void_candidate
      @void_vote_count = @void_candidate.Votes
    else
      @void_vote_count = 0
    end
    
  end
end
