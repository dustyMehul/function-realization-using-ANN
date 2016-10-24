function TS = generateTS()
y=0;

TS = zeros(10000,3);

x=rand;
plot(0,0);
hold;
for i=1:500
    TS(i,2) = y;
    y = y/(1+y*y) + x*x*x;
    TS(i,1) = x;
    TS(i,3) = y;
    plot(i,y, 'k.');
    x =sin(0.1*i);
end

end