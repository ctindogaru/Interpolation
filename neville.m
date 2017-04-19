function p = neville(x0, x, y)

	n = length(x) - 1;
	p = zeros(n+1, n+1); %matrice patratice de lungimea vectorului y
	for i = 1 : n+1
		p(i,i) = y(i); % diagonala p va reprezenta vectorul y
	end
	%creez matricea superior triunghiulara
	for j = 1 : n+1
		for i = 1 : n+1-j
			p(i, i+j) = ((x(i+j) - x0) * p(i, i+j-1) + (x0-x(i)) * p(i+1, i+j)) / (x(i+j) - x(i));
		end
	end

	p = p(1, n+1); % elementul final va fi primul element al ultimei coloane

endfunction
