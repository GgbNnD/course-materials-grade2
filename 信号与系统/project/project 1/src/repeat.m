% Repeat the sound a number of times
%   Input:
%       sound - Column vector of audio samples
%       N - The times sound repeats
%       N is adviced to be an integer >=0
%   Output:
%       out - the repeated sound
%   Example:
%       sound_repeat = repeat(sound,3); 

function out = repeat(sound,N)

%process N
if(N<0)
    N = 0;
end
% turn N to integer
N = fix(N);

% repeat the sound
if(N==0)
    out = sound;
else
    out = sound;
    for i=1:N
        out = [out;sound];
    end
end