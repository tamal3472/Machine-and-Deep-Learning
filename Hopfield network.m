data=[[-1., -1., -1,  1, -1., -1];
              [-1., -1., -1., -1., -1.,  1.];
              [-1., -1., -1., -1., -1., -1. ];
              [ 1., -1., -1., -1., -1., -1.];
              [-1., -1., -1., -1., -1., -1.];
              [-1.,  1., -1., -1., -1., -1.];
              [ 1., -1., -1.,  1., -1., -1.];
              [ 1., -1.,  1.,  1.,  1., -1.];
              [-1.,  1., -1., -1., -1.,  1.];
              [ 1., -1., -1.,  1., -1., -1.]];
       
  w=zeros(6,6);
  for i=1:6
      for j=1:6
        w(i,j)=0;
        if(i~=j)
            for k=1:6
                w(i,j)=w(i,j)+data(k,i)*data(k,j);
            end
        end
      end
  end
  t=1000
  mu=[ +1., -1., +1.,  -1., +1., -1.];
  while(t>0)
      
 
  mat=w*mu';
  matt=mat';
 for ii=1:6
     if (matt(ii)>=0.5)
         matt(ii)=1;
     else
         matt(ii)=-1;
     end
  end
  mu=matt
  t=t-1;
  
  end  
  nntool
