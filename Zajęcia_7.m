%% 1
close all; clear all; clc;
 
%Fs=50Hz, t=<-5,15>s,
%f=t/2 dla t=<0,3>, 1.5 dla t=(3,6> i 0 dla t=(6,8>
%Narysuj funkcje i jej rozwiniêcie dla N=60 wyrazów
 
Fs=50;
t=-5:(1/Fs):15;
xt=(t/2).*(t>=0 & t<=3)+1.5*(t>3 & t<=6)+0*(t>6 & t<=8);
FX=27*ones(size(t))/32;
 
for n=1:60
    an=(2/(n*n*pi*pi))*(cos(3*n*pi/4)-1)+((3/(2*n*pi))*sin((3*n*pi)/2));
    bn=(2/(n*n*pi*pi))*(sin(3*n*pi/4))-((3/(2*n*pi))*cos((3*n*pi)/2));
    FX=FX+an*cos(n*pi*t/4)+bn*sin(n*pi*t/4);
end
plot(t,xt,'.r',t,FX,'b')
 
%% 2
close all; clear all; clc;
% widomo amplitudowe
Fs=100;
t=0:(1/Fs):10;
x=3*(abs(t-5)<2); %sygnal prostokatny, o srodku w 5 i wysokosci 3
subplot(211), plot(t,x);
xlabel('Czas [s]');
XT=fft(x);  %prosta, szybka transformacja fouriera
XT=fftshift(XT); 
WA=abs(XT);
WF=angle(XT); %widmo amplitudowe i fazowe sa funkcj¹ czêstotliwosci!! 
              %Wyœwietlamy nie w funkcji czasu!
%f=linspace(0,Fs,length(t)); %rowny odstep tworzy wektor 
                             %o wartosci od 0 do Fs o dlugosci length(t)
f=linspace(-Fs/2,Fs/2,length(t));                            
subplot(212), plot(f,WA);
xlabel('Czestotliwosc [Hz]');
                
%% 3
close all; clear all; clc;
% widomo faozwe
Fs=100;
t=0:(1/Fs):10;
x=3*(abs(t-5)<2); %sygnal prostokatny, o srodku w 5 i wysokosci 3
subplot(211), plot(t,x);
xlabel('Czas [s]');
XT=fft(x);  %prosta, szybka transformacja fouriera
XT=fftshift(XT); 
WA=abs(XT);
WF=angle(XT); %widmo amplitudowe i fazowe sa funkcj¹ czêstotliwosci!! 
              %Wyœwietlamy nie w funkcji czasu!
%f=linspace(0,Fs,length(t)); %rowny odstep tworzy wektor 
                             %o wartosci od 0 do Fs o dlugosci length(t)
f=linspace(-Fs/2,Fs/2,length(t));                            
subplot(212), plot(f,unwrap(WF));   %mozna bez unwrap
xlabel('Czestotliwosc [Hz]');