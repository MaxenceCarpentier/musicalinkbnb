class ProfsController < ApplicationController
    before_action :set_prof, only: [:show, :edit, :update]
    before_action :authenticate_user!, except: [:show]

    def index
        @profs = current_user.profs
    end

def new
    @prof = current_user.prof.build
end

    def create
@prof = current_user.prof.build
       if @prof.save
        redirect_to @prof, notice: "Votre annonce a été mise en ligne !"
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        if @prof.update(prof_params)
            redirect_to @prof, notice: "Modification enregistrée !"
        else
            render :edit
        end
    end

    private
    def set_prof
        @prof = Prof.find(params[:id])
    end

    def prof_params
        params.require(:prof).permit(:instrument, :experience, :style, :influence, :lesson_type, :description, :listing_name, :address, :price, :active)
    end

end