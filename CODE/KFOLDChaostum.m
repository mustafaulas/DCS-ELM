function [R2, RMSE,MAE]=KFOLDChaostum(ChaosType,DATA)

% ChaosType : Type of the Choas map
% data file must be in the same folder and name must be data.mat
 

load(DATA);

veri=data;

boyut =size(veri,1);
boyut2 =size(veri,2);
i=boyut;
kfold=10;
clear dizi
if mod(boyut,kfold)==0 
    aralik = (boyut / kfold ) -1;
    diziAralik = aralik+1;
else
    aralik = floor (boyut/kfold);
    diziAralik=aralik;
end 
dizi=zeros(aralik,kfold);
kalan=mod(boyut,kfold);
T=1;
aralik;
kfold;
for i=1:diziAralik
    for j=1:kfold
        dizi(i,j)=T;
        T=T+1;
    end
end

for i=1:kalan
    dizi(aralik+1,i)= T;
    T=T+1;
end


TEST = 1;

HEDEF = zeros(aralik+1,1);
HESAP = zeros(aralik+1,1);
ilk=0;
for i=1:kfold
    VerilerTrainKF=zeros(2,boyut2);
    VerilerTestKF=zeros(2,boyut2);
    TrainI=1;
    for j=1:aralik+1
        if dizi(j,TEST)~=0
            VerilerTestKF(j,:)= veri(dizi(j,TEST),:);

        end
    end
    for k=1:kfold
        if TEST~=k
            for j=1:aralik+1
                if dizi(j,k)~=0
                    VerilerTrainKF(TrainI,:) = veri(dizi(j,k),:);
                    TrainI=TrainI+1;
                end 
            end
        end
    end
    TEST = TEST + 1;
   
    for j=1:aralik+1
        if dizi(j,k)~=0
            VStest(j,:,i)= VerilerTestKF(j,:);
            VStrain(j,:,i)= VerilerTrainKF(j,:);
        end
    end
            [TrainingTime, TrainingAccuracy] = elm_train_chaos(VerilerTrainKF, 0,  5000, 'hardlim',ChaosType);
            [TestingTime, TestingAccuracy, RMSE, MSE, R2,HEDEFgelen,HESAPgelen,MAE] = elm_predict(VerilerTestKF);

            TrainingAccuracy1 = 1 - TrainingAccuracy;
            TestingAccuracy1 = 1 - TestingAccuracy    ;
            if ilk == 0 
                HEDEF(:,1)=HEDEFgelen(:,1);
                HESAP(:,i)=HESAPgelen(:,1);
                yeniVerilerTest= VerilerTestKF;
                ilk=1;
            else
                HEDEF=[HEDEF; HEDEFgelen];
                HESAP=[HESAP; HESAPgelen];
                yeniVerilerTest= [yeniVerilerTest; VerilerTestKF];

            end  
end

R2=rsquare(HEDEF,HESAP)
save('HEDEFHESAP.mat','HEDEF','HESAP');
save('yeniVerilerTest.mat','yeniVerilerTest');
end
