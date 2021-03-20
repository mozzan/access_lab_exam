Fabricator(:vote_token) do
  token { SecureRandom.urlsafe_base64 }
end
