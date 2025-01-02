class CargosController < ApplicationController
  before_action :set_cargo, only: [:show, :edit, :update, :destroy]

  def index
    @cargos = Cargo.all.includes(:setores, :atribuicoes)
  end

  def show
  end

  def new
    @cargo = Cargo.new
  end

  def edit
  end

  def create
    @cargo = Cargo.new(cargo_params)

    respond_to do |format|
      if @cargo.save
        format.html { redirect_to @cargo, notice: 'Cargo criado com sucesso.' }
        format.json { render :show, status: :created, location: @cargo }
      else
        format.html { render :new }
        format.json { render json: @cargo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @cargo.update(cargo_params)
        format.html { redirect_to @cargo, notice: 'Cargo atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @cargo }
      else
        format.html { render :edit }
        format.json { render json: @cargo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cargo.destroy
    respond_to do |format|
      format.html { redirect_to cargos_url, notice: 'Cargo excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

  def set_cargo
    @cargo = Cargo.find(params[:id])
  end

  def cargo_params
    params.require(:cargo).permit(:nome_do_cargo, :lideranca, :descricao, 
                                  setor_ids: [], atribuicao_ids: [])
  end
end