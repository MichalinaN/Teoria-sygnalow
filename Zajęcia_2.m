%% 1
clear all; close all; clc;

%sygna³ prostokatny

% t=<0,15>s, dt=0.01, pros dla t=<6,10>, amp=2.5
% stworz wykres i policz srednia
 
t=0:0.01:15; %dlugosc wykresu
x=2.5*(t>=6 & t <=10); % od 6 do 10 ma wysokosc 2.5
plot(t,x) %tworzenie wykresu
ylim([-1,3.5]); %zeby bylo ladnie graficznie
[mean(x) 2.5*(10-6)/(15-0)] %liczenie sredniej
[x*x'*0.01 (2.5)^2*(10-6)] %liczenie energii, x*x' to mnozenie macierzy x' to macierz transponowana
% lub sum(x.^2)=x*x'
 
%% 2
clear all; close all; clc;
 
%sygnal trojkatny

t=-5:0.01:5;
x=3*(1-abs(t-0)/(2)); % abs to wartosc bezwzgledna
% to samo co x=x.*(abs(t)<2);
x=x.*(x>0);
plot(t,x)
ylim([-0.5,4])
mean(x)
[x*x'*0.01]
 
%% 3
clear all; close all; clc;
 
%sygnal harmoniczny
 
t=0:0.01:4;
x=(3-(3-1)*t/3).*sin(2*pi*5*t);
plot(t,x)
 
%% 4
clear all; close all; clc;
 
%funkcja sinc
 
t=-5:0.01:5;
x=sinc(4*t);
plot(t,x)
 
%% 5
clear all; close all; clc;
 
%funkcja znaku (ujemna, dodatnia lub zero)
 
t=-5:0.01:5;
x=sign(t).*sinc(4*t);
plot(t,x)
 
%% 6
clear all; close all; clc;
 
%funkcja Heaviside'a do usuwania pewnych wartosci przed startem, zerowania
 
t=-5:0.01:5;
x=(t>=0).*sinc(4*t); %okresla w ktorym momencie mamy start
plot(t,x)
 
%% 7
clear all; close all; clc;
 
%delta Diraca - funkcja impulsowa; im wê¿szy sygna³, tym wy¿szy, stosuje
%siê krzyw¹ gaussowask¹; 
 
t=-5:0.01:5;
x=(t==0).*sinc(4*t); %w konkretnej probce czasu
plot(t,x)
 
%% 8
clear all; close all; clc;
 
%funkcja Sza
 
t=-5:0.01:5;
x=(mod(t,0.5)==0).*sinc(4*t+0.25);
plot(t,x)
 
%% 9
clear all; close all; clc;
 
%krzywa gaussowska
t=-10:0.01:10;
amp=3;
sr=20;
odchy=0.1;
x=amp*exp(-((t-sr).^2)/2*odchy.*odchy)
ylim([-20,20])
plot(t,x)