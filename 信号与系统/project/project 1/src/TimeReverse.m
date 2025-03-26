%   reverses an audio signal
%   sound_rev = TimeReverse(y) returns a time-reversed version of input signal y
%   
%   Input:
%       y - Column vector of audio samples
%   Output:
%       sound_rev - Time-reversed audio signal
%   Example:
%       y_rev = TimeReverse(y); 
function sound_rev = TimeReverse(y)
    sound_rev = flipud(y);
end