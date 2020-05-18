# Definindo niveis de especializacao

Level.create!(name: 'Estagiário')
Level.create!(name: 'Auxiliar')
Level.create!(name: 'Júnior')
pleno = Level.create!(name: 'Pleno')
Level.create!(name: 'Sênior')
especialista = Level.create!(name: 'Especialista')
Level.create!(name: 'Diretor')

# Candidatos
user_a = User.create!(email: 'camila@outlook.com.br', password: '123456')
user_b = User.create!(email: 'bianca@yahoo.com.br', password: '123456')

# Perfils
candidate_a = Candidate.create!(
	full_name: "Camila de Lucas",
	social_name: "Camila",
	date_of_birth: "01/04/1990",
	profession: "Desenvolvedora Frontend",
	profile_description: "Excelentes capacidades de análise, escrita, raciocínio e de tecnologia da informação",
	level: pleno,
	experience: "Experiencia em desenvolvimento de interfaces na empresa Red Ventures",
	formation: "UNESP - Ciencias da Computação",
	courses: "",
	user: user_a
)

candidate_b = Candidate.create!(
	full_name: "Bianca Rosa",
	social_name: "Bianca",
	date_of_birth: "01/04/1985",
	profession: "Operador de CNC",
	profile_description: "Estudante de sistemas de informação hoje estou em busca de colocar em prática os aprendizados obtidos durante a formação",
	level: pleno,
	experience: "Experiencia como programador de CNC na empresa Flej",
	formation: "Unifesp - Automação",
	courses: "AutoCAD",
	user: user_b
)

# Recrutadores
headhunter_a = Headhunter.create!(email: 'lucas22@outlook.com.br', password: '111111')
headhunter_b = Headhunter.create!(email: 'lucas22@yahoo.com.br', password: '111111')

# Vagas
job_opportunity = JobOpportunity.create!(
	title: "Desenvolvedor Rails",
	company: "Rebase",
	description_job: "Desenvolvimento de Plataformas com TDD",
	skills: "Domínio da linguagem Ruby e do framework Ruby on Rails",
	salary_range: "4000.00",
	level: pleno,
	deadline: "14/05/2021",
	region: "Mocca - SP",
	benefits: "Vale refeição, Academia",
	office_functions: "Contribuir com a evolução arquitetural do software visando manutenibilidade e flexibilização para 				atendimento do negócio.",
	company_expectations: "Profissional ativo e comunicativo",
	headhunter: headhunter_a
)

JobOpportunity.create!(
	title: "Desenvolvedor React",
	company: "Vindi",
	description_job: "Desenvolvimento de Interfaces Dinamicas",
	skills: "Domínio da linguagem JavaScript e do framework React",
	salary_range: "5000.00",
	level: especialista,
	deadline: "14/05/2022",
	region: "Mogi das Cruzes - SP",
	benefits: "Vale refeição, Academia",
	office_functions: "Contribuir com a evolução arquitetural do software visando manutenibilidade e flexibilização para 				atendimento do negócio.",
	company_expectations: "Profissional ativo e comunicativo",
	headhunter: headhunter_b
)

# Comentarios
Comment.create!(candidate: candidate_a, headhunter: headhunter_b, content: 'Ola, gostei do seu perfil')

# Candidaturas
ApplyJob.create!(candidate: candidate_b, job_opportunity: job_opportunity, message: 'Eu, Bianca Rosa, brasileira, Operadora de CNC venho por meio desta me candidatar à vaga de Programador de CNC nesta empresa.').hope!
