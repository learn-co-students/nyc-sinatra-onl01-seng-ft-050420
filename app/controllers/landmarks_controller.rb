class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :"/landmarks/index"
  end 
  
  get '/landmarks/new' do
    @figures = Figure.all
    erb :"/landmarks/new"
  end 

  post '/landmarks' do
    unless params[:landmark][:name].empty?
      landmark = Landmark.create(params[:landmark])
    end 

    unless params[:figure][:name].empty?
      landmark.figure = Figure.find_or_create_by(params[:figure])
    end 

    redirect to "/landmarks/#{landmark.id}"
  end 

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/show"
  end 

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :"/landmarks/edit"
  end 

  patch '/landmarks/:id' do
    landmark = Landmark.find(params[:id])
    landmark.update(params[:landmark])
    erb :"/landmarks/#{landmark.id}"
  end 

end
