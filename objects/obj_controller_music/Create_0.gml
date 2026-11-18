// Para garantir que nenhuma
//outra música esteja tocando
audio_stop_all();
// Tocar música de fundo em loop e guardar IDs
global.id_music1 = audio_play_sound(snd_music, 0, true);
global.id_music2 = audio_play_sound(snd_retro_city, 1, true);

global.dialogo = false;