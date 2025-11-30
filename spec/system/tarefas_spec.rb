# spec/system/tarefas_spec.rb
require "rails_helper"

RSpec.describe "Exibição de tarefas concluídas", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "exibe apenas tarefas concluídas na seção correta" do
    # Arrange
    criar_uma_tarefa_concluida_anotada("Lavar o carro")
    criar_uma_tarefa_inconcluida_anotada("Estudar Ruby")

    # Act
    visitar_a_pagina_principal

    # Assert
    eu_devo_ver_a_secao_tarefas_concluidas
    eu_devo_ver_na_secao_concluidas_a_tarefa("Lavar o carro")
    eu_nao_devo_ver_na_secao_concluidas_a_tarefa("Estudar Ruby")
  end
end