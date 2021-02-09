puts "Starting seeds"

puts "Deleting old Messages"
Message.delete_all
puts "Messages cleaned"

puts "Creating new messages:"
50.times do
  message = Message.create(
    body: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true),
    counter: 0
  )
  puts "Message #{message.id} was created"
end

puts "Everything up to date"
