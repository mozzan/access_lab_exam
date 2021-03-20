vote = Fabricate(:vote, topic: "Do you agree Wuhan coronavirus is created by China.")
vote_option1 = Fabricate(:vote_option, vote: vote, name: "Agree")
vote_option2 = Fabricate(:vote_option, vote: vote, name: "Disagree")
vote_tokens = 10.times.map do ||
  Fabricate(:vote_token, vote: vote)
end