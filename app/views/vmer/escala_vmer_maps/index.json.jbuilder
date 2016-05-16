json.array!(@schedules) do |schedule|
	json.color 'white'
	json.textColor 'black'
	json.borderColor 'grey'
	json.backgroundColor '#ccc' if (schedule.user.escala_vmer_user.escala_vmer_group.id == 1)
	json.title schedule.user.nome_utilizador
	json.start schedule.inicio_turno
	json.end schedule.fim_turno
end