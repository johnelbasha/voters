# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

stringVotes = []
vote_string_prefix = "VOTE"
VALIDITY_LOCATOR = "Validity:"
campaign_locator = "Campaign:"
CHOICE_LOCATOR = "Choice:"
end_locator = "CONN:"
VALID_VOTE_MARKER = "during"


File.open("public/votes.txt", "r").each_line do |line|
  if line.start_with?(vote_string_prefix) # add other validations to this if statement
    stringVotes << line
  end
end

def extractCampaignKey(reduced_string, campaign_locator)
  validity_index = reduced_string.index(VALIDITY_LOCATOR)
  campaign_index = reduced_string.index(campaign_locator)
  return reduced_string[campaign_index+campaign_locator.length..validity_index-2]
end

def extractCandidateName(reduced_string, end_locator)
  candidate_index = reduced_string.index(CHOICE_LOCATOR)
  end_index = reduced_string.index(end_locator)
  return reduced_string[candidate_index+CHOICE_LOCATOR.length..end_index-2]
end


def retrieve_campaign_id(campaign_key)
  campaign = Campaign.new(campaign_key: campaign_key)
  if campaign.save
    return campaign.id
  else
    return Campaign.find_by(campaign_key: campaign_key).id
  end
end

def retrieve_candidate_id(candidate_name, validity)
  # if the candidate name contains an error , then try creating a candidate called "void" and return its error.
  # Will implement the above later once I start to see the errors
  if validity 
    candidate = Candidate.new(name: candidate_name)
    if candidate.save
      return candidate.id
    else
      return Candidate.find_by(name: candidate_name).id
    end
  else
    candidate = Candidate.new(name: "VOID")
    if candidate.save
      return candidate.id
    else
      return Candidate.find_by(name: "VOID").id
    end
  end
end

def valid?(reduced_string)
  validity_index = reduced_string.index(VALIDITY_LOCATOR)
  choice_index = reduced_string.index(CHOICE_LOCATOR)
  return reduced_string[validity_index+VALIDITY_LOCATOR.length..choice_index-2] === VALID_VOTE_MARKER
end


stringVotes.each do |vote|
  reduced_string = vote[5..]
  campaign_key = extractCampaignKey(reduced_string, campaign_locator)
  campaign_id = retrieve_campaign_id(campaign_key)
  validity = valid?(reduced_string)
  candidate_name = extractCandidateName(reduced_string, end_locator)
  candidate_id = retrieve_candidate_id(candidate_name, validity)
  # Look up the CampaignCandidateResults table to see if there is a record for these two ids
  c_c_r = CampaignCanidateResult.find_by(campaign_id: campaign_id, candidate_id: candidate_id)
  if c_c_r == nil
    new_c_c_r = CampaignCanidateResult.create(campaign_id: campaign_id, candidate_id: candidate_id, Votes: 1)
  else
    c_c_r.Votes += 1
    c_c_r.save
  end
end