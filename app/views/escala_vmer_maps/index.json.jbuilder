json.array!(@schedules) do |schedule|
	json.color 'green'
	json.title schedule.user.titulo + schedule.user.nome_utilizador
	json.utilizador schedule.user.id.to_s
	json.grupo schedule.user.escala_vmer_user.escala_vmer_group.id
	json.start schedule.inicio_turno
	json.end schedule.fim_turno
	json.url escala_vmer_schedule_path(schedule)
	json.description '<p>Grupo: ' + schedule.user.escala_vmer_user.escala_vmer_group.nome_grupo + '</p>' + 
					'<p>Inicio do turno: ' + schedule.inicio_turno.to_s  + '</p>' + 
					'<p>Fim do turno: ' + schedule.fim_turno.to_s + '</p>' + 
					'<p>Escalado: ' + schedule.escalado.to_s  + '</p>'
end