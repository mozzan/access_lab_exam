Fabricator(:vote) do
  topic { Faker::Lorem.sentences(1).join() }
  uid { SecureRandom.urlsafe_base64 }
end
