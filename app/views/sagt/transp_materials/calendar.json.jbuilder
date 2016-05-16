json.array!(@transports) do |transp|
	if transp.aprovacao == 1
		json.color 'green'
		json.aprovacao '1'
	elsif transp.aprovacao == 2
		json.color 'red'
		json.aprovacao '2'
	else
		json.aprovacao '0'
	end
	data_entrega = l(transp.data_entrega)
	json.textColor 'orange' if transp.urgente == 1
	json.textColor '#800000' if transp.urgente == 2
	json.title transp.user.nome_utilizador +
		' | ' + transp.ulsne_department.nome_servico +
		' | ' + transp.local_saida.destino
	json.start transp.data_entrega
	json.end transp.data_entrega + 1.hour
	json.description '<p><small>Assunto: </small>' + transp.assunto + '</p>' +
		'<p><small>Data entrega: </small>' + data_entrega + '</p>' +
		'<p><small>Destino: </small>' + transp.local_entrega.destino + '</p>' +
		'<p><small>Local inicio: </small>' + transp.local_saida.destino + '</p>' +
		'<p><small>Mais informação: </small>' + transp.observacoes + '</p>' +
		'<hr />' +
		if transp.aprovacao == 1
			'<h3>Aprovado</h3>' + 
			'<h4><small>Comentários: </small>' + transp.comentarios_supervisor + '</h4>'
		elsif transp.aprovacao == 2
			'<h3>Não aprovado</h3>' + 
			'<h4><small>Comentários: </small>' + transp.comentarios_supervisor + '</h4>'
		else
			'<h3>Pendente</h3>'
		end
	if transp.ulsne_department.present?
		json.department transp.ulsne_department.nome_servico
	end
	json.url sagt_transp_material_path(transp)
end