if inicializar  == false
{
	scr_textos();
	 audio_sound_gain(global.id_music1, 0.3, 30); // 30 frames para fazer fade
    audio_sound_gain(global.id_music2, 0.3, 30);
	inicializar = true;
}

if keyboard_check_pressed(ord("J"))
{
	if pagina < array_length(texto) - 1 {
	pagina++;
	}else {
		    audio_sound_gain(global.id_music1, 1, 30);
            audio_sound_gain(global.id_music2, 1, 30);

		
		instance_destroy();
	}
}
