%%
close all; %clear all; clc; %nalezy zakomentowac clear all bo usunie z workspaca
% w fdatool stworzyc fir i irr, lowpass, fs=100, f=8 i 10
Fs=100;
t=-5:(1/Fs):5;
x=1.0*(abs(t)<1);
x_F=filter(HD_FIR,x);
dF=length(HD_FIR.Numerator)/(2*Fs); %poprawka, polowa dlugosci rzedu filtru, zawsze! dla fira jest prostsze, zeby ladnie sie nakladalo
x_I=filter(HD_IIR,x);
dI=2*length(HD_IIR.ScaleValues)/(Fs);
plot(t,x,'r',t-dF,x_F,'g',t-dI,x_I,'b');
 
%x_F=filtfilt(HD_FIR.Numerator,1,x);  %te funkcje sa adekwatne do powyzszych dzialan ale wygenerowalo pewne bledy na wykresie 
%x_I=filtfilt(HD_IIR.sosMatrix,HD_IIR.ScaleValue,x);
%plot(t,x,'r',t,x_F,'g',t,x_I,'b');
 
%% 
close all; %clear all; clc; %nalezy zakomentowac clear all bo usunie z workspaca
% w fdatool stworzyc fir i irr, lowpass, fs=100, f=8 i 8.5
Fs=100;
t=-5:(1/Fs):5;
x=1.0*(abs(t)<1);
x_F=filter(HD_FIR,x);
dF=length(HD_FIR.Numerator)/(2*Fs); %poprawka, polowa dlugosci rzedu filtru, zawsze! dla fira jest prostsze, zeby ladnie sie nakladalo
x_I=filter(HD_IIR,x);
dI=2*length(HD_IIR.ScaleValues)/(Fs);
 
%x_F=filtfilt(HD_FIR.Numerator,1,x);  %te funkcje sa adekwatne do powyzszych dzialan ale wygenerowalo pewne bledy na wykresie 
x_I=filtfilt(HD_IIR.sosMatrix,HD_IIR.ScaleValue,x);
plot(t,x,'r',t,x_F,'g',t,x_I,'b');
 
%% filtracja dolno i gorno przepustowqa 
close all; clear all; clc;
 
Fs=100;
t=0:(1/Fs):10;
x=1.0*(abs(t-5)<1);
N=35;
LP=ones(1,N)/N; %filtr jednorodny np dla trepazoew
odch=15;
LP=exp(-(-N:N).^2/(2*odch*odch)); %rozmycie gaussowskie
LP=LP/sum(LP(:)); %trzeba dodac do gaussowskiego
x_new=conv(x,LP,'same'); %tak samo jak konwolucja
plot(t,x,'r',t,x_new,'g');
 