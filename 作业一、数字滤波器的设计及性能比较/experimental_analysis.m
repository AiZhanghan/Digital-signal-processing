fs = 1000;

DD1 = equiripple(fs, 110, 190, 40);
DD2 = equiripple(fs, 130, 170, 40);
DD3 = equiripple(fs, 140, 160, 40);

fvtool(DD1);
fvtool(DD2);
fvtool(DD3);

DD4 = equiripple(fs, 130, 170, 20);
DD5 = equiripple(fs, 130, 170, 40);
DD6 = equiripple(fs, 130, 170, 60);

fvtool(DD4);
fvtool(DD5);
fvtool(DD6);