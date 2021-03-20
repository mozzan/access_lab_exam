module InitHelper
  def init_vote_sample
    @vote = Fabricate(:vote)
    @vote_option1 = Fabricate(:vote_option, vote: @vote)
    @vote_option2 = Fabricate(:vote_option, vote: @vote)
    @vote_tokens = 10.times.map do ||
      Fabricate(:vote_token, vote: @vote)
    end
  end
end