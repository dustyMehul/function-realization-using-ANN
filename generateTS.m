function TS = generateTS()
y=0;

TS = zeros(1000,2);

x=0;
% plot(0,0);
% hold;
for i=1:1000
    y = y/(1+y*y) + x*x*x;
    TS(i,1) = i;
    TS(i,2) = y;
    %plot(i,y, 'k.');
    x =sin(0.1*i);
end

end