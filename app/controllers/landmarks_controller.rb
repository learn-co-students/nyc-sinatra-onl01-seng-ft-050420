class LandmarksController < ApplicationController
  # add controller methods

  get '/landmarks' do
    erb :'landmarks/index'
  end


  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  get '/landmarks' do
    @landmarks = Landmark.all
    @figures = Figure.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  post '/landmarks' do
    name = params[:landmark][:name]
    year_completed = params[:landmark][:year_completed]
    landmark = Landmark.create(name: name)
    landmark.year_completed = year_completed
    landmark.save

    redirect '/landmarks'
  end

  get '/landmarks/:id' do
    id = params[:id]
    @landmark = Landmark.find(id)
    erb :"landmarks/show"
  end

  get '/landmarks/:id/edit' do
    id = params[:id]
    @landmark = Landmark.find(id)
    erb :"landmarks/edit"
  end

  patch '/landmarks/:id' do
    id = params[:id]
    name = params['landmark']['name']
    year_completed = params['landmark']['year_completed']

    @landmark = Landmark.find(id)
    @landmark.name = name
    @landmark.year_completed = year_completed

    @landmark.save

    redirect "/landmarks/#{@landmark.id}"
  end
end
