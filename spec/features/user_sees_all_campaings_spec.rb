require 'rails_helper'



RSpec.feature 'Visit Homepage' do

  before do
    @campaign_one = Campaign.create(campaign_key: "ssss_uk_01B")
    @campaign_two = Campaign.create(campaign_key: "Emmerdale")
    @campaign_three = Campaign.create(campaign_key: "ssss_uk_02A")
    @candidate_one = Candidate.create(name: "Anthony")
    @candidate_two = Candidate.create(name: "Leon")
    @candidate_three = Candidate.create(name: "Tupele")
    @candidate_four = Candidate.create(name: "Jane")
    @candidate_void = Candidate.create(name: "VOID")
    @c_c_r_one = CampaignCanidateResult.create(campaign: @campaign_one, candidate: @candidate_one, Votes: 65)
    @c_c_r_two = CampaignCanidateResult.create(campaign: @campaign_one, candidate: @candidate_two, Votes: 55)
    @c_c_r_three = CampaignCanidateResult.create(campaign: @campaign_one, candidate: @candidate_three, Votes: 25)
    @c_c_r_four = CampaignCanidateResult.create(campaign: @campaign_one, candidate: @candidate_void, Votes: 4)
    @c_c_r_five = CampaignCanidateResult.create(campaign: @campaign_two, candidate: @candidate_one, Votes: 100)
    @c_c_r_six = CampaignCanidateResult.create(campaign: @campaign_two, candidate: @candidate_four, Votes: 90)
    @c_c_r_seven = CampaignCanidateResult.create(campaign: @campaign_three, candidate: @candidate_two, Votes: 43)
    @c_c_r_eight = CampaignCanidateResult.create(campaign: @campaign_three, candidate: @candidate_four, Votes: 29)
  end

  scenario 'a visitor sees a list of campaigns on the homepage' do
    homepage_title = 'Voting Campaign Data'
    visit "/"
    expect(page).to have_content(homepage_title)
    expect(page).to have_link(@campaign_one.campaign_key)
    expect(page).to have_link(@campaign_two.campaign_key)
    expect(page).to have_link(@campaign_three.campaign_key)
  end
end


