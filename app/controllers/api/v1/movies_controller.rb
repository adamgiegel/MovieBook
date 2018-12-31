class Api::V1::MoviesController < ApplicationController
  before_action :find_movie, only: [:update]
    def index
      @movies = Movie.all
      render json: @movies
    end

    def update
      @movie.update(movie_params)
      if @movie.save
        render json: @movie, status: :accepted
      else
        render json: { errors: @movie.errors.full_messages }, status: :unprocessible_entity
      end
    end

    private

    def movie_params
      params.permit(:title, :info)
    end

    def find_movie
      @movie = Movie.find(params[:id])
    end
  end
