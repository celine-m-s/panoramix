RSpec.describe "movies:latests" do
  # Movies are updated on Monday :)
  before { Time.stub(:now).and_return(Time.mktime(2017, 05, 15)) }
  include_context "rake"
  it "creates new movies" do
    VCR.use_cassette('cinefil') do
      expect{ subject.invoke }.to change{ Movie.count }.by(14)
    end
  end
end
