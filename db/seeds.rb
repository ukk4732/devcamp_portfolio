10.times do |blog|
  Blog.create!(
    title: "Blog Title #{blog}",
    body: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur."
    )
end

puts "10 blogs post created"

5.times do |skill|
  Skill.create!(
    title: "Rails #{skill}",
    percent_utilize: 18
    )
end

puts "5 skills created"

9.times do |portfolio_item|
  Portfolio.create(
    title: "Portfolio title #{portfolio_item}",
    subtitle: "Portfolio subtitle",
    body: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content.",
    main_image: "https://via.placeholder.com/600x400/0000FF/808080%20?Text=Digital.com%20C/O%20https://placeholder.com/",
    thumb_image: "https://via.placeholder.com/350x200/0000FF/808080%20?Text=Digital.com%20C/O%20https://placeholder.com/"
    )
end

puts "9 portfolio item created"