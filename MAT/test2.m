clear,clc;
k=2;l=4;%代表脉动阵列处理器是k行n列的
%备忘： M_OUT V_OUT X_OUT X 在电路实现时应视为寄存器
M_OUT = zeros(k,l);
V_OUT = zeros(k,l);
X_OUT = zeros(k,l);
X     = zeros(k,l);
M_IN = zeros(k,l);
V_IN = zeros(k,l);
X_IN = zeros(k,l);


%构造矩阵
A=[4 3; 2 1];
B=eye(k,k);
C=eye(k,k);
D=zeros(k,k);
A=[A,B;-C,D];
A


%将矩阵改为脉动输入形式 注意T矩阵行数
s=length(A);
T=zeros(2*s+10,s);
for i=1:s
    T(i:(i+s-1),i)=A(:,i);
end
A=T


%------------------------------------
for i=1:(5*k-2)

for u=1:l
    X_IN(1,u)=A(i,u);
end
for v=2:k
    for u=v:l
        X_IN(v,u)=X_OUT(v-1,u);
    end
end

for v=1:k
    for u=1:l
        if(u>v)
            V_IN(v,u)=V_OUT(v,u-1);
            M_IN(v,u)=M_OUT(v,u-1);
        end
    end
end

%------------------------------------
%执行计算过程
for m=1:k
    for n=1:l
       s=1;     
       if(i>k)
           if((m+n+k-1)<=i)
               s=0;
           end
       end
       
       if(m==n)
            [ X(m,n),V_OUT(m,n),M_OUT(m,n) ] = Boundery_Cell( X(m,n),X_IN(m,n),s);
       end
       if(n>m)
            [  X(m,n),X_OUT(m,n),V_OUT(m,n),M_OUT(m,n) ] = Internal_Cell( X(m,n),X_IN(m,n),V_IN(m,n),M_IN(m,n),s);
       end
    end
end

disp(['step:',num2str(i)]);
disp(X_OUT);
%M_OUT,V_OUT,A(i+1,:),X_OUT,X
disp(M_OUT);
end
