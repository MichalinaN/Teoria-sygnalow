%%

close all; clear all; clc;
% t=<-10,5>, Fs=100Hz,
% x=x1+x2+x3
% x1: harmoniczny, f=13Hz, amp od 0.5 (t=-10) do 0.8 (t=5)
% x2: Gauss, sr = -2s, std=0.5, amp=1
% x3: harm, f=25Hz, amp=1,1
Fs=100;
t=-10:(1/Fs):5;
x1=sin(2*pi*t*13).*(0.5+0.3*(t+10)/15); %bo mamy 15 sekund, dodajemy ró¿nicê miêdzy minimaln¹ a maksymaln¹ amplitud¹, mno¿ymy przez pocz¹tkow¹
x2=1*exp(-(t+2).*(t+2)/0.5);
x3=1.1*sin(2*pi*t*25);
x=x1+x2+x3;
X=fftshift(fft(x));
WA=abs(X);
f=(Fs/2)*(t+2.5)/7.5; %bo sygna³ od -10 do 5, po³owa to 7,5, mo¿na zastapic linspace
BS=1.0*(abs(f)<=8 | abs(f)>=18); %filtr, dolny 8 Hz, ¿eby przepuœciæ Gaussa, drugi ¿eby przepuœciæ drug¹, bo filtrujemy wartoœæ 13
x_new=real(ifft(ifftshift(X.*BS)));
subplot(211), plot(t,x, 'r', t, x_new, 'g');
subplot(212), plot(f,WA, 'r', f, BS*500, 'g');
 
 
%%
close all; clear all; clc;
% t=<-5,5>, Fs=200;
% x: pros, sr dla t=0, szer=1, amp=1
% sygnal, WA
Fs=200;
t=-5:(1/Fs):5;
x=1.*(abs(t-0)<0.5); %sygna³ prostok¹tny
f=(Fs/2)*t/5;
X=fftshift(fft(x));
WA=abs(X);
LP=1.0*(abs(f)<7);
BW=1./(1+(f/7).^6); %filtr Butterwortha, nieidealny dolnoprzepustowy, ¿eby by³ górnoprzepustowy dajemy na pocz¹tku 1-...
BG=exp(-(f.*f)/(2*7*7)); %filtr Gaussa
x_new=real(ifft(ifftshift(X.*BW)));
x2=real(ifft(ifftshift(X.*LP))); %dla porównania filtr idealny
x3=real(ifft(ifftshift(X.*BG)));
subplot(211), plot(t,x, 'r', t, x_new, 'g', t, x2, 'b', t, x3, '.r');
ylim([-0.5, 1.5]);
subplot(212), plot(f,WA, 'r', f, 150*BW, 'g', f, 150*BG, '.r');

%% u¿ycie filtra pasmozaporowego Butterwortha

close all; clear all; clc;
% t=<-10,5>, Fs=100Hz,
% x=x1+x2+x3
% x1: harmoniczny, f=13Hz, amp od 0.5 (t=-10) do 0.8 (t=5)
% x2: Gauss, sr = -2s, std=0.5, amp=1
% x3: harm, f=25Hz, amp=1,1
Fs=100;
t=-10:(1/Fs):5;
x1=sin(2*pi*t*13).*(0.5+0.3*(t+10)/15); %bo mamy 15 sekund, dodajemy ró¿nicê miêdzy minimaln¹ a maksymaln¹ amplitud¹, mno¿ymy przez pocz¹tkow¹
x2=1*exp(-(t+2).*(t+2)/0.5);
x3=1.1*sin(2*pi*t*25);
x=x1+x2+x3;
X=fftshift(fft(x));
WA=abs(X);
f=(Fs/2)*(t+2.5)/7.5; %bo sygna³ od -10 do 5, po³owa to 7,5, mo¿na zastapic linspace
% BS=1.0*(abs(f)<=8 | abs(f)>=18); %filtr, dolny 8 Hz, ¿eby przepuœciæ Gaussa, drugi ¿eby przepuœciæ drug¹, bo filtrujemy wartoœæ 13
BW=1./(1+(f*10./(f.^2-13^2)).^6);
x_new=real(ifft(ifftshift(X.*BW)));
subplot(211), plot(t,x, 'r', t, x_new, 'g');
subplot(212), plot(f,WA, 'r', f, BW*500, 'g');

%%
close all; clear all; clc;
a=load('trasa_02.txt');
% % dt=0.25ms
% % wyswietl, policz WA
dt=0.25*0.001;
Fs=1/dt;
t=(0:length(a)-1)'*dt; %czas od 0 do d³ugoœci a, ' potrzebny ¿eby obróciæ wektor pionowy a na poziomy
X=fftshift(fft(a));
f=linspace(-Fs/2, Fs/2, length(a))';
WA=abs(X);
BS=1.0*(abs(f)>150);
x_new=real(ifft(ifftshift(BS.*X)));
subplot(211), plot(t,a, 'r', t, x_new, 'g');
subplot(212), plot(f,WA, 'r', f, BS*150, 'g');
 


