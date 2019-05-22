%%
close all; clear all; clc;
 
% t=<-10,10>s Fs=100Hz
% x1(t) = trojkat, amp=0.8, szer=8s, tw=-2s
% x2(t) = trojkat, amp=1.1, szer=5s, tw=5s
% stworzyæ sygna³y, policzyæ splot
% wyœwietlic sygna³y i ich splot
 
Fs=100;
t = -10:(1/Fs):10 % wektor czasu
x1 = 0.8 *(1-abs(t+2)/4).*(t>-6 & t<2);
x2 = 1.1*(1-abs(t-5)/2.5).*(t>2.5 & t<7.5);
xx=conv(x2,x1,'same')/Fs;
tc=-20:(1/Fs):20;
xc=xcorr(x2,x1);
subplot(211),plot(t,x1,'r',t,x2,'g',t,xx,'b');
subplot(212),plot(tc,xc);
 
%%
close all; clear all; clc;
a=load('corr_01.txt');
t=a(:,1);
x=a(:,2);
subplot(211), plot(t,x)
% prostpk¹t --> czas=7s, amp=0.7
% trójk¹t --> czas=10s, amp=0.8
 
dt=t(2)-t(1);
pros=0.7*(0:dt:7); %stworzyliœmy czas równy 7 sekund
troj=0.8*(1-abs(-5:dt:5)/5)
xc=xcorr(x,troj); %tworzymy korelacje x z prostok¹tem
xc1=xcorr(1-x,1-troj)+xc
tc=-100:dt:100; %"z palca" wprowadzamy czas
nr=find(xc1==max(xc1(:)),3,'first') %maksimum wektora korelacji 
% przyrownujemy nasz wektor do tej wartosci, 1 to znaczy ile 
% takich wartosci ma zwrocic, (jesli sinus to zaezy od szerokosci 
% przedzialu) parametr first to kierunek, ktora pierwsze bierze,
% które nas zadawalaj¹, jesli nas interesuje pierwsze to wchodzimy 
% na pole minowe, funkcja find dostajemy numer próbki 
tc(nr) % przeliczamy po³o¿enie wektora na czas w sekundach
subplot(212), plot(tc,xc1)% 'r' 'g' to kolor
% gauss --> czas trwania=20s, amp=0.8, std=2sgrt(2)
tg=-10:dt:10;
xg=0.8*exp(-tg.*tg/16);
xc=xcorr(x,xg);
nr=find(xc>0.9999*max(xc(:)),3,'first');
tc(nr)
 