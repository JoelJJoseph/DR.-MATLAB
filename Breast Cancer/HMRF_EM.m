
function [X Y GMM]=HMRF_EM(X,Y,GMM,k,g,EM_iter,MAP_iter,beta)

sum_U=zeros(1,EM_iter);

for it=1:EM_iter
   
    [X sum_U(it)]=MRF_MAP(X,Y,GMM,k,g,MAP_iter,beta,0);

    
    GMM=get_GMM(X,Y,g);
    
    if it>=3 && std(sum_U(it-2:it))<0.01
        break;
    end
end
Y=getbinary(Y,X);
