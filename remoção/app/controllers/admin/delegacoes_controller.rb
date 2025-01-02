class DelegacoesController < ApplicationController
  before_action :set_delegacao, only: [:show, :edit, :update, :destroy]

  def index
    @delegacoes = Delegacao.all.includes(:origem_cargo, :destino_usuario, :atribuicao)
  end

  def show
  end

  def new
    @delegacao = Delegacao.new
  end

  def edit
  end

  def create
    @delegacao = Delegacao.new(delegacao_params)

    respond_to do |format|
      if @delegacao.save
        format.html { redirect_to @delegacao, notice: 'Delegação criada com sucesso.' }
        format.json { render :show, status: :created, location: @delegacao }
      else
        format.html { render :new }
        format.json { render json: @delegacao.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @delegacao.update(delegacao_params)
        format.html { redirect_to @delegacao, notice: 'Delegação atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @delegacao }
      else
        format.html { render :edit }
        format.json { render json: @delegacao.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @delegacao.destroy
    respond_to do |format|
      format.html { redirect_to delegacoes_url, notice: 'Delegação excluída com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

  def set_delegacao
    @delegacao = Delegacao.find(params[:id])
  end

  def delegacao_params
    params.require(:delegacao).permit(:origem_cargo_id, :destino_usuario_id, :atribuicao_id)
  end
end