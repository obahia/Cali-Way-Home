function scr_textos(){
 switch npc_nome 
 {
	 case "gato1":
	 audio_play_sound(snd_npc1, 1, false);
	   texto[0] = "Por favor... tens de me ajudar! Perdi-me e não consigo voltar para casa sozinho. Estas ruas são demasiado perigosas... cheias de ratos esfomeados, sombras estranhas e... e o Grande Cão! Ele está por todo o lado, a farejar-nos, a impedir que alguém consiga passar. Estou com medo... não quero ficar preso aqui para sempre. Dizem que és corajosa... talvez consigas ajudar-me a encontrar o caminho de volta. Eu só quero regressar a casa...";
	 break;
	 
	 case "gato2":
	 audio_play_sound(snd_npc2, 1, false);
	 texto[0] = "Ei... tu não és daqui, pois não? Nota-se no teu andar... ainda tens esperança no olhar. Eu tentei sair sozinho, acredita... mas estas ruas estão cheias de armadilhas, ratos agressivos, e o pior de todos... o Grande Cão. Ele sente o medo. Aparece quando menos se espera. Eu... eu já não consigo mais. Mas talvez tu consigas. Se fores mesmo tão corajosa como dizem, derrote o Grande Cão? Só quero ter uma hipótese de voltar a casa.";
	 break;
 }
}