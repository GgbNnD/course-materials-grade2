%% 3.1
clc;
close all;
clear;

% read .wav
[y, Fs] = audioread('castanets44m.wav'); 

% draw the wave
t = (0:length(y)-1)/Fs; 
plot(t, y);
xlabel('Time (s)');
ylabel('Amplitude');

% play the sound
sound(y, Fs); 

%% 3.1A
clc;
close all;
clear;

[y, Fs] = audioread('castanets44m.wav');
y_rev = TimeReverse(y);
% draw the wave
t = (0:length(y)-1)/Fs;

figure(1)
subplot(1,2,1)
plot(t, y);
xlabel('Time (s)');
ylabel('Amplitude');

subplot(1,2,2)
plot(t, y_rev);
xlabel('Time (s)');
ylabel('Amplitude');

% play the sound
sound(y_rev, Fs); 

%% 3.1B
clc;
close all;
clear;

time = 0:0.1:10;
y = cos(time.*pi);
% subplot
subplot(3,2,1)
plot(time,y);
xlabel('Time');
ylabel('Amplitude');
subplot(3,2,2)
plot(time,fade(y,0));
xlabel('Time');
ylabel('Amplitude');
subplot(3,2,3)
plot(time,fade(y,1));
xlabel('Time');
ylabel('Amplitude');
subplot(3,2,4)
plot(time,fade(y,0.25));
xlabel('Time');
ylabel('Amplitude');
subplot(3,2,5)
plot(time,fade(y,-2));
xlabel('Time');
ylabel('Amplitude');
subplot(3,2,6)
plot(time,fade(y,100));
xlabel('Time');
ylabel('Amplitude');
%plot(time,y,'r',time,fade(y,0),'g',time,fade(y,1),'b',time,fade(y,0.25),'c',time,fade(y,-2),'m',time,fade(y,100),'y')
%xlabel('Time');
%ylabel('Amplitude');

%% 3.1C
clc;
close all;
clear;

[y, Fs] = audioread('bassdrum.wav'); 

subplot(2,2,1)
plot((0:length(y)-1)/Fs,y);
xlabel('Time');
ylabel('Amplitude');
subplot(2,2,2)
plot((0:length(repeat(y,3))-1)/Fs,repeat(y,3));
xlabel('Time');
ylabel('Amplitude');
subplot(2,2,3)
plot((0:length(repeat(y,0))-1)/Fs,repeat(y,0));
xlabel('Time');
ylabel('Amplitude');
subplot(2,2,4)
plot((0:length(repeat(y,-1))-1)/Fs,repeat(y,-1));
xlabel('Time');
ylabel('Amplitude');

%% 3.1D
clc;
close all;
clear;

[y, Fs] = audioread('bassdrum.wav'); 
t = (0:length(y)-1)/Fs; 

y_delay1 = delay(y,0.2,Fs);
t1 = (0:length(y_delay1)-1)/Fs; 
y_delay2 = delay(y,-0.1,Fs);
t2 = (0:length(y_delay2)-1)/Fs; 
y_delay3 = delay(y,-1,Fs);
t3 = (0:length(y_delay3)-1)/Fs; 

subplot(2,2,1)
plot(t,y);
xlabel('Time');
ylabel('Amplitude');
subplot(2,2,2)
plot(t1,y_delay1);
xlabel('Time');
ylabel('Amplitude');
subplot(2,2,3)
plot(t2,y_delay2);
xlabel('Time');
ylabel('Amplitude');
subplot(2,2,4)
plot(t3,y_delay3);
xlabel('Time');
ylabel('Amplitude');

%% 3.1E
clc;
close all;
clear;

[sound1, Fs] = audioread('mixed.wav'); 
t1 = (0:length(sound1)-1)/Fs; 

[sound2, Fs] = audioread('castanets44m.wav'); 
t2 = (0:length(sound2)-1)/Fs; 

mix_sound = mix(sound1,sound2,3,2);
mix_t = (0:length(sound2)-1)/Fs; 

subplot(3,1,1)
plot(t1,sound1);
xlabel('Time');
ylabel('Amplitude');
subplot(3,1,2)
plot(t2,sound2);
xlabel('Time');
ylabel('Amplitude');
subplot(3,1,3)
plot(mix_t,mix_sound);
xlabel('Time');
ylabel('Amplitude');