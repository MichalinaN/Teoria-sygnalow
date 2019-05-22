%%
close all; clear all; clc;
Fs=50;
t=-5:(1/Fs):5;
x=1.0*(abs(t)<1);
xs=x+0.1*randn(size(t)); %dodawanie szumu, szum gausowski, bialy w rozkladzie normalnym, o jakims odchyleniu u nas 0.1
%x=1*(t==0);
N=15;
LP=ones(1,N)/N;
x_avg=conv(xs,LP,'same');
x_med=medfilt1(xs,N); %pokrywa z linia czerwona, medianowa,
%filtracja adaptacyjna, filtr sam okresla jak mocno bedziemy filtrowac -
%filtracja winiera; 1x501 to winier powinien miec na (1,N), jesli 501x1
%to wtedy powinno byc (N,1) - pionowy
x_wnr=wiener2(xs,[1 N]);
plot(t,x,'r',t,x_avg,'g',t,x_med,'b',t,x_wnr,'y');
E_avg=sqrt((x-x_avg)*(x-x_avg)');
E_med=sqrt((x-x_med)*(x-x_med)');
E_wnr=sqrt((x-x_wnr)*(x-x_wnr)');
[E_avg E_med E_wnr]
 
%%
close all; clear all; clc;
Fs=50;
t=-5:(1/Fs):5;
x=1.0*(abs(t)<1);
szum=rand(size(t));
xs=x+(szum<=0.025)*1-(szum>=0.975); %prawdopodobienstwo 2,5%
N=5;
LP=ones(1,N)/N;
x_avg=conv(xs,LP,'same');
x_med=medfilt1(xs,N); %pokrywa z linia czerwona, medianowa,
%filtracja adaptacyjna, filtr sam okresla jak mocno bedziemy filtrowac -
%filtracja winiera; 1x501 to winier powinien miec na (1,N), jesli 501x1
%to wtedy powinno byc (N,1) - pionowy
x_wnr=wiener2(xs,[1 N]);
plot(t,xs,'r',t,x_avg,'g',t,x_med,'b',t,x_wnr,'y');
E_avg=sqrt((x-x_avg)*(x-x_avg)');
E_med=sqrt((x-x_med)*(x-x_med)');
E_wnr=sqrt((x-x_wnr)*(x-x_wnr)');
[E_avg E_med E_wnr]
 
%%
close all; clear all; clc;
Fs=50;
t=-5:(1/Fs):5;
%x=1.0*(abs(t)<1);
x=exp(-t.*t/2);
szum=rand(size(t));
xs=x+(szum<=0.025)*1-(szum>=0.975); %prawdopodobienstwo 2,5%
N=5;
LP=ones(1,N)/N;
x_avg=conv(xs,LP,'same');
x_med=medfilt1(xs,N); %pokrywa z linia czerwona, medianowa,
%filtracja adaptacyjna, filtr sam okresla jak mocno bedziemy filtrowac -
%filtracja winiera; 1x501 to winier powinien miec na (1,N), jesli 501x1
%to wtedy powinno byc (N,1) - pionowy
x_wnr=wiener2(xs,[1 N]);
plot(t,x,'r',t,x_avg,'g',t,x_med,'b',t,x_wnr,'y');
E_avg=sqrt((x-x_avg)*(x-x_avg)');
E_med=sqrt((x-x_med)*(x-x_med)');
E_wnr=sqrt((x-x_wnr)*(x-x_wnr)');
[E_avg E_med E_wnr]
 
%%
close all; clear all; clc;
Fs=50;
t=-5:(1/Fs):5;
x=exp(-t.*t/2);
xs=x+0.1*randn(size(t));
k=1;
X=fftshift(fft(xs));
f=linspace(-Fs/2,Fs/2,length(t));
for N=3:2:101;
LP=ones(1,N)/N;
x_avg=conv(xs,LP,'same');
x_med=medfilt1(xs,N);
x_wnr=wiener2(xs,[1 N]);
x_f=real(ifft(ifftshift(X.*(f<N/4))));
%plot(t,x,'r',t,x_avg,'g',t,x_med,'b',t,x_wnr,'y');
E_avg(k)=sqrt((x-x_avg)*(x-x_avg)');
E_med(k)=sqrt((x-x_med)*(x-x_med)');
E_wnr(k)=sqrt((x-x_wnr)*(x-x_wnr)');
E_f(k)=sqrt((x-x_f)*(x-x_f)');
k=k+1;
end
N=3:2:101;
plot(N,E_avg,'r',N,E_med,'g',N,E_wnr,'b',N,E_f,'k');
[E_avg E_med E_wnr]
 
%% analiza czasowo-czestotliwosciowa - STFT, wieloktrotne widmo amplitudowe dlka roznyh odcinkow sygnalu
close all; clear all; clc;
t=0:0.01:12;
Fs=100;
%dla t=<0,4>s sygnal harmoniczny amp=1, f=12hz
%dla t=(4,8>s sygnal harmoniczny amp1.2, f=22Hz
%dla t=(8,12>s sygnal harmoniczny amp=0.8, f=7Hz
%stworz sygnal x, policz i wyswietl widmo amplitudowe
 
x1=1.0*sin(2*pi*t*12).*(t>=0 & t<=4);
x2=1.2*sin(2*pi*t*22).*(t>4 & t<=8);
x3=0.8*sin(2*pi*t*7).*(t>8 & t<=12);
x=x1+x2+x3;
X=fftshift(fft(x));
f=linspace(-Fs/2,Fs/2,length(t));
WA=abs(X);
subplot(211), plot(t,x)
subplot(212), plot(f,WA)
okno=32; %szerokosc okna w ktorym bedziemy liczyc tranfoprmate fouriera
N=length(t);
A=zeros(okno,N-okno); %tabela dla wynikow
for k=1:(N-okno)
    xx=x(k:k+okno-1); %wyciagamy kawelk sygnalu
    WW=abs(fftshift(fft(xx)));
    A(:,k)=WW'; %zapisujemy wynik w k-atej kolumnie
end 
tt=(0:N-okno-1)/Fs;
ff=linspace(-Fs/2,Fs/2,okno);
figure;
imagesc(A); colorbar('vertical');
%okreslamy albo czas albo czestotliwosc, w zaleznosci od rozmiaru okna, nie
%da sie ustalic obu wartosci jednoczesnie
 
%% analiza czasowo-czestotliwosciowa - STFT, wieloktrotne widmo amplitudowe dlka roznyh odcinkow sygnalu
close all; clear all; clc;
t=0:0.01:12;
Fs=100;
%dla t=<0,4>s sygnal harmoniczny amp=1, f=12hz
%dla t=(4,8>s sygnal harmoniczny amp1.2, f=22Hz
%dla t=(8,12>s sygnal harmoniczny amp=0.8, f=7Hz
%stworz sygnal x, policz i wyswietl widmo amplitudowe
 
x=sin(pi*t.*(t+1));
X=fftshift(fft(x));
f=linspace(-Fs/2,Fs/2,length(t));
WA=abs(X);
subplot(211), plot(t,x)
subplot(212), plot(f,WA)
okno=128; %szerokosc okna w ktorym bedziemy liczyc tranfoprmate fouriera
N=length(t);
A=zeros(okno,N-okno); %tabela dla wynikow
for k=1:(N-okno)
    xx=x(k:k+okno-1); %wyciagamy kawelk sygnalu
    WW=abs(fftshift(fft(xx)));
    A(:,k)=WW'; %zapisujemy wynik w k-atej kolumnie
end 
tt=(0:N-okno-1)/Fs;
ff=linspace(-Fs/2,Fs/2,okno);
figure;
imagesc(tt,ff,A); colorbar('vertical');
 