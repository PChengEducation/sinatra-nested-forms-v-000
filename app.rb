require './environment'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
        get '/' do
          erb :'views/root'
        end

        get '/new' do
          erb :'view/pirates/new'
        end

        post '/pirates' do
          @pirate = Pirate.new(params[:pirate])

          params[:pirate][:ships].each do |details|
            Ship.new(details)
          end
          @ships = Ship.all

          erb :'views/pirates/show'
        end
      end
end
