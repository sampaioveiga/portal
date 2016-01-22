json.array!(@schedules) do |schedule|
	json.color 'green' if schedule.escalado
	json.title schedule.user.titulo + schedule.user.nome_utilizador
	json.utilizador schedule.user.id.to_s
	json.grupo schedule.user.escala_vmer_user.escala_vmer_group.id
	json.start schedule.inicio_turno
	json.end schedule.fim_turno
	json.url escala_vmer_schedule_path(schedule)
	json.description '<p><small>Grupo:</small> ' + schedule.user.escala_vmer_user.escala_vmer_group.nome_grupo + '</p>' + 
					'<p><small>Inicio do turno:</small> ' + schedule.inicio_turno.to_s  + '</p>' + 
					'<p><small>Fim do turno:</small> ' + schedule.fim_turno.to_s + '</p>' + 
					'<p><small>Observacoes:</small> ' + schedule.obs.to_s + '</p>' + 
					if schedule.escalado
						'<p><small>Escalado:</small> Sim</p>'
					else
						'<p><small>Escalado:</small> Não</p>'
					end

end