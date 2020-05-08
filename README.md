<p align="center">
  <img src="https://user-images.githubusercontent.com/46378210/81453266-7ccdbc80-915f-11ea-9b07-fdfb166e60bd.png" alt="Titulo do Projeto"/>
</p>

> Status do Projeto: em desenvolvimento :warning: 

## Lista de Conteúdos

:small_orange_diamond: [Descrição do Projeto](#descrição-do-projeto)

:small_orange_diamond: [Funcionalidades](#funcionalidades)

:small_orange_diamond: [Layout da Aplicação](#layout-da-aplicação-dash)

:small_orange_diamond: [Pré-requisitos](#pré-requisitos-package)

:small_orange_diamond: [Configurações](#configurações)

:small_orange_diamond: [Rodando a aplicação](#rodando-a-aplicação)

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

## Techs utilizadas

:books: Ruby on Rails

:books: Devise 


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

## Como rodar a aplicação :arrow_forward:

```
$ rails server or rails s
```

> Depois, acesse http://localhost:3000 para ver a aplicação

## Como rodar os testes

```
$ cd rental-cars-treina-dev-1
$ rspec or bundle exec rspec
```

## Database :floppy_disk:

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
