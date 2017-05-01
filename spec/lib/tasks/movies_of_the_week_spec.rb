RSpec.describe "movies:latests" do
  include_context "rake"
  it "creates new movies" do
    VCR.use_cassette('cinefil') do
      expect{ subject.invoke }.to change{ Movie.count }.by(14)
    end
  end
end
