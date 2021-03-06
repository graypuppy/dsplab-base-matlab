[x,fs]=audioread('d.mp3');%原信号
n=size(x,1);%提取采样信号的长度
t=(0:length(x)-1)/fs;%计算样本时刻
f=fs*(0:(n+1)/2-1)/n+1;%计算频域图的频率
X=fft(x,n+1);%进行N+1点FFT变换
ts=0:1/fs:(size(x)-1)/fs;%将所加噪声信号的点数调整到与原始信号相同
s=x(:,1)'+0.05*sin(2*pi*5000*ts);%加噪声为5000Hz的正弦信号正弦噪声
S=fft(s,n+1);%加正弦噪声后的频域
%正弦滤波
wp=2000/fs*2*pi;%2000为通带截止频率
ws=3000/fs*2*pi;%3000为阻带下限截止频率
Rp=4;%通带波纹
Rs=25;%阻带波纹
T=1/fs;Fs=1/T;%定义采样间隔
Wp=2/T*tan(wp/2);%计算对应的数字频率
Ws=2/T*tan(ws/2);
[N,wn]=buttord(Wp,Ws,Rp,Rs,'s');%计算滤波器介数和截止频率
[c,d]=butter(N,wn,'s');%计算滤波器系统函数分子分母系数
[B,A]=bilinear(c,d,Fs);%双线性变换得到数字滤波器系统函数分子分母系数
[Hb,Wc]=freqz(B,A);
sf=filter(B,A,s);%对加噪信号进行滤波
Sf=fft(sf,n+1);%对滤波后进行N+1点FFT变换
%绘图部分
figure(1);
subplot(2,1,1);
plot(t,x);
title('原信号时域');
xlabel('时间（s）');
ylabel('幅度');
subplot(2,1,2);
plot(f,abs(X(1:(n+1)/2)));
title('原信号频域');
xlabel('频率(Hz)');
ylabel('幅度');
figure(2);
subplot(2,1,1);
plot(t,s);title('加正弦信号后的时域');xlabel('时间(s)');
ylabel('幅度');
subplot(2,1,2);
plot(f,abs(S(1:(n+1)/2)));
title('加正弦信号后的频域图');xlabel('频率(Hz)');
ylabel('幅度');
figure(3);
subplot(2,1,1);
plot(t,sf);title('滤波后的时域图');xlabel('时间(s)');
ylabel('幅度');
subplot(2,1,2);
plot(f,abs(Sf(1:(n+1)/2))); title('滤波后的频域图');xlabel('频率(Hz)');
ylabel('幅度');sound(x);sound(s);sound(sf);
figure(4);
plot(fs*Wc/(2*pi),20*log10(abs(Hb)));
title('巴斯低通滤波器频域响应图');
xlabel('频率(Hz)');
ylabel('幅度');
sound(x);
sound(s);
sound(sf);

[x,fs]=audioread('d.mp3');%原信号
N=size(x,1);%提取采样信号的长度
t=(0:length(x)-1)/fs;%计算样本时刻
f=fs*(0:(N+1)/2-1)/N+1;%计算频域图的频率
X=fft(x,N+1);%进行N+1点FFT变换
%加高斯白噪声
z=awgn(x,20);%对信号加信噪比10的高斯白噪声
N1=size(z,1);
t=(0:length(z)-1)/fs;
f=fs*(0:(N1+1)/2-1)/N1+1;
Z=fft(z,N1+1);
Wp=2500/fs*2*pi;
Ws=3000/fs*2*pi;
B=Ws-Wp;
n=ceil(1*pi/B);
wc=(Wp+Ws)/2;
b=fir1(n-1,wc/pi,'stop',blackman(n));%oblackman窗函数滤波
h=freqz(b,1);
y=fftfilt(b,z);
t1=(0:length(y)-1)/fs;
Y=fft(y,N1+1);
figure(1);
subplot(2,1,1);
plot(t,z);title('加高斯白噪声后时域图');
subplot(2,1,2);
plot(f,abs(Z(1:(N1+1)/2)));title('滤波前信号频谱图');
figure(2);
subplot(2,1,1);plot(t1,y);
title('滤波后信号时域图');xlabel('时间(s)');
ylabel('幅度');subplot(2,1,2);
plot(f,abs(Y(1:(N1+1)/2)));title('滤波后信号频谱图');
xlabel('频率(Hz）');ylabel('幅度');
figure(3);
plot(fs*w/(2*pi),20*log10(abs(h)));title('blackman 函数频域响应图');
title('频率响应')
xlabel('频率（Hz）');ylabel('幅度');
sound(y,fs);
