%��һ���֣�����ֵ
function [s,w]=shang(x, ymin, ymax)
 %x=[ ];%���������Լ������۾���
 % ����shang.m, ʵ������ֵ�����ָ��(�У���Ȩ�ؼ��������еĵ÷�
% xΪԭʼ���ݾ���
% s���ظ��е÷�, w���ظ���Ȩ��
[n,m]=size(x); % n = 47����, m = 19ָ��
%% ���ݵĹ�һ������
Xnew = zeros(m,n);
Xt = x';
for i = 1:m
   if i == 1 || i == 3 || i == 4 || i == 5 || i == 6
      Xnew(i,:) = (ymax - ymin)*(-1*Xt(i,:)+max(Xt(i,:)))/(max(Xt(i,:)) - min(Xt(i,:))) + ymin;
   else
      Xnew(i,:) = (ymax - ymin)*(Xt(i,:)-min(Xt(i,:)))/(max(Xt(i,:)) - min(Xt(i,:))) + ymin;
   end
end
X=Xnew';  % XΪ��һ���������
 %% �����j��ָ���£���i����¼ռ��ָ��ı���p(i,j)
 for i=1:n
     for j=1:m
         p(i,j)=X(i,j)/sum(X(:,j));
     end
 end
 %�����j��ָ�����ֵe(j)
 k=1/log(n);
 for j=1:m
     e(j)=-k*sum(p(:,j).*log(p(:,j)));
 end
d=ones(1,m)-e;  % ������Ϣ�������
w=d./sum(d);    % ��Ȩֵw
s = p*w';   %�����

