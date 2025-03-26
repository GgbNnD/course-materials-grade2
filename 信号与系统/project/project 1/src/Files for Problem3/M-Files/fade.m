function [ y ] = fade(x, level)
%
% fade(X): this function fades the audio vector X.
%
% fade(X, LEVEL): fades the audio vector X from 100% down to LEVEL.  
%                 fade(X) = fade(X, 0).
%                 LEVEL must be >= 0 and <= 1
%
% Examples:  
% Y = fade(X);
% Y = face(X, LEVEL); 

% create the ramp vector
%t = linspace(1, 0, length(x));

% multiply the audio vector with the ramp vector to fade
%y = t .* x;

%% my code
% process the level
if(level>1)
    level = 1;
elseif(level<0)
    level = 0;
end

%create the ramp vector
t = linspace(1,level,length(x));
% multiply the audio vector with the ramp vector to fade
y = t .* x;
