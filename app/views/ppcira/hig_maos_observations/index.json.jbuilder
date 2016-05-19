json.array!(@observations) do |observation|
	inicio_sessao = l(observation.inicio_sessao)
	fim_sessao = l(observation.fim_sessao)
	duracao = distance_of_time_in_words(observation.inicio_sessao, observation.fim_sessao)
	json.title observation.user.nome_utilizador
	json.start observation.inicio_sessao
	json.end observation.fim_sessao
	json.url ppcira_hig_maos_observation_path(observation)
	json.description '<h3><small>Servico:</small> ' + observation.ulsne_department.nome_servico +
		' | <small>Unidade:</small> ' + observation.ulsne_site.nome_unidade +
		'</h3><p><small>Inicio:</small> ' + inicio_sessao + '</p>' +
		'<p><small>Fim:</small> ' + fim_sessao + '</p>' + 
		'<p><small>Duração:</small> ' + duracao.to_s + '</p>' + 
		'<p><small>N. oportunidades:</small> ' + observation.hig_maos_opportunities_clusters.count.to_s + '</p>'
end