json.extract! tarefa, :id, :nota, :feito, :created_at, :updated_at
json.url tarefa_url(tarefa, format: :json)
