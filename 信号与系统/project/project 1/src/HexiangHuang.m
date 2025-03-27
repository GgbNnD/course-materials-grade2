% sound speed
bpm = 120;

% ADSR
%piano_adsr = [0.08, 0.15, 0.6, 0.25];  
%strings_adsr = [0.125, 0.2, 0.5, 0.25];
piano_adsr = [0.05, 0.1, 0.7, 0.15];
strings_adsr = [0.2, 0.3, 0.8, 0.3];

% main_melody
main_melody = [

    ["E", "quarter", piano_adsr];  ["D", "eighth", piano_adsr];
    ["C", "quarter", piano_adsr];  ["B", "half", piano_adsr];
    ["A", "quarter", strings_adsr]; ["C", "quarter", strings_adsr];
    ["E", "half", strings_adsr];    ["G", "quarter", strings_adsr];
    

    ["F", "eighth", strings_adsr];  ["A", "quarter", strings_adsr];
    ["G", "quarter", strings_adsr]; ["F#","eighth", strings_adsr];
    ["E", "whole", strings_adsr];   ["D", "quarter", strings_adsr];
    ["C", "eighth", strings_adsr];  ["B", "half", piano_adsr];
    

    ["A", "quarter", strings_adsr]; ["C", "eighth", strings_adsr];
    ["E", "quarter", strings_adsr]; ["G", "half", strings_adsr];
    ["F#", "quarter", strings_adsr];["A", "eighth", strings_adsr];
    ["G", "whole", strings_adsr];   ["F#", "quarter", piano_adsr];
    

    ["E", "half", piano_adsr];     ["D", "eighth", piano_adsr];
    ["C", "whole", piano_adsr]
];

% generate music
summer_end = generate_melody(main_melody, bpm);

% add environmental sound
env = audioread("..\asset\rain.mp3");
env = timescale(env,8000,44100);
summer_end = mix(summer_end, env(1:length(summer_end),1), 0.6, 0.4);

sound(summer_end,8000);

% save as .wav
audiowrite("..\asset\HexiangHuang.wav",summer_end,8000);