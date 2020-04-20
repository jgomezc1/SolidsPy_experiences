// Parameters
H = 100.0;
lado_elem = H/10.0;
// Points
Point(1) = {0.0, 0.0, 0, lado_elem};
Point(2) = {H , 0.0, 0, lado_elem};
Point(3) = {0.0 , H , 0, lado_elem};
// Lines
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 1};
// Surfaces
Line Loop(1) = {1, 2, 3};
Plane Surface(1) = {1};
// Physical groups
Physical Surface(100) = {1}; 

Physical Line(1000) = {3};  // Cara de la presa
Physical Line(2000) = {1};  // Linea inferior


