clc
clear all
close all

in=input('enter number of input sample:');
ou=input('enter number of output node:');
x1=randi(2,in)-1;
    

for j1=1:in
    for j2=1:ou
        w1(j1,j2)=rand*(0.6-0.45)+0.45;
    end
end

no=0.8;
N=3;
T=50;
t=1;
while (t<=T)
    n=no*(1-t/T);
    d=round(N*(1-t/T));
    dis=zeros(ou,1);
    
    for j=1:ou
        sum=0;
        for i=1:in
           sum=sum+(x1(i,j)-w1(i,j))*(x1(i,j)-w1(i,j));
        end
        dis(j,1)=sum;
    end
        minj=1;
        min_norm=9999;
        for j1=1:ou
                if dis(j1,1)<min_norm
                    min_norm=dis(j1,1);
                    minj1=j1;
                
                end
        end
        
        if(minj1<=d)
            st=1;
        
        else
            st=minj1-d;
        end
                
        endd=minj1+d;
        if(endd>ou)
            endd=ou;
        end
        for jj=st:endd
            for i=1:in
                w1(i,jj)=w1(i,jj)+no*(x1(i,jj)-w1(i,jj))
            end
        end
          
        t=t+1;
end

