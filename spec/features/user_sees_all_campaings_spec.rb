require 'rails_helper'

RSpec.feature 'Visit Homepage' do
  scenario 'a visitor sees a list of campaigns on the homepage' do
    homepage_title = 'Voting Campaign Data'

    visit "/"
    expect(page).to have_content(homepage_title)

  end
end