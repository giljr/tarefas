require 'rails_helper'

RSpec.describe Tarefa, type: :model do
  describe "ao filtrar por scopes" do
    let!(:completa) { Tarefa.create!(nota: "Tarefa completa", feito: true) }
    let!(:nao_completa) { Tarefa.create!(nota: "Tarefa pendente", feito: false) }
    
    it "deve retornar somente tarefas concluídas" do
      expect(Tarefa.concluidas).to include(completa)
      expect(Tarefa.concluidas).not_to include(nao_completa)
    end
  
    it "deve retornar somente tarefas não concluídas" do
      expect(Tarefa.nao_concluidas).to include(nao_completa)
      expect(Tarefa.nao_concluidas).not_to include(completa)
    end
  end
end