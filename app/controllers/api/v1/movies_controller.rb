class Api::V1::MoviesController < ApplicationController
  before_action :find_movie, only: [:update, :destroy]
    def index
      @movies = Movie.all
      render json: @movies
    end

    def create#where the post request goes
      @movie = Movie.create(movie_params)
      if @movie.valid?
        redirect_to @movie
      else flash[:errors] = @movie.errors.full_messages
        redirect_to new_movie_path
      end
    end

    def update
      @movie.update(movie_params)
      if @movie.save
        render json: @movie, status: :accepted
      else
        render json: { errors: @movie.errors.full_messages }, status: :unprocessible_entity
      end
    end

    def destroy
      @movie.destroy
      redirect_to movies_path
    end

    private

    def movie_params
      params.require(:movie).permit(:title, :trailer, :info, :starring, :rating)
    end

    def find_movie
      @movie = Movie.find(params[:id])
    end
  end
