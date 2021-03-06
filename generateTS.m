function TS = generateTS()

priv = 0;
TS = zeros(10000,3);

x=0;
% plot(0,0);
% hold;
for i=1:10000
    TS(i,2) = priv;
    y = priv/(1+priv*priv) + x*x*x;
    TS(i,1) = x;
    TS(i,3) = y;
%     plot(i,y, 'k.');
%    x =sin(0.1*i);
    priv = y;
    x = 2*rand-1;
end

% close all;
% plot(1,1)
% hold
% for i=1:1000
% plot(TS(i,1), TS(i,2),'r.');
% plot(TS(i,1), TS(i,3),'k.');
% end
% title('Y vs U');
% legend('Yd', 'Y', 'Location', 'NorthWest');
% 
% xlabel('U');
% ylabel('Y');

end