function TS = generateOut()
y=0;
priv = 0;
TS = zeros(500,2);

x=0;
% plot(0,0);
% hold;
for i=1:500
    y = priv/(1+priv*priv) + x*x*x;
    TS(i,1) = x;
    TS(i,2) = y;
%     plot(i,y, 'k.');
    x =sin(0.1*i);
    priv = y;
%    x = 2*rand-1;
end


end