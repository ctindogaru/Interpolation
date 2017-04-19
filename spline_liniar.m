function yk = spline_liniar(xk,x,y)

	n = length(x); %lungimea lui x
	
	for i = 1 : n-1 % caut primul x(i) mai mic decat valoarea xk pentru a putea determina punctul yk
		if(xk < x(i+1))
			break;
		end
	end
	%calculez a-ul si b-ul din ecuatia y = a * x + b, si aflu yk prin inlocuirea a-ului, b-ului si xk-ului
	a = (y(i+1) - y(i)) / (x(i+1) - x(i));
	b = y(i) - a * x(i);

	yk = a * xk + b;


endfunction
