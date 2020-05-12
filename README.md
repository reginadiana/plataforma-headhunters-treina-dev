<p align="center">
  <img src="https://user-images.githubusercontent.com/46378210/81453266-7ccdbc80-915f-11ea-9b07-fdfb166e60bd.png" alt="Titulo do Projeto"/>
</p>

> Status do Projeto: em desenvolvimento :warning: 

:memo: Planejamento das atividades no [Trello](https://trello.com/b/sdJc3alw/tarefas-headhunters-treina-dev) 

## Lista de Conteúdos

:small_orange_diamond: [Descrição do Projeto](#descrição-do-projeto)

:small_orange_diamond: [Funcionalidades](#funcionalidades)

:small_orange_diamond: [Layout da Aplicação](#layout-da-aplicação-dash)

:small_orange_diamond: [Gems instaladas](#gems-instaladas)

:small_orange_diamond: [Pré-requisitos](#pré-requisitos-package)

:small_orange_diamond: [Configurações](#configurações)

:small_orange_diamond: [Rodando a aplicação](#rodando-a-aplicação-arrow_forward)

:small_orange_diamond: [Rodando os testes](#rodando-os-testes-memo)

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

## Layout da Aplicação :dash:

## Rascunho das telas

### Aplicação visivel aos Headhunters (Recrutadores)

![Headhunters](https://user-images.githubusercontent.com/46378210/81507879-abba6e80-92d6-11ea-9b4e-45453604a235.png)

### Aplicação visivel aos candidatos

![Candidatos](https://user-images.githubusercontent.com/46378210/81507874-a5c48d80-92d6-11ea-8d6c-4c8bce5aa730.png)

### Permissões 

| Controller | Action | Descrição | Permitido à | 
| -------- | -------- | -------- |  -------- | 
| Vaga | Index | Lista de todas as vagas | Headhunter e Candidato |
| Vaga | Show | Informações da vaga | Headhunter e Candidato |
| Vaga | New | Criar vaga | Headhunter |
| Vaga | Edit | Editar informações da vaga | Headhunter |
| Vaga | Delete | Encerrar vaga | Headhunter |

| Controller | Action | Descrição | Permitido à | 
| -------- | -------- | -------- |  -------- | 
| Candidato | Index | Lista de Candidatos | Headhunter |
| andidato | Show | Perfil do Candidato | Headhunter e Candidato |
| Candidato | New | Criar Perfil | Candidato |
| Candidato | Edit | Editar informações do perfil | Canidato |
| Candidato | Delete | Encerrar conta | Candidato |

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

:warning: [Ruby on Rails](https://guides.rubyonrails.org/getting_started.html) versão >=6.0.2.2

:warning: [Node](https://nodejs.org/en/download/) versão >=12.16.2

:warning: [Gem](https://rubygems.org/pages/download?locale=pt-BR) versão >=3.1.2

:warning: [Bundle](https://bundler.io/man/bundle-install.1.html) versão >=2.1.2

:warning: [Yarn](https://classic.yarnpkg.com/pt-BR/docs/install/#windows-stable) versão >=1.22.4 

## Configurações

### Iniciando/Configurando banco de dados

No terminal, clone o projeto: 

```
git clone 
```
...

## Rodando a aplicação :arrow_forward:

```
$ rails server or rails s
```

> Depois, acesse http://localhost:3000 para ver a aplicação

## Rodando os testes :memo:

```
$ cd rental-cars-treina-dev-1
$ rspec or bundle exec rspec
```

## Database :floppy_disk:

O banco de dados utilizado nesta aplicação foi o [Sqlite3](https://www.sqlite.org/index.html)

> Uma vaga de emprego possui muitos ca

| job_opportunity | type |PT-BR-i18n| Validações |
| -------- | -------- | -------- |  -------- | 
| title | string | Titulo | Máximo 50 caracteres e obrigatório | 
| company | string | Empresa | Deve ser único,  máximo 50 caracteres e obrigatório|
| description_job | string | Descrição | Obrigatório|
| skills | string | Habilidades | Obrigatório|
| salary_range | float | Faixa Salarial | Maior que 0 e obrigatório |
| level | **objeto** | Nível | |
| deadline | date | Data Límite | Não deve estar no passado e obrigatório |
| region | string | Região | Obrigatório |
| benefits | string | Beneficios | |
| office_functions | string | Funções do Cargo | Obrigatório |
| company_expectations | string | Expectavidas da Empresa | |
| **candidates | array | Lista de Candidatos** | |
| job_opportunity_id | integer |  | |

| candidate | type | PT-BR-i18n | Validações |
| -------- | -------- | -------- | -------- |
| full_name | string | Nome Completo | Obrigatório |
| social_name | string | Nome Social | Máximo de 30 caracteres e obrigatório |
| date_of_birth | date | Data de Nascimento |Não aceita datas futuras |
| formation | string | Formação | |
| profile_description | string | Descrição | Obrigatório |
| experience | string | Experiencia | |
| photograph | image | Avatar | Aceita tipos .png e .jpg |
| candidate_id | integer | | |

> Quando uma candidatura é criada 

| comment | type | PT-BR-i18n | Validações |
| -------- | -------- | -------- | -------- |
| candidate | **object** | Candidato | Obrigatório | 
| job_opportunity | **object** | Vaga | Obrigatório | 
| comment_id | integer | | |

> Candidato possui muitos comentarios em seu pefil

| comment | type | PT-BR-i18n | Validações |
| -------- | -------- | -------- | -------- |
| candidate | **object** | Candidato | Obrigatório | 
| text | string | Texto | Obrigatório | 
| date | data | Data de Publicação | Gerado automaticamente |
| comment_id | integer | | |

| feedback | type | PT-BR-i18n | Validações |
| -------- | -------- | -------- | -------- |
| job_opportunity | **object** | Vaga | Obrigatório | 
| candidate | **object** | Texto | Obrigatório | 
| text | string | Texto | Obrigatório | 
| status | boolean | Status | Gerado automaticamente: Em espera |
| feedback_id | integer | | |

Status: Aceito, Recusado, Em espera

| proposal | type | PT-BR-i18n | Validações |
| -------- | -------- | -------- | -------- |
| job_opportunity | **object** | Vaga | Obrigatório | 
| candidate | **object** | Texto | Obrigatório | 
| text | string | Texto | Obrigatório | 
| status | boolean | Status | Gerado automaticamente: Em espera |
| feedback_id | integer | | |

Status: Aceito, Recusado, Em espera

## Rotas

Para ver as rotas disponíveis na aplicação, execute: 

```
$ rails routes -g <name of controller>
```

## Resolvendo Problemas :exclamation:

Em [issues]() foram abertos alguns problemas gerados durante o desenvolvimento desse projeto e como foram resolvidos. 

## Licença :trident:

The [MIT License](https://github.com/Diana-ops/plataforma-headhunters-treina-dev/blob/master/LICENSE) (MIT)

Copyright :copyright: 2020 HandHunters
