require 'rails_helper'

describe MoviesController do 
  let!(:new_movies) { 10.times { create(:movie) } }
  before { Time.stub(:now).and_return(Time.mktime(2017, 03, 25)) }
  let!(:movies) { 10.times { create(:movie) } }

  describe 'GET /movies' do
    it 'answers a 200' do
      get :index
      expect(response).to be_success
    end

    it 'should return all the movies' do
      get :index
      expect(json.count).to eq(Movie.all.count)
    end

    it 'should return latest movies first' do
      get :index
      first_movie = Movie.find(json[0]['id'])
      last_movie = Movie.find(json[19]['id'])
      expect(first_movie.created_at).to be > last_movie.created_at
    end
  end

  describe 'GET /movies/10' do
    it 'answers a 200' do
      get :show, params: {id: Movie.all.last.id}
      expect(response).to be_success
    end
    # returns movie with id 10
  end

  describe 'GET /movies/1' do
    it "should return a movie's details" do
      get :show, params: {id: Movie.all.last.id}
    end
  end

  describe 'GET /movies?items=10' do    
    it 'should return 10 items only' do
      get :index, params: { items: 10 }
      expect(json.count).to eq(10)
    end
  end

# use gem delorean
  describe 'GET /movies?date=2017-04-25' do
    it 'should return movies updated the week before 2017-03-25' do
      Movie.all.limit(10).each do |m|
        m.title = 'a'
        m.save!
        m.reload
      end
      get :index, params: { date: '2017-03-25' }
      expect(json.count).to eq(10)
    end
    # returns movies created this week (from wednesday to wednesday) 
  end

end