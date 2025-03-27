function music = generate_melody(melody_notes, bpm)
    % sample frequency
    Fs = 8000;                          
    beat_samples = round(60/bpm * Fs);   % 每拍样本数
   
    music = [];
    
    % generate note
    for i = 1:size(melody_notes, 1)
        note_info = melody_notes(i,:);
        note_wave = note(note_info(1), note_info(2), note_info(3:6));
        
        switch note_info{2}
            case 'whole'
                target_len = round(beat_samples*4);
            case 'half' 
                target_len = round(beat_samples*2);
            case 'quarter'
                target_len = round(beat_samples);
            case 'eighth'
                target_len = round(beat_samples/2);
        end
        
        if length(note_wave) > target_len
            note_wave = note_wave(1:target_len);
        else
            note_wave = [note_wave; zeros(target_len-length(note_wave),1)];
        end
        
        music = [music; note_wave];
    end
    
    music = add_reverb(music, Fs, 0.3);  
    music = music/max(abs(music));       
end

function y = add_reverb(x, Fs, mix)
    delay = round(0.1*Fs);  
    atten = 0.5;            
    
    y = zeros(size(x));
    y(1:delay) = x(1:delay);
    
    for n = delay+1:length(x)
        y(n) = x(n) + atten*y(n-delay);
    end
    
    y = (1-mix)*x + mix*y; 
end