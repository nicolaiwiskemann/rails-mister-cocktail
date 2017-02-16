class DosesController < ApplicationController
  before_action :set_dose, only: [:show, :edit, :update, :destroy]

 before_action :set_cocktail, only: [:show, :edit, :update, :create]
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create


    if @cocktail.doses.create(doses_params)
       redirect_to cocktail_path(@cocktail)

    else
      render "new"
    end
  end

  def edit
  end

  def update
    @dose = Dose.update(dose_params)
    @dose.save
  end

  def destroy
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

   def set_dose
      @dose = Dose.find(params[:id])
    end
    def set_cocktail
      @cocktail = Cocktail.find(params[:cocktail_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def doses_params
      params.require(:dose).permit(:description, :ingredient_id)
    end
end
