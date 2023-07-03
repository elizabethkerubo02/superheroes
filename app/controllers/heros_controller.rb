class HerosController < ApplicationController

    def index
        heroes = Hero.all 
        render json: heroes
    end
    def show
        hero = Hero.find_by(id: params[:id])
        if hero
            render json: hero.to_json(only: [:id, :name, :super_name], 
            include: [powers: { except: [:created_at, :updated_at]}])
        else
          render json: { error: "Hero not found" }, status: :not_found
        end
      end
end
