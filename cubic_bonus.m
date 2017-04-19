function cubic_bonus(xi, x, y)

	%trebuie sa aflu coeficientii a,b,c si d

	n = length(x);
	a = y; %coeficientul a

	%pentru a afla coeficientii b si d este nevoie de c, iar pentru aflarea lui c este nevoie de o matrice A creata cu ajutorul vectorului h, vector ce reprezinta diferenta x(i+1) - x(i)
	%Matricea A va fi o matrice tridiagonala, vectorul h1 va reprezenta subdiagonala, h2 diagonala, h3 deasupra diagonalei

	for i = 1 : n-1
		h(i) = x(i+1) - x(i);
	end

	for i = 1 : n-1
		h1(i) = h(i);
		h3(i) = h(i);
	end


	h2(1) = 2 * h(1);
	h2(n) = 2 * h(n-1);

	for i = 2 : n-1
		h2(i) = 2 * ( h(i-1) + h(i) );
	end

	%acum ca am aflat toti cei 3 vectori hi, voi construi matricea A pentru a rezolva sistemul A * c = b_sistem

	%aici aflu b_sistem (diferit fata de punctul 3, difera primul si ultimul termen)
	%formulele aplicate sunt cele de la curs
	b_sistem(1) = 3/h(1) * (a(2) - a(1)) - 3 * (y(2) - y(1)) / (x(2) - x(1));
	b_sistem(n) = 3 * (y(n) - y(n-1)) / (x(n) - x(n-1)) - 3/h(n-1) * (a(n) - a(n-1));

	for i = 2 : n-1
		b_sistem(i) = 3 * (a(i+1) - a(i)) / h(i) - 3 * (a(i) - a(i-1)) / h(i-1);
	end

	%matricea A e diferita fata de cea de la punctul 3 deoarece h1, h2 si h3 sunt si ei diferiti
	%aici imi construiesc matricea
	A = zeros(n);
	for i = 1 : n
		A(i, i) = h2(i);
		if(i != n)
			A(i, i+1) = h3(i);
		end
		if(i != 1)
			A(i, i-1) = h1(i-1);
		end
	end

	%solutia pentru c
	c = A^-1 * b_sistem';
	c = c';

	% aflu d
	for i = 1 : n-1
		d(i) = (c(i+1) - c(i)) / (3 * h(i));
	end

	% aflu b
	for i = 1:n-1
	 b(i) = (1/h(i))*(a(i+1)-a(i)) - (1/3*h(i))*(2*c(i)+c(i+1));
	end

	lung = length(xi);
	%xi e vectorul creat cu linspace


	% pentru fiecare element din linespace aflu diviziunile intre care se afla in vectorul x, dupa care aplic functia yi(k), unde xi(k) - elementul din linespace, iar x(j) x-ul din stanga diviziunii
	for k = 1 : lung
		for j = 1 : n-1
			if(xi(k) < x(j+1))
				break;
			end
		end
	% => x(j) < xi(k) < x(j+1)

		yi(k) = d(j) * (xi(k) - x(j))^3 + c(j) * (xi(k) - x(j)) ^ 2 + b(j) * (xi(k) - x(j)) + a(j);
		plot(xi(k),yi(k)); %trasez graficul pentru cele 2 puncte calculate si trec la urmatorul
	end

endfunction
