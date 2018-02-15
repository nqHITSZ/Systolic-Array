function [ P,S_OUT,C_OUT ] = Boundery_Cell( P,X_IN,operation)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明

%operation==1执行pivoting 否则执行non-pivoting
if(operation==1)
    if(abs(X_IN)>=abs(P))
        S_OUT=1;
        if(X_IN~=0)
            C_OUT=-P/X_IN;
        else
            C_OUT=0;
        end
        P=X_IN;
    else        
        S_OUT=0;
        C_OUT=-X_IN/P;
    end
else
    S_OUT=0;
    C_OUT=-X_IN/P;
end
 

end

