require 'rails_helper'

describe MoviesController do 

  let!(:movies) { 20.times { create(:movie) } }

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

    it "should return a movie's details" do
      get :show, params: {id: Movie.all.last.id}
    end
    # returns movie with id 10
  end

  describe 'GET /movies?items=10' do    
    it 'should return 10 items only' do
      get :index, params: { items: 10 }
      expect(json.count).to eq(10)
    end
  end

  describe 'GET /movies?date=2017-04-10' do
    it 'should return movies created the week before 2017-01-01' do
      get :index, params: { date: '2017-04-10' }
      expect(json.count).to eq(10)
    end
    # returns movies created this week (from wednesday to wednesday) 
  end

end