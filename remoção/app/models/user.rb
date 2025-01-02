class User < ApplicationRecord
  has_many :delegacoes
  has_many :cargos, through: :delegacoes
  has_many :atribuicoes, through: :delegacoes
end