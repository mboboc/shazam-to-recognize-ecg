
subplot(3,3,1)
t = -10:0.01:10;
u = cos(100*t + pi/3);
plot(t,u);
title('Subplot 1: Input signal')

%cu cat k-ul este mai mare cu atat exponentiala 
%tinde mai repede catre zero iar functia de
%convolutie se stabilizeaza mai repede

%defazajul creste cu k-ul
%amplitudinea creste cu k-ul
k = 20;
h = exp(-k*t);
subplot(3,3,2)
plot(t,h);
title('Subplot 2: H function with k = 20')
y = conv(u, h, 'same');
subplot(3,3,3)
plot(t,y)
title('Subplot 3: Convolution when k = 20')

subplot(3,3,4)
k = 60;
h = exp(-k*t);
plot(t,h)
title('Subplot 4: H function with k = 60')
subplot(3,3,5)
y = conv(u, h, 'same');
plot(t,y)
title('Subplot 5: Convolution when k = 60')

subplot(3,3,6)
k = 100;
h = exp(-k*t);
plot(t,h)
title('Subplot 6: H function with k = 100')
subplot(3,3,7)
y = conv(u, h, 'same');
plot(t,y)
title('Subplot 7: Convolution when k = 100')

normEnv1 = u / max(u);
normEnv2 = y / max(y);
figure;
plot(t, normEnv1);
hold on
plot(t, normEnv2);

