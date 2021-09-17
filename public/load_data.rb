stringVotes = []
vote_string_prefix = "VOTE"

File.open("public/sample.txt", "r").each_line do |line|
  if line.start_with?(vote_string_prefix)
    stringVotes << line
  end
end

# Now that we have an array with all the votes, we can loop over the array and some logic.
# For each votes in the array,
# instantiate a new Vote instance with the timestamp
