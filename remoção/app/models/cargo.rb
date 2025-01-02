class Cargo < ApplicationRecord
    belongs_to :setores, optional: true
    has_many :cargos_setores
    has_many :setores, through: :cargos_setores
    has_many :cargos_atribuicoes
    has_many :atribuicoes, through: :cargos_atribuicoes
    has_many :delegacoes
end