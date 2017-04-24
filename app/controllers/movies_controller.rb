class MoviesController < ApplicationController

  def index
    @movies = Movie.all
    @movies = limit_by_date(params[:date]) if params[:date]
    @movies = limit_by_numbers(params[:items].to_i) if params[:items]
      # ensure correct format
  
    #binding.pry

    @movies.order!(created_at: :desc)
    render json: @movies
  end

  def show
    @movie = Movie.find(params[:id])
    if stale?(last_modified: @movie.updated_at)
      render json: @movie
    end
  end

  private

  def limit_by_date(d)
    date = Date.parse(d)
    kick_off = last_wednesday(date)
    Movie.where('created_at <= ?', d.to_s).where('created_at >= ?', kick_off.to_s)
  end

  def limit_by_numbers(num)
    Movie.all.limit(num)
  end

  def last_wednesday(now)
    days_since_last_wednesday = ((Time.now.wday) - 2) % 7
    now - days_since_last_wednesday.days
  end

end