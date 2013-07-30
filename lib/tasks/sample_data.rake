namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

    jay  = User.create!(name: "Jay Chetty",
                         email: "jaypaulchetty@gmail.com",
                         password: "password",
                         password_confirmation: "password")


    jq1 = jay.quotes.create!(body: "This is what you shall do; Love the earth and sun and the animals, despise riches, 
    	give alms to every one that asks, stand up for the stupid and crazy, devote your income and labor to others, hate tyrants, argue not concerning God, have patience and indulgence toward the people, take off your hat to nothing 
    	known or unknown or to any man or number of men, go freely with powerful uneducated persons and with the young and 
    	with the mothers of families, read these leaves in the open air every season of every year of your life, re-examine
    	all you have been told at school or church or in any book, dismiss whatever insults your own soul, and your very flesh 
    	shall be a great poem and have the richest fluency not only in its words but in the silent lines of its lips and face 
    	and between the lashes of your eyes and in every motion and joint of your body." ,author: "Walt Whitman")

    jq2 = jay.quotes.create!(body: "Ever tried. Ever failed. No matter. Try again. Fail again. Fail better " ,author: "Samuel Beckket")

    jq3 = jay.quotes.create!(body: "Be the change you want to see in the world  " ,author: "Gandhi")

	  jq4 = jay.quotes.create!(body: "Science and technology would be used as though, like the Sabbath, they 
			had been made for man, not (as at present and still more so in the Brave New World) as though man were 
			to be adapted and enslaved to them " ,author: "Aldous Huxley")



	jay.current_quote_id = jq1.id


    jay.shelves.create(name: "Dystopia/Utopia")
    jay.shelves.create(name: "Fantasy")


	jay.save


	end
end