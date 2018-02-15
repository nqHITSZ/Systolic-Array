function [  P,X_OUT,S_OUT,C_OUT ] = Internal_Cell( P,X_IN,S_IN,C_IN,operation)
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明

%operation==1执行pivoting 否则执行non-pivoting
if(operation==1)
    if(S_IN==1)
        X_OUT=P+C_IN*X_IN;
        P=X_IN;
    else
        X_OUT=X_IN+C_IN*P;
    end
else 
        X_OUT=X_IN+C_IN*P;
end

S_OUT=S_IN;
C_OUT=C_IN;

end

