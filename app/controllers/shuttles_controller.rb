class ShuttlesController < ApplicationController
    def new
        @shuttle = Shuttle.new
    end
    
    def create
        @shuttle = Shuttle.new(shuttle_params)
        
        if @shuttle.save
            redirect_to @shuttle
        else
            render 'new'
        end
    end
    
    def show
        @shuttle = Shuttle.find(params[:id])
    end
    
    def index
        @shuttles = Shuttle.all
    end
    
    def edit
        @shuttle = Shuttle.find(params[:id])
    end
    
    def update
        @shuttle = Shuttle.find(params[:id])
        
        
        if @shuttle.update(shuttle_params)
            if Shuttle.where("name = ?", @shuttle.name).count > 1
                @shuttle.update_attribute(:name, "New Name")
            end
            redirect_to @shuttle
        else
            render 'edit'
        end
    end
    
    def delete
    end
    
    def destroy
        @shuttle = Shuttle.find(params[:id])
        @shuttle.destroy
        
        redirect_to shuttles_path
    end
   
    private
    def shuttle_params
        params.require(:shuttle).permit(:name)
    end
end
