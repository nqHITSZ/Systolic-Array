function [ X,V_OUT,M_OUT ] = Boundery_Cell( X,X_IN,S)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明

%S==1执行pivoting 否则执行non-pivoting
if(S==1)
    if(abs(X_IN)>=abs(X))
        V_OUT=1;
        if(X_IN~=0)
            M_OUT=-X/X_IN;
        else
            M_OUT=0;
        end
        X=X_IN;
    else        
        V_OUT=0;
        M_OUT=-X_IN/X;
    end
else
    V_OUT=0;
    M_OUT=-X_IN/X;
end
 

end

