function F2
	%are aceeasi structura ca F1, care e explicata deja
	fid = fopen('barcelona.txt', 'r');
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
		for j = 1 : m
			yi(j) = spline_liniar(xi(j), x, y);
		end
		plot(xi, yi);
	end


endfunction
