clear all;
close all;
clc;


%%Training Set
TS = generateTS();



%% Initialization Variables
W1 = rand(15,1);
W2 = rand(15,1);
W3 = rand(15,1);
V = zeros(15,1);
Y = zeros(15,1);
B = rand(15,1);
Bout = rand;
%for i=1:6
 %  W(i) = rand;
%end


n=0.0003;
a=1;

plot(0,0);
hold;

%% learing Process
N=1000; %for 1000 times training the network in an Epoch
Epochs = 100; %foe number of Epochs
for qd = 1:Epochs
    Yout = 0.5;
    ee=0;
for we=1:N
    j = randi(10000);
    %j = we;
    FBinput = TS(j,2);
    %fprintf('-----------------------\n')
    %fprintf('Training epoch %d of %d begins...\n\n',j,N);

        for i=1:15
            V(i,1) = W1(i,1)*TS(j,1)+ W3(i,1)*FBinput + B(i,1);
            Y(i,1) = sgmd(a,V(i,1));
        end
        
        
        Vout = Bout;
        for i=1:15
            Vout = Vout + W2(i,1)*Y(i,1);
        end
        
        Yout = sgmd(a,Vout);
        
        Error = TS(j,3) - Yout;
        
        
        ee = ee + 0.5* Error*Error;
        %updating weights code here
        for i=1:15
        
            W3(i,1) = W3(i,1) + n*W3(i,1)*FBinput*sgmdDash(a,V(i,1))*W2(i,1)*Error*sgmdDash(a,Vout);
        
            W1(i,1) = W1(i,1) + n*W1(i,1)*TS(j,1)*sgmdDash(a,V(i,1))*W2(i,1)*Error*sgmdDash(a,Vout);
            
            B(i,1) = B(i,1) + n*B(i,1)*sgmdDash(a,V(i,1))*W2(i,1)*Error*sgmdDash(a,Vout);
            
            W2(i,1) = W2(i,1) + n*Error*sgmdDash(a,Vout)*W2(i,1)*Y(i,1);
        end
        
        Bout = Bout + n*Error*sgmdDash(a,Vout)*Bout;

        

end

    plot(qd, ee/1000,'k.');
    fprintf('%d of %d done..!!\n', qd, Epochs);
end
W1
W2
W3


yout =0;

outra = zeros(500,2);
Dout = generateOut;
for qw=1:500
    
    x = sin(0.1*qw);
    for i=1:15
            V(i,1) = W1(i,1)*x + W3(i,1)*yout + B(i,1);
            Y(i,1) = sgmd(a,V(i,1));
    end
        
        
     Vout = Bout;
     for i=1:15
        Vout = Vout + W2(i,1)*Y(i,1);
     end
        
     yout = sgmd(a,Vout);
     outra(qw,1) = x;
     outra(qw,2) = yout;
%     plot(qw,yout,'k.');
    
end

