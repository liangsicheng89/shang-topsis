%第一部分：求熵值
function [s,w]=shang(x, ymin, ymax)
 %x=[ ];%这里输入自己的评价矩阵
 % 函数shang.m, 实现用熵值法求各指标(列）的权重及各数据行的得分
% x为原始数据矩阵
% s返回各行得分, w返回各列权重
[n,m]=size(x); % n = 47银行, m = 19指标
%% 数据的归一化处理
Xnew = zeros(m,n);
Xt = x';
for i = 1:m
   if i == 1 || i == 3 || i == 4 || i == 5 || i == 6
      Xnew(i,:) = (ymax - ymin)*(-1*Xt(i,:)+max(Xt(i,:)))/(max(Xt(i,:)) - min(Xt(i,:))) + ymin;
   else
      Xnew(i,:) = (ymax - ymin)*(Xt(i,:)-min(Xt(i,:)))/(max(Xt(i,:)) - min(Xt(i,:))) + ymin;
   end
end
X=Xnew';  % X为归一化后的数据
 %% 计算第j个指标下，第i个记录占该指标的比重p(i,j)
 for i=1:n
     for j=1:m
         p(i,j)=X(i,j)/sum(X(:,j));
     end
 end
 %计算第j个指标的熵值e(j)
 k=1/log(n);
 for j=1:m
     e(j)=-k*sum(p(:,j).*log(p(:,j)));
 end
d=ones(1,m)-e;  % 计算信息熵冗余度
w=d./sum(d);    % 求权值w
s = p*w';   %求分数

