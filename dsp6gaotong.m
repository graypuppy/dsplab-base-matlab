% [x,fs]=audioread('chirp.wav');
% x=x(:,1);
% Y=fft(x);
% Fp=4500;Fs=5000;
% As=100;Ap=1;
% wp=2*pi*Fp/Ft;
% ws=2*pi*Fs/Ft;
% [n,wn]=ellipord(wp,ws,Ap,As,'s');
% [b,a]=ellip(n,Ap,As,wn,'high','s');
% [B,A]=bilinear(b,a,1);
% [h,w]=freqz(B,A);
% y=filter(B,A,x);
% Y1=fft(y);
% n=0:length(x)-1;
% %t=(0:FS-1)/fs;
% figure;
% subplot(4,1,1);
% plot(x);  grid on;
% title( 'ԭ�����ź�ʱ����ͼ' );  
% xlabel( '��λ' );ylabel( '����' );
% subplot(4,1,2);plot(y);grid on;
% title('��ͨ�˲����˲��������ź�ʱ����');
% xlabel('ʱ��');
% ylabel('����');
% subplot(4,1,3);plot(n,abs(Y));grid on;
% title('�˲�ǰ�����ź�Ƶ��');
% xlabel('Ƶ��');
% ylabel('����');
% axis([0 1000000 0 8]);
% subplot(4,1,4);plot(n,abs(Y1));grid on;
% title('�˲��������ź�Ƶ��');
% xlabel('Ƶ��');
% ylabel('����');
% axis([0 1000000 0 8]);
[x,fs]=audioread('chirp.wav');  
x=x(:,1);  
Y=fft(x);  
Fp=4500;Fs=5000;  Ft=8000;
As=100;Ap=1;  
wp=2*pi*Fp/Ft;  
ws=2*pi*Fs/Ft;  
[n,wn]=ellipord(wp,ws,Ap,As,'s');  
[b,a]=ellip(n,Ap,As,wn,'high','s');  
[B,A]=bilinear(b,a,1);  
[h,w]=freqz(B,A);  
y=filter(B,A,x);  
Y1=fft(y);  
n=0:length(x)-1;  
%t=(0:FS-1)/fs;  
figure;  
subplot(4,1,1);  
plot(x);  grid on;  
title( 'ԭ�����ź�ʱ����ͼ' );    
xlabel( '��λ' );ylabel( '����' );  
subplot(4,1,2);plot(y);grid on;  
title('��ͨ�˲����˲��������ź�ʱ����');  
xlabel('ʱ��');  
ylabel('����');  
subplot(4,1,3);plot(n,abs(Y));grid on;  
title('�˲�ǰ�����ź�Ƶ��');  
xlabel('Ƶ��');  
ylabel('����');  
axis([0 1000000 0 8]);  
subplot(4,1,4);plot(n,abs(Y1));grid on;  
title('�˲��������ź�Ƶ��');  
xlabel('Ƶ��');  
ylabel('����');  
axis([0 1000000 0 8]);  
