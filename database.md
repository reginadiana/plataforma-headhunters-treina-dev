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
| hora | data | Hora de Publicação | Gerado automaticamente |
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

| interview | type | PT-BR-i18n | Validações |
| -------- | -------- | -------- | -------- |
| job_opportunity | **object** | Vaga | Obrigatório | 
| candidate | **object** | Texto | Obrigatório | 
| date | date | Data | Obrigatório | 
| hour | time | Hora | Obrigatório | 
| address | string | Texto | Obrigatório | 
| interview_id | integer | | |
