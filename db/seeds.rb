10.times do |blog|
    Blog.create!(
        title: "BP #{blog}",
        body: "adido"
    ) 
end

puts "10 blog posts created"

5.times do |skill|
    Skill.create!(
        title: "Rails #{skill}",
        percent_utilized: 20
    ) 
end

puts "5 skills created"

9.times do |portfolio_item|
    Portfolio.create!(
        title: "PI #{portfolio_item}",
        subtitle: "IP",
        body: "adido",
        main_image: "http://placehold.it/600x400",
        thumb_image:"http://placehold.it/350x200"
    ) 
end

puts "9 portfolio items created"