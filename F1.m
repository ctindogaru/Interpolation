function F1

	fid = fopen('dodel.txt', 'r'); %deschid fisierul din care trebuie facuta citirea
	m = fscanf(fid, '%d', 1); %parametrul din linspace
	n = fscanf(fid, '%d', 1); %numarul de linii pe care se afla coordonatele
	fgetl(fid); %golesc bufferul, pentru a termina linia actuala si a trece la urmatoarea
	hold on; %folosesc hold on pentru a nu mi se sterge graficul de fiecare data cand il actualizez cu plot(xi,yi)

	for i = 1 : n %pentru fiecare linie, retin linia si o convertesc la float folosind sscanf
		linie = fgetl(fid);
		A = sscanf(linie, '%f');
		A = A';
		lungime = length(A);
		x = A(1:lungime/2); %x-ul va reprezenta prima jumatate a liniei
		y = A(lungime/2+1 : lungime); %y-ul cea de-a doua

		xi = linspace(x(1), x(lungime/2), m); %generez m diviziuni xi intre x min si x max din vectorul x (s-a presupus ca vectorul este deja ordonat crescator)
		for j = 1 : m
			yi(j) = neville(xi(j), x, y); %pentru fiecare xi calculez yi-ul corespunzator
		end
		plot(xi, yi); %odata aflate coordonatele xi si yi, voi trasa punctul respectiv pe grafic
	end


endfunction
