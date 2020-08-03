%�ڶ����֣�TOPSIS�ۺ�����
function [ output_args ] = TOPSIS(A,W)
%A=[];���������Լ������۾���
%W=[]��������������õ�Ȩ��
%AΪ���߾���WΪȨֵ����,MΪ��ָ�����ڵ��У�NΪ��ָ�����ڵ���
 [ma,na]=size(A);          %maΪA�����������naΪA���������
 for i=1:na
     B(:,i)=A(:,i)*W(i);     %����ѭ���õ�[��Ȩ��׼������]
end
V1=zeros(1,na);            %��ʼ���������͸������
V2=zeros(1,na);
BMAX=max(B);               %ȡ��Ȩ��׼������ÿ�е����ֵ����Сֵ
BMIN=min(B);               %
for i=1:na
     %if i<=size(M,2)        %ѭ���õ������͸�����⣬ע���жϣ���Ȼ�ᳬ����
     V1(i)=BMAX(i);
     V2(i)=BMIN(i);
     %end
     %if i<=size(N,2)
     %V1(N(i))=BMIN(N(i));
     %V2(N(i))=BMAX(N(i));
     %end
end
for i=1:ma                 %����ѭ�����������������
     C1=B(i,:)-V1;
     S1(i)=norm(C1);        %S1,S2�ֱ�Ϊ���������͸������ľ��룬�ö��׷���
     C2=B(i,:)-V2;
     S2(i)=norm(C2);
     T(i)=S2(i)/(S1(i)+S2(i));     %TΪ������
end
output_args=T