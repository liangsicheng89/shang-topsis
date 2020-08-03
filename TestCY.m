clear all
A=xlsread('OriginalData.xlsx');
[score, weight] = shang(A, 0.002, 0.996);
res = TOPSIS(A,weight);