% Generate adsr envolope for the note
% Input:
%   sample  :the number of samples
%   ratios   :[attack, decay, sustain_level, release]
% Output:
%   the adrs matrixs
function out = adsr(sample,ratio)
    ratios = str2double(ratio);
    attack = linspace(0, 1, round(sample*ratios(1)));
    decay = linspace(1, ratios(3), round(sample*ratios(2)));
    sustain = ratios(3)*ones(1, sample-round(sample*sum([ratios(1),ratios(2),ratios(4)])));
    release = linspace(ratios(3), 0, round(sample*ratios(4)));
    
    out = [attack decay sustain release];
end