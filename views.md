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
