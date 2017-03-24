class DosesController < ApplicationController
  before_action :load_cocktail, only: [:new]
  before_action :load_dose, only: [:destroy]

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail_id = params[:cocktail_id]
    @dose.ingredient_id = params[:dose][:ingredient_id]
    @dose.save
    redirect_to cocktail_path(params[:cocktail_id])
  end

  def new
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def edit
  end

  def update
  end

  def destroy
    @dose.destroy
    redirect_to :back
  end

  private

  def load_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id].to_i)
  end

  def load_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description)
  end
end
