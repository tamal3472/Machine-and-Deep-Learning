clear all;
format compact
dataset_train=[0 0 0;0 1 0;0 1 1;
    1 0 0;1 1 0;1 1 1];
classset=zeros(6,1);
classset(4:6,1)=1;
weight=[0.1,0.2,0.3];
i=1;
j=10;
while i<=6 && j>0
    
   wx=weight.*dataset_train(i,:);
   ss=sum(wx(:,:));
   if(ss>0.5)
       out=1;
       if (classset(i,1)~=out)
           weight=weight-dataset_train(i,:);
           i=1;
       else
          i= i+1   ;
       end
   else
       out=0;
        if (classset(i,1)~=out)
           weight=weight+dataset_train(i,:);
           i=1;
       
       else
          i= i+1    ;
       end
   end
end



dataset_test=[0 1 0; 1 0 1];

for i=1:2
    
   wx=weight.*dataset_test(i,:);
   ss=sum(wx(:,:));
   if(ss>0.5)
       out=1
       
   else
       out=0
       
   end
end
