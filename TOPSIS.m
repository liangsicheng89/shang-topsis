%第二部分：TOPSIS综合评价
function [ output_args ] = TOPSIS(A,W)
%A=[];这里输入自己的评价矩阵
%W=[]这里输入上面求得的权重
%A为决策矩阵，W为权值矩阵,M为正指标所在的列，N为负指标所在的列
 [ma,na]=size(A);          %ma为A矩阵的行数，na为A矩阵的列数
 for i=1:na
     B(:,i)=A(:,i)*W(i);     %按列循环得到[加权标准化矩阵]
end
V1=zeros(1,na);            %初始化正理想解和负理想解
V2=zeros(1,na);
BMAX=max(B);               %取加权标准化矩阵每列的最大值和最小值
BMIN=min(B);               %
for i=1:na
     %if i<=size(M,2)        %循环得到理想解和负理想解，注意判断，不然会超个数
     V1(i)=BMAX(i);
     V2(i)=BMIN(i);
     %end
     %if i<=size(N,2)
     %V1(N(i))=BMIN(N(i));
     %V2(N(i))=BMAX(N(i));
     %end
end
for i=1:ma                 %按行循环求各方案的贴近度
     C1=B(i,:)-V1;
     S1(i)=norm(C1);        %S1,S2分别为离正理想点和负理想点的距离，用二阶范数
     C2=B(i,:)-V2;
     S2(i)=norm(C2);
     T(i)=S2(i)/(S1(i)+S2(i));     %T为贴近度
end
output_args=T