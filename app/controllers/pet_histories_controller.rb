class PetHistoriesController < ApplicationController
  before_action :set_pet_history, only: %i[ show edit update destroy ]
  before_action :set_pet

  # GET /pet_histories or /pet_histories.json
  def index
    @pet_histories = @pet.pet_histories
  end

  # GET /pet_histories/1 or /pet_histories/1.json
  def show
  end

  # GET /pet_histories/new
  def new
    @pet_history = PetHistory.new
    @pet_history = @pet.pet_histories.build
  end

  # GET /pet_histories/1/edit
  def edit
  end

  # POST /pet_histories or /pet_histories.json
  def create
    @pet_history = @pet.pet_histories.build(pet_history_params)

    respond_to do |format|
      if @pet_history.save
        format.html { redirect_to [@pet, @pet_history], notice: "Pet history was successfully created." }
        format.json { render :show, status: :created, location: @pet_history }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pet_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pet_histories/1 or /pet_histories/1.json
  def update
    respond_to do |format|
      if @pet_history.update(pet_history_params.merge(pet: @pet))
        format.html { redirect_to [@pet, @pet_history], notice: "Pet history was successfully updated." }
        format.json { render :show, status: :ok, location: @pet_history }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pet_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pet_histories/1 or /pet_histories/1.json
  def destroy
    @pet_history.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Pet history was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet_history
      @pet_history = PetHistory.find(params[:id])
    end

    def set_pet
      @pet = Pet.find(params[:pet_id])
    end

    # Only allow a list of trusted parameters through.
    def pet_history_params
      params.require(:pet_history).permit(:visit, :weight, :height, :description)
    end
end
