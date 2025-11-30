Feature: Exibicao de Tarefas Concluidas
  A pagina principal do app deve exibir corretamente as tarefas concluidas
  e garantir que tarefas nao concluidas nao aparecam na secao especificada.

  Background:
    Given eu estou na página principal do app

  Scenario: Exibir uma tarefa concluida na secao "tarefas-concluidas"
    Given existe uma tarefa concluida chamada "Lavar o carro"
    When eu envio essa tarefa concluida
    Then eu devo ver "Lavar o carro" na seção "tarefas-concluidas"

  Scenario: Garantir que uma tarefa nao concluida não apareça na secao "tarefas-concluidas"
    Given existe uma tarefa nao concluida chamada "Estudar Ruby"
    When eu envio essa tarefa nao concluida
    Then eu devo ver "Estudar Ruby" na seção "tarefas-nao-concluidas"

  Scenario: Exibir somente tarefas concluidas na secao "tarefas-concluidas"
    Given existe uma tarefa concluida chamada "Lavar o carro"
    And existe uma tarefa nao concluida chamada "Estudar Ruby"
    When eu envio ambas as tarefas
    Then eu devo ver "Lavar o carro" na seção "tarefas-concluidas"
    And eu não devo ver "Estudar Ruby" na seção "tarefas-concluidas"
