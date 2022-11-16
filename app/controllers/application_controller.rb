class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  #get all games
  get '/games' do
    Game.all.to_json
  end

  #get a specific game
  get '/games/:id' do
    game = Game.find(params[:id])
    game.to_json(only: [:id, :title, :genre, :price], 
      include: {
        reviews: { only: [:comment, :score], 
        include: {
        user: { only: [:name] }
      } 
    }
    })
  end

end
