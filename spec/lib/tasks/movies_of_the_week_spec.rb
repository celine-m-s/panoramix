#TODO: this is not working :(
# No message is created, even if the rake task works.
# I don't know how to test it.

RSpec.describe "movies:latests" do
  include_context "rake"
  it "creates new movies" do
    VCR.use_cassette('cinefil') do
      expect{ subject.invoke }.to change{ Movie.count }.by(14)
    end
  end

  # it "creates new messages" do
  #   VCR.use_cassette("twitter") do
  #     expect{ subject.invoke }.to change{ Message.count }.by(20)
  #   end

  # end
end
