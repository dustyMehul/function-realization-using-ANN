clear all;
close all;
clc;


%%Training Set
TS = generateTS();



%% Initialization Variables
W1 = 0.5*ones(15,1);
W2 = 0.5*ones(15,1);
W3 = 0.5*ones(15,1);
V = zeros(15,1);
Y = zeros(15,1);
%for i=1:6
 %  W(i) = rand;
%end


n=0.001;
a=1;

plot(0,0);
hold;
Yout = 0;
%% learing Process
N=1000;%for 1000 times training the network

for qd = 1:5000
    
    ee=0;
for j=1:N
    input = Yout;
    %fprintf('-----------------------\n')
    %fprintf('Training epoch %d of %d begins...\n\n',j,N);

        for i=1:15
            V(i,1) = W1(i,1)*TS(j,1)*W3(i,1)*input;
            Y(i,1) = sgmd(a,V(i,1));
        end
        
        
        Vout = 0;
        for i=1:15
            Vout = Vout + W2(i,1)*Y(i,1);
        end
        
        Yout = sgmd(a,Vout);
        
        Error = TS(j,2) - Yout;
        
        
        ee = ee + 0.5* Error*Error;
        %updating weights code here
        for i=1:15
            W2(i,1) = W2(i,1) + n*W2(i,1)*Y(i,1)*Error*sgmdDash(a,Vout);
        end;
        
        for i=1:15
            W3(i,1) = W3(i,1) + n*W3(i,1)*input*sgmdDash(a,V(i,1))*W2(i,1)*Error*sgmdDash(a,Vout);
        end;
        
        for i=1:15
            W1(i,1) = W1(i,1) + n*W1(i,1)*TS(j,1)*sgmdDash(a,V(i,1))*W2(i,1)*Error*sgmdDash(a,Vout);
        end;

        

end

    plot(qd, ee,'k.');
end
W1
W2
W3