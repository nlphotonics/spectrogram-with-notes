%%
clear
[x,Fs] = audioread('winter.wav');
x = x(:,1); % keep one channel only

%%
M = 1024;
L = 255;
g = hamming(M);
Ndft = 4096;

[s,f,t] = spectrogram(x,g,L,Ndft,Fs);

%%
h = pcolor(t,f,abs(s).^2);
h.Annotation.LegendInformation.IconDisplayStyle = 'off';
xlabel("time (s)"); ylabel("frequency (Hz)");
colormap pink
shading flat


fmin = 400; fmax = 1200; % frequency range to draw the reference lines of notes

h = refline(0,fmin);
h.Color = 'b'; h.LineStyle  = "-.";
h.Annotation.LegendInformation.IconDisplayStyle = 'off';
h = refline(0,fmax);
h.Color = 'b'; h.LineStyle  = "-.";
h.Annotation.LegendInformation.IconDisplayStyle = 'off';

nmin = ceil(log2(fmin/440)*12+9); % minimum semitones above middle C (A4 = 440 Hz) 
nmax = floor(log2(fmax/440)*12+9); % maximum semitones above middle C (A4 = 440 Hz) 

for n = nmin:nmax
    h = refline(0, 440*2^((n-9)/12));
    h.Annotation.LegendInformation.IconDisplayStyle = 'off';
    if mod(n,12) == 0 % C note
        h.Color = 'r'; 
        h.Annotation.LegendInformation.IconDisplayStyle = 'on'; 
        h.DisplayName = "C" + num2str(4+n/12);
    elseif mod(n,12) == 2 || mod(n,12) == 4 || mod(n,12) == 5 || mod(n,12) ==7 || mod(n,12) == 9 || mod(n,12) == 11  % white note
        h.Color = 'w'; 
    else % black note
        h.Color = 'w'; h.LineStyle  = "--";
    end
end

legend('show');
