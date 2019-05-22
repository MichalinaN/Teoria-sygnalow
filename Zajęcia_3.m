%% zadanie
close all; clear all; clc;
%t=<0,20>s, F=200 Hz
% t=<0,6>s, trojkatny, tw=3s, amp=2, szer=6
%t=<8,14>s,Gaussa, amp =1.5, sr=11s,std=0.5
%t=<15,19>s /|/| szerokosc zabka 2s, amp=3
%stworz wykres, policz srednia i energie
 
t=0:(1/200):20;
x=2*(1-abs(t-3)/3).*(t>=0 & t<=6);
x=x+1.5*exp((-(t-11).*(t-11))/(2*0.5*0.5)).*(t>=8 & t<=14);
x=x+3*mod(t-1,2)/2.*(t>=15 & t<=19);
plot(t,x)
ylim([-1,4])
[mean(x),x*x'/200]
 
%% splot
close all; clear all; clc;
 
t=-10:0.01:10;
x=3*(abs(t)<=2);
xx=conv(x,x,'same')*0.01; %same czyli wszystkie takiego samego typu,
                          %splot
plot(t,x,'r',t,xx,'g')
conv([1 3 0 2],[-1 0 1],'valid')%konwolucja, valid - zwraca tylko 
                                %te probki gdzie drugi sygnal byl 
                                %w calosci wewnatrz pierwszego
                                
%% 
close all; clear all; clc;
% t=<-10,10>, Fs=100Hz;
% x1 - trojkatny, tw=0s, amp=2, szer=6;
% x2 - prostokatny, srodek=0, amp=1, szer=w;
% stworz wykres splotu trojkatny z prostokatem dla 5 roznych w
 
t=-10:0.01:10;
x1=2*(1-abs(t)/3).*(abs(t)<3);
w=[1:2:9];
plot(t,x1,'r'); 
hold on;
for k=1:length(w)
    pros=1.0*(abs(t)<=w(k)/2);
    pros=pros/sum(pros(:)); %zamiast pisania 0.01 linijka ni¿ej
    xx=conv(x1,pros,'same');%*0.01;
    plot(t,xx);
end
hold off
 
%%
close all; clear all; clc;
% t=<0,40>s Fs=100Hz;
% x1 - sza, dla 4,8,12,16,.... amp=2
% x1 - sza, dla 2,6,10,14,.... amp=-1
% x2 - Gaussa, szer=10s, sr=20, odch=w
% policz i wyswietl splot, prztestuj rozne w
 
t=0:0.01:40
x1=2*(mod(t,4)==0)-(mod(t,4)==2);
w=2;
x2=exp((-(t-20).^2)/(2*w*w));
xx=conv(x1,x2,'same')
plot(t,x1,'r',t,xx,'g')
 