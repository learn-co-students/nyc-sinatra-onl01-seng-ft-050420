class FiguresController < ApplicationController
  # add controller methods

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    figure = params[:figure]
    @figure = Figure.create(figure)

    if params[:landmark][:name] != nil
      landmark = params[:landmark]
      @landmark = Landmark.create(landmark)
      @figure.landmarks << @landmark
    end

    if params[:title][:name] != nil
      title = params[:title]
      @title = Title.create(title)
      @figure.titles << @title
    end

    @figure.save

    redirect to "/figures/#{@figure.id}"
  end

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/:id' do
    id = params[:id]
    @figure = Figure.find(id)
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    id = params[:id]
    @figure = Figure.find(id)
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    id = params[:id]
    @figure = Figure.find(id)
    
    @figure.update(params[:figure])
    unless params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    unless params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    
    @figure.save

    redirect '/figures/#{@figure.id}'
  end
end
