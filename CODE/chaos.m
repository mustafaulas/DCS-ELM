function O=chaos(index,max_iter,Value)

O=zeros(1,max_iter);
x(1)=0.1;
% x(1)=0.2;
switch index
    case 1
        %Chebyshev map
        for i=1:max_iter
            x(i+1)=cos(i*acos(x(i)));
            G(i)=((x(i)+1)*Value)/2;
        end
    case 2
           %Iterative map
            % a=0.7;
            a=0.9;
            for i=1:max_iter
                x(i+1)=sin((a*pi)/x(i));
                G(i)=((x(i)+1)*Value)/2;
            end

    case 3
            %Logistic map
            % a=4;
            a=4;
            for i=1:max_iter
                x(i+1)=a*x(i)*(1-x(i));
                G(i)=x(i)*Value;
            end
    case 4
            
            %Piecewise map
            P=0.4;
            % P=0.4;
            for i=1:max_iter
                if x(i)>=0 && x(i)<P
                    x(i+1)=x(i)/P;
                end
                if x(i)>=P && x(i)<0.5
                    x(i+1)=(x(i)-P)/(0.5-P);
                end
                if x(i)>=0.5 && x(i)<1-P
                    x(i+1)=(1-P-x(i))/(0.5-P);
                end
                if x(i)>=1-P && x(i)<1
                    x(i+1)=(1-x(i))/P;
                end    
                G(i)=x(i)*Value;
            end

    case 5
            
            %Tent map
            %  x(1)=0.6;
             x(1)=0.6;
             for i=1:max_iter
                 if x(i)<0.7
                     x(i+1)=x(i)/0.7;
                 end
                 if x(i)>=0.7
                     x(i+1)=(10/3)*(1-x(i));
                 end
                 G(i)=(x(i))*Value;
             end

end
O=G;
