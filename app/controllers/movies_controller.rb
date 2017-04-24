class MoviesController < ApplicationController

  def index
    case 
    when params[:items]
      @movies = Movie.all.limit(params[:items].to_i)
    when params[:date]
      date = Date.parse(params[:date])
      kick_off = last_wednesday(date)
      binding.pry
      @movies = Movie.where('CREATED_AT < ? OR CREATED_AT > ?', kick_off.to_s, kick_off.to_s)
      # ensure correct format
    else
      @movies = Movie.all
    end
    @movies.order!(created_at: :desc) unless @movies.nil?
    render json: @movies
  end

  def show
    @movie = Movie.find(params[:id])
    if stale?(last_modified: @movie.updated_at)
      render json: @movie
    end
  end

  private


  def last_wednesday(now)
    7.times do
      if now.wednesday?
        last_day = now
        break
      else
        now -= 1.day
      end
    end
    now
    
  end

end