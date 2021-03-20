Fabricator(:vote_option) do
  name { Faker::Lorem.sentences(1).join() }
  option_uid { SecureRandom.urlsafe_base64 }
end
