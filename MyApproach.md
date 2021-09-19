# My Approach for solving this challenge

I have marked-up the specification by dividing it into numbered parts in the README.md file. Please refer to the numbering there for explanatory notes below:

Requirement (1) is really straightforward. It is merely creating a rails app which already comes with a database selection by default. No brainer.

Requirement (2a) requires that there is a route such as /campaigns which uses the campaigns controller index action.

Requirement (2b) requires that each listing on the index page serves as anchor tag which upon clicking will use a route such as /campaigns/5 which uses the campaigns controller show action. The page should then show the candidates, their respective scores, and also the number of messages that were sent in but not counted (because they were too early, too late, etc...)

From the above and from the sample votes.txt file, it is possible to make some database design considerations. Firstly, the database management system should be selected to make sure the app performs its functions well. Considering the high number of records (12,966) in the .txt file, I begin to ask if the default SQLite3 DBMS will be able to do the job. I'm not sure, so I'm going to chose PostgreSQL for this app without putting any more design time into this area.

The more important aspect for the database design is the schema and from the information provided, I gather that something along the following lines will be needed:

Table 1) Candidates
Table 2) Campaigns
Table 3) CampaignCandidatesResults

To best describe how they fit with each other, I sketched it in Figure 1 (/public/figure 1.png). Any votes that contain errors but still need to be counted, will be set for a candidated named "void". A sketch of what the UI should show on each page is shown in Figure 2 in the public folder.

Essentially how the system works is that the votes.txt file is imported and each line in the code creates:
  1) A new candidate in the candidates table if the name doesn't already exist in the candidates table. Otherwise it will retrive the candidate ID.
  2) A new campaign in the campaigns table if the name of the campaign doesn't already exist in the campaigns table. Otherwise it will retrive the campaign ID.
  3) Lookup the CampaignCandidateResults table and see if there is a row containing the candidate id and campaign id set. if it doesn't exisit, create this new row and set the vote_count to 1. if it does exist, then increase the value of vote_count by 1.

Apart from controllers, I will need to create models for these three tables.

With regards to testing, I will use RSpec and capybara.

---------------------------------------
Working Notes:
1- Figure out how to import/parse a text file. I've done this before for csv files, but never for text. Since the file is huge, I will take a simplified approach and create a different version of the file that only has 30 votes. Once I get this to work, I can expand it to include the rest of the data set. I will create a file called public/load_data.rb to handle all the logic. A now Regex!! Its been a long time, so I had to look up a few resources to remember who to extract the data I wanted. Considering the task is meant to be done in less than 2 hours, I will forgo using a regex pattern and will do it a longer way. I have put the script to parse the votes.txt file into the database in the /db/seed file. this means when you want to import the data, you need to follow these steps: 1) move your votes.txt file into the "public" folder. 2) in the terminal: "rails db:migrate" followed by "rails db:seed". This final command may take a few minutes to complete.





