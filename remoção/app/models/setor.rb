class Setor < ApplicationRecord
    has_many :cargos_setores
    has_many :cargos, through: :cargos_setores
end