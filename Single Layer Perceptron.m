data1=randi(2,5)-1;%create random integer in between 0 and 1.
data2=randi(2,5)-1;%create random integer in between 0 and 1.
dataset=zeros(10,5);
%assign created data in the dataset
dataset(1:5,:)=data1(:,:);
dataset(6:10,:)=data2(:,:);
classset(6:10,1)=1;% give class label
[Train, Test] = crossvalind('HoldOut', classset, 0.4);%separatae test and train data
dataset_train = dataset(Train,:);
dataset_tes=dataset(Test,:);
class_train=classset(Train,:);
class_test=classset(Test,:);
[r c]=size(class_train)
weight=[0.1,0.2,0.3,0.4,0.45];%initialize weights
i=1;
j=10;
while i<=r %iterate untill all the weights converges for input pattern
   wx=weight.*dataset_train(i,:);
   ss=sum(wx(:,:));
   if(ss>0.7)
       del=classset(i,1)-1;
       if (del~=0)
           weight=weight+0.2*del*dataset_train(i,:);%Widrow-Hoff rule with 0.2 learning rate 
           i=1;
       else
          i= i+1   ;
       end
   else
       del=classset(i,1)-0;
       if (del~=0)
           weight=weight+0.2*del*dataset_train(i,:);%Widrow-Hoff rule with 0.2 learning rate 
           i=1;
       else
          i= i+1    ;
       end
   end
end
%%test the model
[rr cc]=size(class_test);
count=0;
for i=1:r 
   wx=weight.*dataset_tes(i,:);
   ss=sum(wx(:,:));
   if(ss>0.7)
       out=1;
       if(out==class_test(i,1))
        count=count+1;
       end
   else
       out=0;
       if(out==class_test(i,1))
        count=count+1;
       end  
   end
end
Final_weight_matrix=wx %final weight matrix
accuracy=count/rr % accuracy

