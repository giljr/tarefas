# features/step_definitions/tarefas_steps.rb

Given("eu estou na página principal do app") do
  visit "/"
end

Given("existe uma tarefa concluida chamada {string}") do |nome|
  @tarefa_concluida = Tarefa.create!(nota: nome, feito: true)
end

Given("existe uma tarefa nao concluida chamada {string}") do |nome|
  @tarefa_incompleta = Tarefa.create!(nota: nome, feito: false)
end

When("eu envio essa tarefa concluida") do
  # Se já existe no banco, apenas recarrega a página
  visit "/"
end

When("eu envio essa tarefa nao concluida") do
  # Apenas recarrega para refletir a lista
  visit "/"
end

When("eu envio ambas as tarefas") do
  visit "/"
end

Then("eu devo ver {string} na seção {string}") do |texto, secao|
  within(:xpath, "//*[contains(@class,'#{secao.parameterize}') or contains(@id,'#{secao.parameterize}')]") do
    expect(page).to have_content(texto)
  end
end

Then("eu não devo ver {string} na seção {string}") do |texto, secao|
  within(:xpath, "//*[contains(@class,'#{secao.parameterize}') or contains(@id,'#{secao.parameterize}')]") do
    expect(page).not_to have_content(texto)
  end
end
