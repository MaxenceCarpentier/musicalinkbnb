class ProfsController < ApplicationController
    before_action :set_prof, only: [:show, :edit, :update]
    before_action :authenticate_user!, except: [:show]
    before_action :require_same_user, only: [:edit, :update]

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
        if params[:images]

            params[:images].each do |i|

                @prof.photos.create(image: i)

            end

        end

        @photos = @prof.photos
        redirect_to edit_room_path(@prof), notice: "Votre leçon a été ajoutée !"

    end
end

def show
    @photos = @prof.photos
end

def edit
    @photos = @prof.photos
end

def update
    if @prof.update(prof_params)
        redirect_to @prof, notice: "Modification enregistrée !"
    else
        render :edit
    end
    if params[:images]
        params[:images].each do |i|
            @prof.photos.create(image: i)
        end
    end

    redirect_to edit_room_path(@room), notice: "Modification enregistrée..."
end

private
def set_prof
    @prof = Prof.find(params[:id])
end

def prof_params
    params.require(:prof).permit(:instrument, :experience, :style, :influence, :lesson_type, :description, :listing_name, :address, :price, :active)
end

    def require_same_user
              if current_user.id != @prof.user_id
                   flash[:danger] = "Vous n'avez pas le droit de modifier cette page !"
                   redirect_to root_path
              end
     end
end