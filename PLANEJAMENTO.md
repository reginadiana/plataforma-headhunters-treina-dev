## Planejamento de Layout

### Rascunho das telas

#### Aplicação visivel aos Headhunters (Recrutadores)

![Headhunters](https://user-images.githubusercontent.com/46378210/81507879-abba6e80-92d6-11ea-9b4e-45453604a235.png)

#### Aplicação visivel aos candidatos

![Candidatos](https://user-images.githubusercontent.com/46378210/81507874-a5c48d80-92d6-11ea-8d6c-4c8bce5aa730.png)

## Planejemento de funcoes das views e permissoes

| Controller | Action | Descrição | Permitido à | 
| -------- | -------- | -------- |  -------- | 
| Vagas| Index | Lista de todas as vagas | Headhunter e Candidato |
| Vagas | Show | Informações da vaga | Headhunter e Candidato |
| Vagas | New | Criar vaga | Headhunter |
| Vagas| Edit | Editar informações da vaga | Headhunter |
| Vagas | Delete | Encerrar vaga | Headhunter |

| Controller | Action | Descrição | Permitido à | 
| -------- | -------- | -------- |  -------- | 
| Candidatos | Index | Lista de Candidatos | Headhunter |
| Candidatos | Show | Perfil do Candidato | Headhunter e Candidato |
| Candidatos | New | Criar Perfil | Candidato |
| Candidatos | Edit | Editar informações do perfil | Canidato |
| Candidatos | Delete | Encerrar conta | Candidato |

| Controller | Action | Descrição | Permitido à | 
| -------- | -------- | -------- |  -------- | 
| Comentarios | Index | Lista de Comentarios | Headhunter e Candidato |
| Comentarios | New | Form para criar comentario | Headhunter e Candidato|
| Comentarios | Edit | Form para editar comentario | Headhunter |
| Comentarios | Delete | Excluir comentario | Headhunter |

| Controller | Action | Descrição | Permitido à | 
| -------- | -------- | -------- |  -------- | 
| Feedbacks | Index | Lista de Feedbacks | Headhunter e Candidato |
| Feedbacks | New | Criar feedback | Headhunter e Candidato |
| Feedbacks | Edit | Editar mensagem do feedback | Headhunter e Candidato |
| Feedbacks | Delete | Deletar feedback | Headhunter e Candidato |

| Controller | Action | Descrição | Permitido à | 
| -------- | -------- | -------- |  -------- | 
| Propostas | Index | Lista de Propostas | Candidato |
| Propostas | New | Criar proposta | Headhunter |
| Propostas | Edit | Editar informações da proposta | Headhunter |
| Propostas | Edit | Aceitar/Recusar | Candidato |
| Propostas | Delete | Deletar proposta | Headhunter |

## Planejamento do database

> Uma vaga de emprego possui muitos candidatos

| job_opportunity | type |PT-BR-i18n| Validações |
| -------- | -------- | -------- |  -------- | 
| title | string | Titulo | Deve ser único, Máximo 50 caracteres e obrigatório | 
| company | string | Empresa | Máximo 50 caracteres e obrigatório|
| description_job | string | Descrição | Obrigatório|
| skills | string | Habilidades | Obrigatório|
| salary_range | float | Faixa Salarial | Maior que 1045 (salario minimo) e obrigatório |
| level | **objeto** | Nível | |
| deadline | date | Data Límite | Não deve estar no passado e obrigatório |
| region | string | Região | Obrigatório |
| benefits | string | Beneficios | |
| office_functions | string | Funções do Cargo | Obrigatório |
| company_expectations | string | Expectavidas da Empresa | |
| headhunter | object | Recrutador | |
| job_opportunity_id | integer |  | |

| level | type | PT-BR-i18n | Validações |
| -------- | -------- | -------- | -------- |
| name | string | Nome | Obrigatório |
| level_id |  |  |  |

| candidate | type | PT-BR-i18n | Validações |
| -------- | -------- | -------- | -------- |
| full_name | string | Nome Completo | Obrigatório |
| social_name | string | Nome Social | Máximo de 30 caracteres e obrigatório |
| date_of_birth | date | Data de Nascimento |Não aceita datas futuras |
| formation | string | Formação | |
| profile_description | string | Descrição | Obrigatório |
| experience | string | Experiencia | |
| photograph | image | Avatar | Aceita tipos .png e .jpg |
| user | object | Candidato | |
| candidate_id | integer | | |

> Quando uma candidatura é criada 

| appy_job | type | PT-BR-i18n | Validações |
| -------- | -------- | -------- | -------- |
| candidate | **object** | Candidato | Obrigatório | 
| job_opportunity | **object** | Vaga | Obrigatório | 
| candidate_id | integer | | | 
| job_opportunity_id | integer | | | 
| appy_job_id | integer | | |

> Candidato possui muitos comentarios em seu pefil

| comment | type | PT-BR-i18n | Validações |
| -------- | -------- | -------- | -------- |
| candidate | **object** | Candidato | Obrigatório | 
| user | **object** | Recrutador | Obrigatório | 
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
