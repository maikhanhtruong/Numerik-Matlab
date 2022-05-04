% Übungsblatt 3_ Einführung in die Numerik SoSe 2022

% Definiere das LGS
 A = [1 2 2 1; 1 0 4 5; 8 2 1 1; 1 1 0 0];
 b = [15 33 19 3]';

 X = horzcat(A,b);
 n = size(X);
 
%GausAlgorithmus mit Pivotisierung    
   for i = 1:n(1)-1
      
        for j = i+1:n(1)

            if(X(j,i) ~= 0)
                
                if(X(i,i) == 0)
                    for k = i+1:n(1)

                        if( X(k,i) ~= 0 )
                            
                            tempZeile = X(i,:);
                            X(i,:) = X(k,:);
                            X(k,:) = tempZeile;
                           break;
                        end
                    end
                end
            
                X(j,:) = X(j,:) - X(j,i) / X(i,i) * X(i,:);
            end
        end
   end

  %Rueckwaertseinsetzen um das LGS zu loesen
    
    A2 = X(:, 1:n(2)-1);
    b2 = X(:, n(2));

    n = length(A2);
    X = zeros(n, 1);
    
    for i = n: -1 : 1
        
        if i < n
           b2(i) = b2(i) - sum( A2(i, i+1: n) * X(i+1 : n, 1) ); 
        end
        
        X(i) = b2(i) / A2(i, i);
   
    end
 X

    
       

    
    
 
