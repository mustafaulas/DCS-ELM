RUN
clear all
clc
DATA = 'data.mat';
ilk =0 ;
for i=0:5
    if i==0
        disp('Base ELM')
    elseif i==1 
            disp('Chebyshev map')
    elseif i==2
            disp('Iterative map')
    elseif i==3
            disp('Logistic map')
    elseif i==4
            disp('Piecewise map')
    elseif i==5
            disp('Tent map')
    end 
    [R2,RMSE,MAE]=KFOLDChaostum(i,DATA);
    if ilk==0 
        eniyiR2=R2;
        eniyiRMSE=RMSE;
        ilk=1;
    end
    if eniyiR2< R2
        eniyiR2=R2;
    end
    if eniyiRMSE> RMSE
        eniyiRMSE=RMSE;
    end
    RMSE
    MAE

end 
BESTRMSE = eniyiRMSE
BESTR2 = eniyiR2