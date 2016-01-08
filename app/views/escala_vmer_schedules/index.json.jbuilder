json.array!(@schedules) do |schedule|
	json.color 'green' if schedule.escalado
	json.title schedule.user.titulo + schedule.user.nome_utilizador
	json.utilizador schedule.user.id.to_s
	json.grupo schedule.user.escala_vmer_user.escala_vmer_group.id
	json.start schedule.inicio_turno
	json.end schedule.fim_turno
	json.url escala_vmer_schedule_path(schedule)
	json.description '<p><b>Grupo:</b> ' + schedule.user.escala_vmer_user.escala_vmer_group.nome_grupo + '</p>' + 
					'<p><b>Inicio do turno:</b> ' + schedule.inicio_turno.to_s  + '</p>' + 
					'<p><b>Fim do turno:</b> ' + schedule.fim_turno.to_s + '</p>' + 
					'<p><b>Observacoes:</b> ' + schedule.obs.to_s + '</p>' + 
					if schedule.escalado
						'<p><b>Escalado:</b> Sim</p>'
					else
						'<p><b>Escalado:</b> Não</p>'
					end

end