%   mix two sound
%   out = mix(sound1, sound2, Fs, gain1, gain2)
%
%   Input：
%       y1, y2 - sound
%       gain1, gain2 - the gain for the sound
%           adviced to be in [-1,1]
%
%   Output：
%       out - mixed sound
%   Example:
%       sound_mixed = mix(sound1,sound2,8000,0.4,0.6); 
function out = mix(sound1, sound2,gain1, gain2)

sound_copy1 = sound1;
sound_copy2 = sound2;

gainf1 = gain1/(gain1+gain2);
gainf2 = gain2/(gain1+gain2);

length1 = length(sound1);
length2 = length(sound2);
maxlength = max(length1,length2);
if(length1<maxlength)
    zerolength = maxlength-length1;
    zerosound = zeros(zerolength,1);
    sound_copy1 = [sound_copy1;zerosound];
end

if(length2<maxlength)
    zerolength = maxlength-length2;
    zerosound = zeros(zerolength,1);
    sound_copy2 = [sound_copy2;zerosound];
end

out = sound_copy1.*gainf1+sound_copy2.*gainf2;
maxAmp = max(abs(out));
out = out.*(1/maxAmp);
