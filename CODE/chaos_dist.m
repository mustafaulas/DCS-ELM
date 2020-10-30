function [ChaosVec]=chaos_dist(Numberofline,NumberofCl,chaos_parameter)
% NumberofCl = sutun sayýsý
% Numberofline = satýr sayýsý
% chaos_parameter  = kullanýlacak kaos yontemi
% verilen satýr ve sutun sayýsýna gore chaos ile array oluþturuluyor.
% niye bunu yaptýk? çünkü her yeni satýr vw ya sutun için tekrar chaos vec
% oluþturulduðunda ayný dizin sýrasý ve verileri elde edilir. burada dizi
% tüm sayýlar için tek boyutlu oluþtururulur daha sonra istenilen satýr
% sutuna boýlunur.

% hidden norun sayýsý kadar -1 1 arasý deðer üretilir.

    ChaosVecTemp=chaos(chaos_parameter,Numberofline*NumberofCl,1);

    j=1;
    for i=1:NumberofCl
        ChaosVec(:,i)=ChaosVecTemp(j:j+Numberofline-1);
        j=j+Numberofline;
    end


%     ChaosVec = ChaosVec(randperm(size(ChaosVec, 1)), :);
end