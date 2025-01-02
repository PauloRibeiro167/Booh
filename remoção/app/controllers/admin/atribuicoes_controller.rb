class AtribuicoesController < ApplicationController
  before_action :set_atribuicao, only: [:show, :edit, :update, :destroy]

  def index
    @atribuicoes = Atribuicao.all.includes(:cargos)
  end

  def show
  end

  def new
    @atribuicao = Atribuicao.new
  end

  def edit
  end

  def create
    @atribuicao = Atribuicao.new(atribuicao_params)

    respond_to do |format|
      if @atribuicao.save
        format.html { redirect_to @atribuicao, notice: 'Atribuição criada com sucesso.' }
        format.json { render :show, status: :created, location: @atribuicao }
      else
        format.html { render :new }
        format.json { render json: @atribuicao.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @atribuicao.update(atribuicao_params)
        format.html { redirect_to @atribuicao, notice: 'Atribuição atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @atribuicao }
      else
        format.html { render :edit }
        format.json { render json: @atribuicao.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @atribuicao.destroy
    respond_to do |format|
      format.html { redirect_to atribuicoes_url, notice: 'Atribuição excluída com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

  def set_atribuicao
    @atribuicao = Atribuicao.find(params[:id])
  end

  def atribuicao_params
    params.require(:atribuicao).permit(:funcao, cargo_ids: [])
  end
end