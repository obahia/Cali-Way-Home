draw_self();

if (show_bar) {
    var max_frames = 6; // 7 frames, de 0 a 6
    var frame = round((hp / hp_max) * max_frames);
    frame = clamp(frame, 0, max_frames);

    var bar_x = x;
    var bar_y = y + sprite_get_height(sprite_index)/2 + 10;

    draw_sprite(spr_life_boss, frame, bar_x, bar_y);
}
