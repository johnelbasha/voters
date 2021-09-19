require 'rails_helper'

RSpec.feature 'View an individual campaign' do

  before do
    CampaignCanidateResult.destroy_all
    Candidate.destroy_all
    Campaign.destroy_all
    @campaign= Campaign.create(campaign_key: "ssss_uk_01B")
    @candidate_one = Candidate.create(name: "Anthony")
    @candidate_two = Candidate.create(name: "Leon")
    @candidate_three = Candidate.create(name: "Tupele")
    @candidate_void = Candidate.create(name: "VOID")
    @c_c_r_one = CampaignCanidateResult.create(campaign: @campaign, candidate: @candidate_one, Votes: 65)
    @c_c_r_two = CampaignCanidateResult.create(campaign: @campaign, candidate: @candidate_two, Votes: 55)
    @c_c_r_three = CampaignCanidateResult.create(campaign: @campaign, candidate: @candidate_three, Votes: 25)
    @c_c_r_four = CampaignCanidateResult.create(campaign: @campaign, candidate: @candidate_void, Votes: 4)
  end

  scenario 'a visitor clicks on a link to view a campaign' do
    visit "/"
    click_link @campaign.campaign_key
    expect(page).to have_current_path(campaign_path(@campaign))
    expect(page).to have_content(@campaign.campaign_key)
    expect(page).to have_content(@candidate_one.name)
    expect(page).to have_content(@c_c_r_one.Votes)
    expect(page).to have_content(@candidate_two.name)
    expect(page).to have_content(@c_c_r_two.Votes)
    expect(page).to have_content(@candidate_three.name)
    expect(page).to have_content(@c_c_r_three.Votes)
    expect(page).to have_content(@candidate_void.name)
    expect(page).to have_content(@c_c_r_four.Votes)
  end
end


