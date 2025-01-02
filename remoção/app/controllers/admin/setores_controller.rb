class SetoresController < ApplicationController
  before_action :set_setor, only: [:show, :edit, :update, :destroy]

  def index
    @setores = Setor.all.includes(:cargos)
  end

  def show
  end

  def new
    @setor = Setor.new
  end

  def edit
  end

  def create
    @setor = Setor.new(setor_params)

    respond_to do |format|
      if @setor.save
        format.html { redirect_to @setor, notice: 'Setor criado com sucesso.' }
        format.json { render :show, status: :created, location: @setor }
      else
        format.html { render :new }
        format.json { render json: @setor.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @setor.update(setor_params)
        format.html { redirect_to @setor, notice: 'Setor atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @setor }
      else
        format.html { render :edit }
        format.json { render json: @setor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @setor.destroy
    respond_to do |format|
      format.html { redirect_to setores_url, notice: 'Setor excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

  def set_setor
    @setor = Setor.find(params[:id])
  end

  def setor_params
    params.require(:setor).permit(:nome, :nivel)
  end
end