#TODO: this is not working :(
# No message is created, even if the rake task works.
# I don't know how to test it.

describe "movies:movies_of_the_week" do
  include_context "rake"

  # it "creates new messages" do
  #   VCR.use_cassette("twitter") do
  #     expect{ subject.invoke }.to change{ Message.count }.by(20)
  #   end

  # end
end
