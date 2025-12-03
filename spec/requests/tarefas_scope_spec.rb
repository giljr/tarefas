require "rails_helper"

RSpec.describe "GET /tarefas", type: :request do
  it "usa os scopes concluidas e nao_concluidas" do
    allow(Tarefa).to receive(:concluidas).and_call_original
    allow(Tarefa).to receive(:nao_concluidas).and_call_original

    get "/tarefas"
    
    expect(Tarefa).to have_received(:concluidas)
    expect(Tarefa).to have_received(:nao_concluidas)
  end
end