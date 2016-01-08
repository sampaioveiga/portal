json.array!(@schedules) do |schedule|
	json.color 'green'
	json.title schedule.user.titulo + schedule.user.nome_utilizador
	json.utilizador schedule.user.id.to_s
	json.grupo schedule.user.escala_vmer_user.escala_vmer_group.id
	json.start schedule.inicio_turno
	json.end schedule.fim_turno
end