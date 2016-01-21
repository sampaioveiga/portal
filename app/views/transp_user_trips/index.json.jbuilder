json.array!(@trips) do |trip|
	if trip.aprovacao == 1
		json.color 'green'
	elsif trip.aprovacao == 2
		json.color 'red'
	end
	json.title trip.user.nome_utilizador
	json.start trip.data_inicio
	json.end trip.data_fim
	json.description '<p><small>Assunto: </small>' + trip.assunto + '</p>' +
		'<p><small>Data inicio: </small>' + trip.data_inicio.to_s + '</p>' +
		'<p><small>Data fim: </small>' + trip.data_fim.to_s + '</p>' +
		'<p><small>Destino: </small>' + trip.transp_destination.destino + '</p>' +
		'<p><small>Mais informação: </small>' + trip.observacoes + '</p>' +
		'<p><small>Local inicio: </small>' + trip.local_inicio.nome_unidade + '</p>' +
		'<p><small>Local regresso: </small>' + trip.local_fim.nome_unidade + '</p>' +
		'<p><small>Condutor: </small>' + trip.condutor + '</p>' +
		'<p><small>Ocupantes: </small>' + trip.numero_passageiros.to_s + '</p>' +
		'<hr />' +
		if trip.aprovacao == 1
			'<h3>Aprovado</h3>' + 
			'<h4><small>Comentários: </small>' + trip.comentarios_supervisor + '</h4>'
		elsif trip.aprovacao == 2
			'<h3>Não aprovado</h3>' + 
			'<h4><small>Comentários: </small>' + trip.comentarios_supervisor + '</h4>'
		else
			'<h3>Pendente</h3>'
		end
	if trip.ulsne_department.present?
		json.department trip.ulsne_department.nome_servico
	end
	json.url transp_user_trip_path(trip)
end