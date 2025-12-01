# Tarefas

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


### Tutorial:


[Cucumber + RSpec: Testes que Falam e Testes que Garantem](https://medium.com/jungletronics/cucumber-rspec-testes-que-falam-e-testes-que-garantem-30170c7e7a99) - Da especificação ao teste automatizado sem fricção


Boa codificação e bons testes!