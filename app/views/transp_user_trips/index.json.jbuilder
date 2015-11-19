json.array!(@trips) do |trip|
	json.title trip.user.nome_utilizador
	json.start trip.data_inicio
	json.end trip.data_fim
	json.description trip.assunto
	json.url transp_user_trip_path(trip)
end