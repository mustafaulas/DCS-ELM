function [ChaosVec]=chaos_dist(Numberofline,NumberofCl,chaos_parameter)
% NumberofCl = sutun say�s�
% Numberofline = sat�r say�s�
% chaos_parameter  = kullan�lacak kaos yontemi
% verilen sat�r ve sutun say�s�na gore chaos ile array olu�turuluyor.
% niye bunu yapt�k? ��nk� her yeni sat�r vw ya sutun i�in tekrar chaos vec
% olu�turuldu�unda ayn� dizin s�ras� ve verileri elde edilir. burada dizi
% t�m say�lar i�in tek boyutlu olu�tururulur daha sonra istenilen sat�r
% sutuna bo�lunur.

% hidden norun say�s� kadar -1 1 aras� de�er �retilir.

    ChaosVecTemp=chaos(chaos_parameter,Numberofline*NumberofCl,1);

    j=1;
    for i=1:NumberofCl
        ChaosVec(:,i)=ChaosVecTemp(j:j+Numberofline-1);
        j=j+Numberofline;
    end


%     ChaosVec = ChaosVec(randperm(size(ChaosVec, 1)), :);
end