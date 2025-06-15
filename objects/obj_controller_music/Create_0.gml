// Para garantir que nenhuma outra música esteja tocando
audio_stop_all();

// Tocar música de fundo em loop
audio_play_sound(snd_music, 0, true); // 0 = prioridade, true = loop
audio_play_sound(snd_retro_city, 1, true); // 

