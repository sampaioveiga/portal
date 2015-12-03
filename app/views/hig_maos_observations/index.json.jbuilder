json.array!(@observations) do |observation|
	duracao = distance_of_time_in_words(observation.inicio_sessao, observation.fim_sessao)
	json.title observation.user.nome_utilizador
	json.start observation.inicio_sessao
	json.end observation.fim_sessao
	json.url hig_maos_observation_path(observation)
	json.description '<h2>' + observation.ulsne_site.nome_unidade + '</h2><p><b>Inicio:</b> ' + observation.inicio_sessao.to_s + '</p><p><b>Fim:</b> ' + observation.fim_sessao.to_s + '</p><p><b>Duração:</b> ' + duracao.to_s + '</p><p><b>N. oportunidades:</b> ' + observation.hig_maos_opportunities_clusters.count.to_s + '</p>'
end