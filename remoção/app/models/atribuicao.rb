class Atribuicao < ApplicationRecord
    has_many :cargos_atribuicoes
    has_many :cargos, through: :cargos_atribuicoes
    has_one :delegacao
end