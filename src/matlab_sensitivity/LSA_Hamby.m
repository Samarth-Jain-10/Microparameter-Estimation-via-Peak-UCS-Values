clear; clc;
mu=[3.6450 10.1884 31.9674 4.7105 0.0824 0.0550];
std=[1.1193 2.5538 2.1873 3.6014 0.0630 0.0420];

F_Mu_all =FOSJR(mu(1),mu(2),mu(3),mu(4),mu(5),mu(6));

F1_S_3 = FOSJR(mu(1)-3*std(1),mu(2),mu(3),mu(4),mu(5),mu(6));
F1_S_2 = FOSJR(mu(1)-2*std(1),mu(2),mu(3),mu(4),mu(5),mu(6));
F1_S_1 = FOSJR(mu(1)-1*std(1),mu(2),mu(3),mu(4),mu(5),mu(6));
F1_A_1 = FOSJR(mu(1)+1*std(1),mu(2),mu(3),mu(4),mu(5),mu(6));
F1_A_2 = FOSJR(mu(1)+2*std(1),mu(2),mu(3),mu(4),mu(5),mu(6));
F1_A_3 = FOSJR(mu(1)+3*std(1),mu(2),mu(3),mu(4),mu(5),mu(6));

F2_S_3 = FOSJR(mu(1),mu(2)-3*std(2),mu(3),mu(4),mu(5),mu(6));
F2_S_2 = FOSJR(mu(1),mu(2)-2*std(2),mu(3),mu(4),mu(5),mu(6));
F2_S_1 = FOSJR(mu(1),mu(2)-std(2),mu(3),mu(4),mu(5),mu(6));
F2_A_1 = FOSJR(mu(1),mu(2)+std(2),mu(3),mu(4),mu(5),mu(6));
F2_A_2 = FOSJR(mu(1),mu(2)+2*std(2),mu(3),mu(4),mu(5),mu(6));
F2_A_3 = FOSJR(mu(1),mu(2)+3*std(2),mu(3),mu(4),mu(5),mu(6));

F3_S_3 = FOSJR(mu(1),mu(2),mu(3)-3*std(3),mu(4),mu(5),mu(6));
F3_S_2 = FOSJR(mu(1),mu(2),mu(3)-2*std(3),mu(4),mu(5),mu(6));
F3_S_1 = FOSJR(mu(1),mu(2),mu(3)-std(3),mu(4),mu(5),mu(6));
F3_A_1 = FOSJR(mu(1),mu(2),mu(3)+std(3),mu(4),mu(5),mu(6));
F3_A_2 = FOSJR(mu(1),mu(2),mu(3)+2*std(3),mu(4),mu(5),mu(6));
F3_A_3 = FOSJR(mu(1),mu(2),mu(3)+3*std(3),mu(4),mu(5),mu(6));

F4_S_3 = FOSJR(mu(1),mu(2),mu(3),mu(4)-3*std(4),mu(5),mu(6));
F4_S_2 = FOSJR(mu(1),mu(2),mu(3),mu(4)-2*std(4),mu(5),mu(6));
F4_S_1 = FOSJR(mu(1),mu(2),mu(3),mu(4)-std(4),mu(5),mu(6));
F4_A_1 = FOSJR(mu(1),mu(2),mu(3),mu(4)+std(4),mu(5),mu(6));
F4_A_2 = FOSJR(mu(1),mu(2),mu(3),mu(4)+2*std(4),mu(5),mu(6));
F4_A_3 = FOSJR(mu(1),mu(2),mu(3),mu(4)+3*std(4),mu(5),mu(6));

F5_S_3 = FOSJR(mu(1),mu(2),mu(3),mu(4),mu(5)-3*std(5),mu(6));
F5_S_2 = FOSJR(mu(1),mu(2),mu(3),mu(4),mu(5)-2*std(5),mu(6));
F5_S_1 = FOSJR(mu(1),mu(2),mu(3),mu(4),mu(5)-std(5),mu(6));
F5_A_1 = FOSJR(mu(1),mu(2),mu(3),mu(4),mu(5)+std(5),mu(6));
F5_A_2 = FOSJR(mu(1),mu(2),mu(3),mu(4),mu(5)+2*std(5),mu(6));
F5_A_3 = FOSJR(mu(1),mu(2),mu(3),mu(4),mu(5)+3*std(5),mu(6));

F6_S_3 = FOSJR(mu(1),mu(2),mu(3),mu(4),mu(5),mu(6)-3*std(6));
F6_S_2 = FOSJR(mu(1),mu(2),mu(3),mu(4),mu(5),mu(6)-2*std(6));
F6_S_1 = FOSJR(mu(1),mu(2),mu(3),mu(4),mu(5),mu(6)-std(6));
F6_A_1 = FOSJR(mu(1),mu(2),mu(3),mu(4),mu(5),mu(6)+std(6));
F6_A_2 = FOSJR(mu(1),mu(2),mu(3),mu(4),mu(5),mu(6)+2*std(6));
F6_A_3 = FOSJR(mu(1),mu(2),mu(3),mu(4),mu(5),mu(6)+3*std(6));

F1 = [F1_S_3 F1_S_2 F1_S_1 F_Mu_all F1_A_1 F1_A_2 F1_A_3];
F2 = [F2_S_3 F2_S_2 F2_S_1 F_Mu_all F2_A_1 F2_A_2 F2_A_3];
F3 = [F3_S_3 F3_S_2 F3_S_1 F_Mu_all F3_A_1 F3_A_2 F3_A_3];
F4 = [F4_S_3 F4_S_2 F4_S_1 F_Mu_all F4_A_1 F4_A_2 F4_A_3];
F5 = [F5_S_3 F5_S_2 F5_S_1 F_Mu_all F5_A_1 F5_A_2 F5_A_3];
F6 = [F6_S_3 F6_S_2 F6_S_1 F_Mu_all F6_A_1 F6_A_2 F6_A_3];

p = [(abs(max(F1)-min(F1))*100)./max(F1)
    (abs(max(F2)-min(F2))*100)./max(F2) 
    (abs(max(F3)-min(F3))*100)./max(F3)
    (abs(max(F4)-min(F4))*100)./max(F4) 
    (abs(max(F5)-min(F5))*100)./max(F5) 
    (abs(max(F6)-min(F6))*100)./max(F6)];

disp(p)

function FOS = FOSJR(JRC,JCS,phiR,Zw,Kh,Kv)
H=41; oP=27; oF=49; Y=26; Yw=9.81; Z=13.71; q=0; 
A=(H-Z)*cscd(oP);
B=(H-Z)*cotd(oP)-H*cotd(oF);
W=0.5*Y*(H^2)*((1-(Z/H)^2)*cotd(oP)-cotd(oF));
U1=0.5*Yw*(Zw^2);
U2=0.5*Yw*Zw*(H-Z)*cscd(oP);  % csc = cosec%
sn=((W+q*B)*((1-Kv)*cosd(oP)-Kh*sind(oP))-U1*sind(oP)-U2)/A;
t=((W+q*B)*((1-Kv)*sind(oP)+Kh*cosd(oP))+U1*cosd(oP))/A;

FOS = (sn*tand(phiR+(JRC*log10((JCS*1000)/sn))))/t;
end