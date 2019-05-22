%% zadanie przypominaj¹ce z poprzednich zajêæ
close all; clear all; clc;
% zalozcie czas t=<-5,5>s, Fs=100Hz
% x(t)= x1+x2+x3
% x1: sygnal harmoniczny, amp=0.7, f=21Hz
% x2: sygnal harmoniczny, amp=1.1, okres=0.25s
% x3: sygnal Gaussa, amp=1.5, srednia=0, odch=0.2
% wyswietl sygnal i jego widmo amplitudowe
 
Fs=100;
t=-5:(1/Fs):5;
x1=0.7.*sin(2*pi*t*21);
x2=1.1.*sin(2*pi*t*100/25);
x3=1.5.*exp((-(t-0).*(t-0))/(2*0.2*0.2));
x=x1+x2+x3;
subplot(211), plot(t,x);
XT=fft(x);
XT=fftshift(XT);
WA=abs(XT);
f=linspace(-Fs/2,Fs/2,length(t));
subplot(212), plot(f,WA);
 
%% transformata Fouriera
close all; clear all; clc;
 
Fs=100;
t=-5:(1/Fs):5;
x=1*(abs(t-0)<1);
XT=fft(x);
XT=fftshift(XT);
WA=abs(XT);
f=linspace(-Fs/2,Fs/2,length(t));
teor=abs(2*(sinc(2*f)*Fs)); %musi byc dwojka, teoretyczna wielkosc F(w),musi byc w wartosci bezwzglednej
plot(f,WA,'.r',f,teor,'g');
 
%% c.d.
close all; clear all; clc;
 
Fs=100;
t=-5:(1/Fs):5;
x=2*(1-abs(t-0)/(0.5)).*(t>=-0.5 & t<=0.5);
XT=fft(x);
XT=fftshift(XT);
WA=abs(XT);
f=linspace(-Fs/2,Fs/2,length(t));
teor=Fs*(sinc(2*f/4)).*(sinc(2*f/4));
plot(f,WA,'.r',f,teor,'g');