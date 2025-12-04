# Tarefas

## Episódio 1

Um projeto simples para demonstrar testes com **Cucumber** e **RSpec**.

### Clonar o projeto


```bash
git clone git@github.com:giljr/tarefas.git
cd tarefas
```

### Rails 3.4.5
```bash
rbenv install --list-all | grep 3.4.5
rbenv install 3.4.5
bundle install
```

### Rodar os testes
RSpec
```
bin/rspec spec/system/tarefas_spec.rb -fd
```

E o Cucumber:
```
bin/cucumber 
```

### Reporter
Esse comando publica na rede sua especificação:
```bash
cucumber --publish
```

### Gerar o diretório docs com relatório HTML do Cucumber (padrão)
O Cucumber já vem com um formatter HTML embutido. Basta rodar:
```bash
mkdir -p docs
cucumber --format html --out docs/index.html
```

Isso cria:
```bash
docs/
└── index.html
```

### Tutoriais:

[Cucumber + RSpec: Testes que Falam e Testes que Garantem]() - Da especificação ao teste automatizado sem fricção

[Refatorando Filtros para o Model em Rails]() - Aplicando SRP (Single Responsibility Principle) na Exibição de Tarefas Concluídas


Boa codificação e bons testes!

----

## Episódio 2

## Refatorando Filtros para o Model (SRP em Rails)

**O problema inicial**: 
```
a view filtrava tarefas usando `@tarefas.where(...)`, 
violando o SRP — lógica de domínio não pertence à view.
```
**🎯 Objetivo**

Mover a lógica de filtragem para o model, criar scopes, atualizar controller e view, e garantir o comportamento via RSpec.

### ✔ Passos da Refatoração
#### 1. Criar testes dos scopes (RED)

Testar que:
```
Tarefa.concluidas retorna só concluídas

Tarefa.nao_concluidas retorna só pendentes
```
→ Falham corretamente, pois os scopes ainda não existem.

#### 2. Implementar os scopes (GREEN)
```ruby
class Tarefa < ApplicationRecord
  scope :concluidas,     -> { where(feito: true) }
  scope :nao_concluidas, -> { where(feito: false) }
end
```

Testes passam.

#### 3. Atualizar o controller
```ruby
def index
  @tarefas_concluidas     = Tarefa.concluidas
  @tarefas_nao_concluidas = Tarefa.nao_concluidas
end
```
#### 4. Atualizar a view
```ruby
<% @tarefas_concluidas.each do |t| %>
<% @tarefas_nao_concluidas.each do |t| %>
```

View agora exibe — não filtra.

#### 5. Garantir que o controller usa os scopes (spy)
```ruby
allow(Tarefa).to receive(:concluidas).and_call_original
allow(Tarefa).to receive(:nao_concluidas).and_call_original

get "/tarefas"

expect(Tarefa).to have_received(:concluidas)
expect(Tarefa).to have_received(:nao_concluidas)
```
✔ Resultado Final
```ruby
Model: filtra

Controller: orquestra

View: apenas exibe

Testes: garantem o comportamento
```
Código mais limpo, semântico e totalmente alinhado ao SRP.

### Rodando tudo junto:

```ruby
br -fd
```
```ruby
Tarefa
  ao filtrar por scopes
    deve retornar somente tarefas concluídas
    deve retornar somente tarefas não concluídas

GET /tarefas
  usa os scopes das tarefas concluidas e nao_concluidas

Exibição de tarefas concluídas
  Ao visitar a página principal
    eu devo ver a seção tarefas concluídas
    Teste 1: criar uma tarefa concluída anotada (nota)
      eu devo ver na seção concluídas a tarefa (nota)
    Teste 2: criar uma tarefa não concluída anotada (nota)
      eu não devo ver na seção concluídas a tarefa (nota)

Finished in 0.07391 seconds (files took 0.64338 seconds to load)
6 examples, 0 failures
```

Esses Episódios demonstram o uso de três tipos principais de testes:
`System`, `Model` e `Request`.
```
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
                                Ⓡ Secretaria de Finanças do Estado de Rondônia
                                       Todos os direitos reservados.
──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
```
