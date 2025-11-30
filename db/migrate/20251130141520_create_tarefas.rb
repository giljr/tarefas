class CreateTarefas < ActiveRecord::Migration[8.1]
  def change
    create_table :tarefas do |t|
      t.text :nota
      t.boolean :feito

      t.timestamps
    end
  end
end
