# spec/support/tarefas_steps.rb
module TarefasSteps
  #
  # ─── ARRANGE ────────────────────────────────────────────────────────────────
  #

  def visitar_a_pagina_principal
    visit root_path
  end

  def criar_uma_tarefa_concluida_anotada(nota)
    Tarefa.create!(nota: nota, feito: true)
  end

  def criar_uma_tarefa_inconcluida_anotada(nota)
    Tarefa.create!(nota: nota, feito: false)
  end

  #
  # ─── ACT & ASSERT ───────────────────────────────────────────────────────────
  #

  def eu_devo_ver_a_secao_tarefas_concluidas
    expect(page).to have_css(".tarefas-concluidas")
  end

  def eu_devo_ver_na_secao_concluidas_a_tarefa(nota)
    within(".tarefas-concluidas") do
      expect(page).to have_content(nota)
    end
  end

  def eu_nao_devo_ver_na_secao_concluidas_a_tarefa(nota)
    within(".tarefas-concluidas") do
      expect(page).not_to have_content(nota)
    end
  end
end