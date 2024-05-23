clc
clear all
close all
% design of butterworth filter
% given specifications
ap=0.9; % gain in passband not in db
as=0.2; % gain in stopband not in db
t=1;% Sampling time
wp=pi/2;% digital frequency in passband
ws=(3*pi)/4;% digital frequency in stopband


%ap1=10^(-ap/20);%Converting form db to unitless.
%as1=10^(-as/20);%Converting form db to unitless.
ap1=abs(20*log10(ap)) %Convert to db
as1=abs(20*log10(as))

%determination of analog filter edge frequencies

ohm1=(2/t)*(tan(wp/2));
ohm2=(2/t)*(tan(ws/2));
o=ohm2/ohm1;

%calculation of filter order N

N=1/2*log10(((1/(as)^2-1)/(1/(ap)^2- 1)))  /log10 (ohm2/ohm1);
N=ceil(N)

%determination of cut off frequency
%ohmc=ohm1/(((10^(0.1*ap))-1))^(1/(2*N));
ohmc=ohm1/(((1/(ap^2))-1))^(1/(2*N));
wc=(2*atan(ohmc/2));
wc=wc/pi

[n,Wn]=buttord(wp/pi,ws/pi,ap1,as1)

[b,a]=butter(N,ohmc,'low','s')
Hs=tf(b,a);
[b1,a1]=bilinear(b,a,1/t);
Hz=tf(b1,a1,t)
%
%num1=(1/(0.04))-1
%num2=(1/(0.81))-1
%num=log(num1/num2)
%den=log(2.414)
%N=(1/2)*(num/den)