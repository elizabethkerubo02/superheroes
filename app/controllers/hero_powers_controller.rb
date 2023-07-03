class HeroPowersController < ApplicationController
    def create 
        hero = Hero.find_by(id: hero_power_params[:hero_id])
        power = Power.find_by(id: hero_power_params[:power_id])
        hero_power = HeroPower.create(hero_power_params)
        hero_power.hero = hero
        hero_power.power = power

        if hero_power 
            render json: hero.to_json(only: [:id, :name, :super_name], 
            include: [powers: { except: [:created_at, :updated_at]}])
        else 
            render json: { errors: hero_power.errors.full_messages }, status: :unprocessable_entity
        end
      end
    
      private
    
      def hero_power_params
        params.require(:hero_power).permit(:strength, :power_id, :hero_id)
      end

     
    
end