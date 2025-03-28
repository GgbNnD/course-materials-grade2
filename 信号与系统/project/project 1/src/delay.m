% Delay the sound for a particular time
%   Input:
%       sound - Column vector of audio samples
%       delay(s) - the time user want to delay
%           note:if delay<0 ,the sound would be put in advance,
%                it may destroy some information           
%       Fs(Hz) - the frequency of the sound
%   Output:
%       out - the delayed sound
%   Example:
%       sound_delay = delay(sound,1,8000); 
function out =delay(sound,delay,Fs)

if(delay>0)
    zero_length = delay*Fs;
    zero_sound = zeros(zero_length,1);
    out = [zero_sound;sound];
elseif(delay == 0)
    out = sound;
else
    advance_length = -delay*Fs;
    if(advance_length<length(sound))
        out = sound((advance_length+1):length(sound),:);
    else
        out = 0;
    end
end