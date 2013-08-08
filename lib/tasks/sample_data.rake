namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

    jay  = User.create!(name: "Jay Chetty",
                         email: "jaypaulchetty@gmail.com",
                         password: "password",
                         password_confirmation: "password"
                         )

    rb  = User.create!(name: "Buddy One",
                         email: "bud1@gmail.com",
                         password: "password",
                         password_confirmation: "password"
                         )

    kh  = User.create!(name: "Buddy Two",
                         email: "bud2@gmail.com",
                         password: "password",
                         password_confirmation: "password"
                         )

    mf = User.create!(name: "Buddy Three",
                         email: "bud3@gmail.com",
                         password: "password",
                         password_confirmation: "password"
                         )     

    rh = User.create!(name: "Buddy Four",
                         email: "bud4@gmail.com",
                         password: "password",
                         password_confirmation: "password"
                         )                                                                              


    jayq = jay.quotes.create!(body: "This is what you shall do; Love the earth and sun and the animals, despise riches, 
    	give alms to every one that asks, stand up for the stupid and crazy, devote your income and labor to others, hate tyrants, argue not concerning God, have patience and indulgence toward the people, take off your hat to nothing 
    	known or unknown or to any man or number of men, go freely with powerful uneducated persons and with the young and 
    	with the mothers of families, read these leaves in the open air every season of every year of your life, re-examine
    	all you have been told at school or church or in any book, dismiss whatever insults your own soul, and your very flesh 
    	shall be a great poem and have the richest fluency not only in its words but in the silent lines of its lips and face 
    	and between the lashes of your eyes and in every motion and joint of your body." ,author: "Walt Whitman")

    mfq = mf.quotes.create!(body: "Ever tried. Ever failed. No matter. Try again. Fail again. Fail better " ,author: "Samuel Beckket")

    rbq = rb.quotes.create!(body: "Be the change you want to see in the world  " ,author: "Gandhi")

	  rhq = rh.quotes.create!(body: "Science and technology would be used as though, like the Sabbath, they 
			had been made for man, not (as at present and still more so in the Brave New World) as though man were 
			to be adapted and enslaved to them " ,author: "Aldous Huxley")

    khq = kh.quotes.create!(body: "Our greatest weakness lies in giving up. The most certain way to succeed is always to try just one more time" ,author: "Thomas A. Edison")

	  jay.current_quote_id = jayq.id
    mf.current_quote_id = mfq.id
    kh.current_quote_id = khq.id
    rb.current_quote_id = rbq.id
    rh.current_quote_id = rhq.id

    jay.shelves.create(name: "Dystopia/Utopia")
    jay.shelves.create(name: "Fantasy")
    jay.shelves.create(name: "Sport Inspirational")
    jay.shelves.create(name: "Quantum Strangeness")
    jay.shelves.create(name: "Soul Party")
    jay.shelves.create(name: "Right")
    jay.shelves.create(name: "African Party")
    jay.shelves.create(name: "90/00 RnB")

    kh.shelves.create(name: "Lies")
    kh.shelves.create(name: "Medical")

    rh.shelves.create(name: "Magic")
    rh.shelves.create(name: "Fantasy")

    rb.shelves.create(name: "Disturbing")
    rb.shelves.create(name: "Beyonce etc!")    

    mf.shelves.create(name: "Wierd")
    mf.shelves.create(name: "Classic")        

    User.update_all(:confirmed_at => Time.now)

	jay.save
    kh.save
    rb.save
    mf.save
    rh.save


	end
end