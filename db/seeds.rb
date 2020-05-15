# Definindo niveis de especializacao

Level.create!(name: 'Estagiário')
Level.create!(name: 'Auxiliar')
Level.create!(name: 'Júnior')
Level.create!(name: 'Pleno')
Level.create!(name: 'Sênior')
Level.create!(name: 'Especialista')
Level.create!(name: 'Diretor')

# Candidatos
User.create!(email: 'dianaregina22@outlook.com.br', password: '123456')
User.create!(email: 'dianaregina22@yahoo.com.br', password: '123456')

# Recrutadores
Headhunter.create!(email: 'lucas22@outlook.com.br', password: '111111')
Headhunter.create!(email: 'lucas22@yahoo.com.br', password: '111111')
