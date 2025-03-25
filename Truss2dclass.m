a = 1;
P = 1000;

MatsSets(1).E = 70e9;
MatsSets(1).A = pi * 0.015 * 0.015;
MatsSets(1).rho = 8.1;
% rho is  mass density/length and is used by dynamics code

PD.N = 4;
PD.NodePos = [0,   0,   0;
              1.5,   0,   0;
              0,   1,   0;
              1.5,   1,   0];

PD.NE = 5;
PD.ElmConnect = [1, 2;
                 1, 3;
                 3, 4;
                 2, 4;
                 1, 4;
                 2, 3];
                 
             
PD.NM = 1;
PD.MatsSets = MatsSets;
PD.ElmMats = [1;
              1;
              1;
              1;
              1;
              1];
              
          
PD.BCType = [1, 1, 1;
             0, 1, 1;
             0, 0, 1;
             0, 0, 1];
% Note z displacement fixed for all since we're in 2D

PD.BCVal = [0, 0, 0;
            0, 0, 0;
            0, 0, 0;
            P, 0, 0];

PDans = PD_truss_static(PD);
PlotTruss(PDans,1000,'y','y');

disp('1: a')
for i = 0 : 200000
    PD.BCVal = [0, 0, 0; 0, 0, 0; 0, 0, 0; i, 0, 0];
    interVal = PD_truss_static(PD);
        if(max(abs(interVal.ElmStress)) > 270 * 10^6)
            finalVal = p;
            break;
        end
end