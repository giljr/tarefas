class Tarefa < ApplicationRecord
  scope :concluidas, -> { where(feito: true) }
  scope :nao_concluidas, -> { where(feito: false) }
end
