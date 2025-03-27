% Generate note of particular score
% Input:
%   note    :name of note
%   type    :type of the note
%   amp     :the amplify of the note
% Output:
%   the column matrix of the note
function out = note(note,type,ratios)

% decide the frequency
frequency = 0;
switch note
    case "A"
        frequency = 220;
    case "A#"
        frequency = 220*2^(1/12);
    case "Bb"
        frequency = 220*2^(1/12);
    case "B"
        frequency = 220*2^(2/12);
    case "C"
        frequency = 220*2^(3/12);
    case "C#"
        frequency = 220*2^(4/12);
    case "Db"
        frequency = 220*2^(4/12);
    case "D"
        frequency = 220*2^(5/12);
    case "D#"
        frequency = 220*2^(6/12);
    case "Eb"
        frequency = 220*2^(6/12);
    case "E"
        frequency = 220*2^(7/12);
    case "F"
        frequency = 220*2^(8/12);
    case "F#"
        frequency = 220*2^(9/12);
    case "Gb"
        frequency = 220*2^(9/12);
    case "G"
        frequency = 220*2^(10/12);
    case "G#"
        frequency = 220*2^(11/12);
    case "Ab"
        frequency = 220*2^(11/12);
    case "A2"
        frequency = 440;
end

% decide the length of the note
beat = 4000;
duration_length = 0;
switch type
    case "whole"
        duration_length = beat*4;
    case "half"
        duration_length = beat*2;
    case "quarter"
        duration_length = beat;
    case "eighth"
        duration_length = beat/2;
    case "sixteenth"
        duration_length = beat/4;
end

pause_length = round(0.2*duration_length);

% generate the note
% sample frequency
Fs = 8000;
t = (0:duration_length-1)/Fs;
% use the adsr function to generate aplify
amp = adsr(duration_length,ratios);
% the duration column matrix
duration = sin(2*pi*frequency*t).*amp;
duration = transpose(duration);
pause = zeros(pause_length,1);
out = [duration;pause];

end