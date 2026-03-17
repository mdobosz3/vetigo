class PetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @pets = current_user.pets.order(created_at: :desc)
  end

  def new
    @pet = current_user.pets.build
  end

  def create
    @pet = current_user.pets.build(pet_params)

    if @pet.save
      redirect_to pets_path, notice: "Zwierzak został pomyślnie dodany!"
    else
      render :new, status: :unprocessable_content
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :species, :breed, :age)
  end
end
