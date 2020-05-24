<p align="center">
  <img src="https://user-images.githubusercontent.com/46378210/81453266-7ccdbc80-915f-11ea-9b07-fdfb166e60bd.png" alt="Titulo do Projeto"/>
</p>

<p align="center">
  <img src="https://img.shields.io/apm/l/vim-mode?color=green&label=license&logo=license&logoColor=green&style=for-the-badge"/>
  <img src="http://img.shields.io/static/v1?label=Ruby&message=2.6.3&color=red&style=for-the-badge&logo=ruby"/>
  <img src="http://img.shields.io/static/v1?label=Ruby%20On%20Rails%20&message=6.0.2.2&color=red&style=for-the-badge&logo=ruby"/>
  <img src="http://img.shields.io/static/v1?label=TESTES&message=%3E100&color=GREEN&style=for-the-badge"/>
</p>

<p align="center">
  <img src="http://img.shields.io/static/v1?label=STATUS&message=EM%20DESENVOLVIMENTO&color=RED&style=for-the-badge"/>
</p>

:memo: Planejamento das atividades no [Trello](https://trello.com/b/sdJc3alw/tarefas-headhunters-treina-dev) 

:memo: Planejamento das [views](https://github.com/Diana-ops/plataforma-headhunters-treina-dev/blob/master/views.md)

:memo: Planejamento do [database](https://github.com/Diana-ops/plataforma-headhunters-treina-dev/blob/master/database.md)

:memo: Planejamento do [layout](https://github.com/Diana-ops/plataforma-headhunters-treina-dev/blob/master/layout.md)

## Lista de Conteúdos

:small_orange_diamond: [Descrição do Projeto](#descrição-do-projeto)

:small_orange_diamond: [Funcionalidades](#funcionalidades)

:small_orange_diamond: [Gems instaladas](#gems-instaladas)

:small_orange_diamond: [Pré-requisitos](#pré-requisitos-package)

:small_orange_diamond: [Configurações](#configurações)

:small_orange_diamond: [Rodando a aplicação](#rodando-a-aplicação-arrow_forward)

:small_orange_diamond: [Rodando os testes](#rodando-os-testes-memo)

:small_orange_diamond: [Casos de Uso](#casos-de-uso-busts_in_silhouette)

:small_orange_diamond: [Database](#database-floppy_disk)

:small_orange_diamond: [Rotas](#rotas)

:small_orange_diamond: [Resolvendo Problemas](#resolvendo-problemas-exclamation)

:small_orange_diamond: [Licença](#licença-trident)

## Descrição do projeto 

<p align="justify">
  O projeto é uma plataforma com foco em <strong>vagas de emprego</strong> para que recrutadores publiquem e recebam instrições, assim como candidatos possam buscar e se canditadar a elas.
</p>

## Funcionalidades

Os **headhunters** (recrutadores) podem: 

:heavy_check_mark: Criar uma conta e uma vaga

:heavy_check_mark: Ver os inscritos em uma vaga

:heavy_check_mark: Escrever comentarios no perfil dos candidatos cadastrados a vaga  

:heavy_check_mark: Marcar perfis como destaque

:heavy_check_mark: Rejeitar perfils mandando um feedback

:heavy_check_mark: Enviar proposta para o perfil

:heavy_check_mark: Receber proposta do candidato 

:heavy_check_mark: Encerrar as inscrições para uma vaga

Os **candidatos** podem: 

:heavy_check_mark: Criar uma conta 

:heavy_check_mark: Completar o seu perfil

:heavy_check_mark: Se inscrever em uma vaga

:heavy_check_mark: Receber feedbacks negativos

:heavy_check_mark: Receber propostas de handhunterss

:heavy_check_mark: Aceitar e rejeitar propostas

## Techs

:bookmark: Ruby on Rails

:bookmark: [I18n](https://guides.rubyonrails.org/i18n.html) 

## Gems instaladas

:books: [**Devise**](https://github.com/heartcombo/devise) para autenticação de usuários (recrutadores e candidatos)

:books: [**RSpec**](https://github.com/rspec/rspec-rails) para escrever e executar testes unitários, isto é, de baixo nível 

:books: [**Capybara**](https://github.com/teamcapybara/capybara) para escrever e executar testes de integração, isto é, de alto nível

:books: [**Factory Bot Rails**](https://github.com/thoughtbot/factory_bot_rails) para otimizar a escrita de testes

:books: [**SimpleCov**](https://github.com/colszowka/simplecov) para  gerar relatórios referentes a cobertura de testes

## Pré-requisitos :package:

Algumas instalações serão necessárias antes de iniciar o projeto. 

:warning: [Ruby](https://www.ruby-lang.org/pt/documentation/installation/) versão >=2.6.3

:warning: [Node](https://nodejs.org/en/download/) versão >=10.13.0

:warning: [Ruby on Rails](https://guides.rubyonrails.org/getting_started.html) versão >=6.0.2.2

:warning: [Node](https://nodejs.org/en/download/) versão >=12.16.2

:warning: [Gem](https://rubygems.org/pages/download?locale=pt-BR) versão >=3.1.2

:warning: [Bundle](https://bundler.io/man/bundle-install.1.html) versão >=2.1.2

:warning: [Yarn](https://classic.yarnpkg.com/pt-BR/docs/install/#windows-stable) versão >=1.22.4 

## Configurações

### Iniciando/Configurando banco de dados

No terminal, clone o projeto: 

```
git clone https://github.com/Diana-ops/plataforma-headhunters-treina-dev
```
Entre na pasta
```
cd plataforma-headhunters-treina-dev
```
Instale as dependencias e prepare o database
```
bin/setup
```

## Rodando a aplicação :arrow_forward:

```
$ rails server or rails s
```

> Depois, acesse http://localhost:3000 para ver a aplicação

## Casos de Uso :busts_in_silhouette:

Alguns candidatos, recrutadores e outros objetos já estão configurados na aplicação e foram criados no arquivo [bin/seeds.rb](https://github.com/Diana-ops/plataforma-headhunters-treina-dev/blob/master/db/seeds.rb).

### Acessando a plataforma como candidato 

```ruby 
user_a = User.create!(email: 'camila@outlook.com.br', password: '123456')
```

### Acessando a plataforma como recrutador
```ruby 
headhunter_a = Headhunter.create!(email: 'lucas22@outlook.com.br', password: '111111')
```

## Rodando os testes :memo:

```
$ cd rental-cars-treina-dev-1
$ rspec or bundle exec rspec
```

## Database :floppy_disk:

O banco de dados utilizado nesta aplicação foi o [Sqlite3](https://www.sqlite.org/index.html). O banco foipreparado com o comando ``` bin/setup ```

## Rotas

Para ver as rotas disponíveis na aplicação, execute: 

```
$ rails routes -g <name of controller>
```

## Resolvendo Problemas :exclamation:

Em [issues](https://github.com/Diana-ops/rental-cars-treina-dev-1/issues) foram abertos alguns problemas gerados durante o desenvolvimento desse projeto e como foram resolvidos. 

## Licença :trident:

The [MIT License](https://github.com/Diana-ops/plataforma-headhunters-treina-dev/blob/master/LICENSE) (MIT)

Copyright :copyright: 2020 HandHunters
