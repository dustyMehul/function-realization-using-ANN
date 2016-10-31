close all
plot(0,0)
hold
for i=1:500
plot(sin(0.1*i),Dout(i,2),'r.');
plot(sin(0.1*i),outra(i,2),'k.');
end