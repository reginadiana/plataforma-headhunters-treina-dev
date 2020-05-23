# Definindo niveis de especializacao

Level.create!(name: 'Estagiário')
Level.create!(name: 'Auxiliar')
Level.create!(name: 'Júnior')
pleno = Level.create!(name: 'Pleno')
Level.create!(name: 'Sênior')
especialista = Level.create!(name: 'Especialista')
Level.create!(name: 'Diretor')

# Definindo escolhas que headhunter e candidato podem tomar para aos feedbacks e propostas
accepted = Choice.create!(option: "Aceitar")
rejected = Choice.create!(option: "Recusar")

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

candidate_a.not_highlighted!
candidate_b.not_highlighted!

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

job_opportunity_b = JobOpportunity.create!(
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

job_opportunity_c = JobOpportunity.create!(
	title: "Desenvolvedor PHP",
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
Comment.create!(candidate: candidate_a, headhunter: headhunter_a, content: 'Boas qualificações')
Comment.create!(candidate: candidate_a, headhunter: headhunter_a, content: 'Otimos cursos!')

# Candidaturas
ApplyJob.create!(candidate: candidate_a, job_opportunity: job_opportunity, message: 'Eu, Camila, brasileira, venho por meio desta me candidatar à vaga como desenvolvedor Rails').hope!

ApplyJob.create!(candidate: candidate_a, job_opportunity: job_opportunity_b, message: 'Eu, Camila, brasileira, venho por meio desta me candidatar à vaga').hope!

ApplyJob.create!(candidate: candidate_a, job_opportunity: job_opportunity_c, message: 'Eu, Camila, brasileira, venho por meio desta me candidatar à vaga como desenvolvedor PHP').accepted!

ApplyJob.create!(candidate: candidate_b, job_opportunity: job_opportunity_c, message: 'Eu, Camila, brasileira, venho por meio desta me candidatar à vaga como desenvolvedor PHP').rejected!

# Propostas
proposal = Proposal.create!(message: "Ola, gostaria que fizesse parte da minha empresa", 
				job_opportunity: job_opportunity_c, candidate: candidate_a, status: "Aceito")

proposal_b = Proposal.create!(message: "Ola, gostaria que fizesse parte da minha empresa, o seu curriculo é excelente", 
				job_opportunity: job_opportunity_c, candidate: candidate_b, status: "Rejeitado")

proposal_c = Proposal.create!(message: "Ola, gostaria que fizesse parte da minha empresa", 
				job_opportunity: job_opportunity, candidate: candidate_b, status: "Em espera")

proposal_d = Proposal.create!(message: "Ola, gostaria que fizesse parte da minha empresa", 
				job_opportunity: job_opportunity, candidate: candidate_a, status: "Em espera")

# Resposta a proposta
AwnserProposal.create!(choice: accepted,
    awnser_message: "Ola, me interessei pela vaga sim, pode me passar mais informações?",
    proposal: proposal)

AwnserProposal.create!(choice: rejected,
    awnser_message: "Ola, por enquanto nao procuro uma vaga como esta",
    proposal: proposal_b)


# Entrevistas
Interview.create!(interview_date: "21/05/2021", hour: "15:30", address: "Rua Vergueiro, 11", candidate: candidate_a, job_opportunity: job_opportunity_b)

Interview.create!(interview_date: "21/05/2023", hour: "20:30", address: "Rua Map, 11", candidate: candidate_b, job_opportunity: job_opportunity_b)

Interview.create!(interview_date: "21/05/2022", hour: "18:30", address: "Rua Ita, 11", candidate: candidate_a, job_opportunity: job_opportunity_c)
