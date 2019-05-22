close all; clear all; clc;

a=5
b=4
c='abc'
d=a+b
e=a+c

%% 1
close all; clear all; clc;
a = [ 1 2 3 ]'
b = [1; 2; 3;]
a.*b
b./a

% komentarz

c = 11:-2:5

%% 2
close all; clear all; clc;
a = [1 2; 3 4]
a = [1:2;3:4]
a=ones(2,2)
b=zeros(3,1)
c=eye(3)
d=rand(2,3)
e=randn(3,5)

x=5*rand(5,7)-2
y=5*randn(10,6)-2
bb=x(1:2:5,[2:3,5])
median(bb(:))

%% 3
close all; clear all; clc;
a = rand(10,10)
if sum(a(:)) > 50
    disp('suma>50')
else 
    disp('nie jest')
end
 
for kz=1:2:10
    for kx=[1,2,5]
        disp(a(kz,kx))
    end
end

%% 4 
close all; clear all; clc;
t=0:0.01:2*pi;
x=sin(t);
y=cos(2*t);
plot(t,x,'d-k',t,y,'or')
xlabel('os y');
ylabel('os y');
ylim([-2,2]);
legend('sinus','cosinus')
hold on
plot(t,x+y,':b');
hold off
subplot(221), plot(t,x);
subplot(222), plot(t,y);

subplot(2,2,[3,4]), plot(t,x+y);
xlabel('os x');
ylabel('os y');
ylim([-2,2]);
legend('sinus','cosinus')

%% 4 
close all; clear all; clc;
t=0:0.01:2*pi;
x=sin(t);
y=cos(2*t);

subplot(2,2,[3,4]), plot(t,x+y);
