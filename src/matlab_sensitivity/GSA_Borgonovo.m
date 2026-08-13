close all;  clear; clc; 

Para1 = [2.15 2.87 3.58 2.15 2.87 3.58 2.15 2.87 3.58 3.32 4.42 5.53 3.32 4.42 5.53 3.32 4.42 5.53]';
Para2 = [10.66 6.29 18.05 9.10 8.63 10.66 7.77 13.87 10.11 10.11 10.66 10.11 9.59 11.24 10.11 10.11 10.11 10.11 6.29 ]';
Para3 = [32.63 27.76 37.51 31.17 30.68 32.63 29.71 35.07 32.15 32.15 32.63 32.15 31.66 33.12 32.15 32.15 32.15 32.15 27.76]';

[log_para_Para2]=lognfit(Para2);
[gam_para_Para3]=gamfit(Para3);
N = 3;
k = 10^3;
RandMat = unifrnd(0,1,k,2*N);       
T(:,1) = unifinv(RandMat(:,1),min(Para1),max(Para1));
T(:,2) = logninv(RandMat(:,2),log_para_Para2(1),log_para_Para2(2));
T(:,3) = gaminv(RandMat(:,3),gam_para_Para3(1),gam_para_Para3(2));
T(:,4) = unifinv(RandMat(:,4),min(Para1),max(Para1));
T(:,5) = logninv(RandMat(:,5),log_para_Para2(1),log_para_Para2(2));
T(:,6) = gaminv(RandMat(:,6),gam_para_Para3(1),gam_para_Para3(2));

A=T(:,1:N);
B=T(:,N+1:2*N);
      
for i =1:N
          
          B_temp = B;      
          B_temp(:,i)=A(:,i);
          C = B_temp;
          
          for j=1:k
                Ya(j,:)=FOSJR(A(j,1),A(j,2),A(j,3));
                Yb(j,:)=FOSJR(B(j,1),B(j,2),B(j,3));
 
                Yc(j,:)=FOSJR(C(j,1),C(j,2),C(j,3));
                
                Yac(j,:) = Ya(j,:)*Yc(j,:);
                Yac_2(j,:) = (Ya(j,:)+Yc(j,:))/2;
                Ya2c2_2(j,:) = ((Ya(j,:))^2+(Yc(j,:)^2))/2;
                
                Ybc(j,:) = Yb(j,:)*Yc(j,:);
                Ybc_2(j,:) = (Yb(j,:)+Yc(j,:))/2;
                Yb2c2_2(j,:) = ((Yb(j,:))^2+(Yc(j,:)^2))/2;
          end
          
          S(i,:) = (((1/k)*sum(Yac))-(((1/k)*sum(Yac_2))^2))/(((1/k)*sum(Ya2c2_2))-(((1/k)*sum(Yac_2))^2));
          ST(i,:) = 1-((((1/k)*sum(Ybc))-(((1/k)*sum(Ybc_2))^2))/(((1/k)*sum(Yb2c2_2))-(((1/k)*sum(Ybc_2))^2)));
end
      
disp([S ST])

function FOS = FOSJR(JRC,JCS,phiR)
H=41; 
oP=27; 
oF=49; 
Y=26; 
Yw=9.81;
Z=13.71; 
Zw=7;
Kh=0.06;
Kv=0.02;
q=0; 

A=(H-Z)*cscd(oP);
B=(H-Z)*cotd(oP)-H*cotd(oF);
W=0.5*Y*(H^2)*((1-(Z/H)^2)*cotd(oP)-cotd(oF));
U1=0.5*Yw*(Zw^2);
U2=0.5*Yw*Zw*(H-Z)*cscd(oP);
sn=((W+q*B)*((1-Kv)*cosd(oP)-Kh*sind(oP))-U1*sind(oP)-U2)/A;
t=((W+q*B)*((1-Kv)*sind(oP)+Kh*cosd(oP))+U1*cosd(oP))/A;

FOS = (sn*tand(phiR+(JRC*log10((JCS*1000)/sn))))/t;
end