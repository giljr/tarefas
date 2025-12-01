# spec/system/tarefas_spec.rb
require "rails_helper"

RSpec.describe "Exibição de tarefas concluídas", type: :system do
  before do
    driven_by(:rack_test)
  end

  context "Ao visitar a página principal" do
    before do
      visitar_a_pagina_principal
    end

    it "eu devo ver a seção tarefas concluídas" do
      eu_devo_ver_a_secao_tarefas_concluidas
    end

    context "Teste 1: criar uma tarefa concluída anotada (nota)" do
      let!(:tarefa_concluida) { criar_uma_tarefa_concluida_anotada("Lavar o carro") }

      before do
        visitar_a_pagina_principal
      end

      it "eu devo ver na seção concluídas a tarefa (nota)" do
        eu_devo_ver_na_secao_concluidas_a_tarefa("Lavar o carro")
      end
    end

    context "Teste 2: criar uma tarefa não concluída anotada (nota)" do
      let!(:tarefa_nao_concluida) { criar_uma_tarefa_nao_concluida_anotada("Estudar Ruby") }

      before do
        visitar_a_pagina_principal
      end

      it "eu não devo ver na seção concluídas a tarefa (nota)" do
        eu_nao_devo_ver_na_secao_concluidas_a_tarefa("Estudar Ruby")
      end
    end
  end
end