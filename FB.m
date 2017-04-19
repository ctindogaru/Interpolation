function FB

	fid = fopen('totti.txt', 'r');
	m = fscanf(fid, '%d', 1);
	n = fscanf(fid, '%d', 1);
	fgetl(fid);
	hold on;

	for i = 1 : n
		linie = fgetl(fid);
		A = sscanf(linie, '%f');
		A = A';
		lungime = length(A);
		x = A(1:lungime/2);
		y = A(lungime/2+1 : lungime);
		xi = linspace(x(1), x(lungime/2), m);
		%spre deosebire de functiile anterior create F1 si F2, aici am trimis ca parametru tot vectorul xi, nu doar un element
		cubic_bonus(xi, x, y);
	end


endfunction
