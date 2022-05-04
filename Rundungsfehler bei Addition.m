% Übungsblatt 1 _ Einführung in die Numerik SoSe 2022

function epsilon= aufgabe4
epsilon=zeros(30,3);          % eine leere Matrix herstellen

% Definieren die Funktion der Vorwaerts-Summation

function summe = vorwaerts_summation(n)
i = 1;
summe = 0;

while i<=n
    summe = summe+i^(-2);
    i = i+1;
end
end

% Definieren die Funktion der Rueckwaerts-Summation
function summe = rueckwaerts_summation(n)
i=n;
summe = 0;

while i>0
    summe = summe+i^(-2);
    i=i-1;
end
end

for j=1:30
    epsilon(j,:)=[2^j, vorwaerts_summation(2^j), rueckwaerts_summation(2^j)];
end

figure
loglog(epsilon(:,1),abs(epsilon(:,2)-pi^2/6),'b','LineWidth',2);
hold on
loglog(epsilon(:,1),abs(epsilon(:,3)-pi^2/6),'r','LineWidth',2);
title('Verschiedene Summationsmethode der Reihe \Sigma_{k=1}^n k^{-2}');
legend('vorwaerts-summation','rueckwaerts-summation');
xlabel('n');
ylabel('Abweichung \epsilon_{n}');

end



