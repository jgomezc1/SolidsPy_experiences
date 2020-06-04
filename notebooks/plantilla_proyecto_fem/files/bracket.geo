/*
Cantilever bracket, lengths in mm.

Taken from:

K. J. Bathe. Finite Element Procedures

Figure 4.20


Author: Nicolás Guarín-Zapata
Date: April 2020
*/

length = 50;
thick = 10;
rad = thick/2;
size = 1;

// Points
Point(1) = {0, 0, 0, size};
Point(2) = {0, -2*thick, 0, size};
Point(3) = {thick/2, -2*thick, 0, size};
Point(4) = {thick, -2*thick, 0, size};
Point(5) = {thick, -thick/2 - rad, 0, size};
Point(6) = {thick + rad, -rad, 0, size};
Point(7) = {thick + rad, -thick, 0, size};
Point(8) = {thick + rad - rad*Cos(Pi/4), -thick + rad*Sin(Pi/4), 0, size};
Point(9) = {thick + rad + length, -thick/2, 0, size};
Point(10) = {thick + rad + length, 0, 0, size};
Point(11) = {thick + rad + length, thick/2, 0, size};
Point(12) = {thick + rad, thick/2, 0, size};
Point(13) = {thick, thick/2 + rad, 0, size};
Point(14) = {thick + rad, thick, 0, size};
Point(15) = {thick + rad - rad*Cos(Pi/4), thick - rad*Sin(Pi/4), 0, size};
Point(16) = {thick, 2*thick, 0, size};
Point(17) = {thick/2, 2*thick, 0, size};
Point(18) = {0, 2*thick, 0, size};
Point(19) = {thick + rad, 0, 0, size};
Point(20) = {thick/2, 0, 0, size};
Point(21) = {thick/2, -thick, 0, size};
Point(22) = {thick/2, thick, 0, size};
Point(23) = {0, -thick/2 - rad, 0, size};
Point(24) = {0, thick/2 + rad, 0, size};

// Lines
Line(1) = {1, 23};
Line(2) = {23, 2};
Line(3) = {2, 3};
Line(4) = {3, 4};
Line(5) = {4, 5};
Line(6) = {6, 9};
Line(7) = {9, 10};
Line(8) = {10, 11};
Line(9) = {11, 12};
Line(10) = {13, 16};
Line(11) = {16, 17};
Line(12) = {17, 18};
Line(13) = {18, 24};
Line(14) = {24, 1};
Line(15) = {1, 20};
Line(16) = {20, 19};
Line(17) = {19, 10};
Line(18) = {21, 20};
Line(19) = {23, 21};
Line(20) = {21, 3};
Line(21) = {21, 5};
Line(22) = {6, 19};
Line(23) = {8, 20};
Line(24) = {20, 15};
Line(25) = {19, 12};
Line(26) = {20, 22};
Line(27) = {22, 24};
Line(28) = {22, 13};
Line(29) = {22, 17};
Circle(30) = {6, 7, 8};
Circle(31) = {8, 7, 5};
Circle(32) = {15, 14, 12};
Circle(33) = {13, 14, 15};

// Surfaces
Curve Loop(1) = {2, 3, -20, -19};
Plane Surface(1) = {1};
Curve Loop(2) = {20, 4, 5, -21};
Plane Surface(2) = {2};
Curve Loop(3) = {1, 19, 18, -15};
Plane Surface(3) = {3};
Curve Loop(4) = {18, -23, 31, -21};
Plane Surface(4) = {-4};
Curve Loop(5) = {30, 23, 16, -22};
Plane Surface(5) = {-5};
Curve Loop(6) = {22, 17, -7, -6};
Plane Surface(6) = {-6};
Curve Loop(7) = {8, 9, -25, 17};
Plane Surface(7) = {7};
Curve Loop(8) = {32, -25, -16, 24};
Plane Surface(8) = {-8};
Curve Loop(9) = {24, -33, -28, -26};
Plane Surface(9) = {9};
Curve Loop(10) = {10, 11, -29, 28};
Plane Surface(10) = {10};
Curve Loop(11) = {12, 13, -27, 29};
Plane Surface(11) = {11};
Curve Loop(12) = {14, 15, 26, 27};
Plane Surface(12) = {12};

// Physical surfaces
Physical Surface(1) = {1, 2, 4, 3, 12, 11, 10, 9, 8, 5, 6, 7}; // Body
Physical Point(2) = {2, 18};
Physical Curve(3) = {9};  // Vertical load
Physical Curve(4) = {32, 33}; // Radial load
Physical Curve(5) = {10};  // Horizontal load

// Mesh parameters
nthick = 8;
nlen = 8;
Transfinite Curve {7, 22, 23, 21, 4, 3, 19, 15, 27, 12, 11, 28, 24, 25, 8} = nthick Using Progression 1;
Transfinite Curve {2, 20, 5, 31, 30, 32, 16, 18, 26, 33, 10, 10, 29, 13, 14, 1} = nlen Using Progression 1;
Transfinite Curve {6, 17, 9} = 4*nlen Using Progression 1;
Transfinite Surface {10};
Transfinite Surface {11};
Transfinite Surface {12};
Transfinite Surface {9};
Transfinite Surface {3};
Transfinite Surface {1};
Transfinite Surface {2};
Transfinite Surface {4};
Transfinite Surface {5};
Transfinite Surface {8};
Transfinite Surface {7};
Transfinite Surface {6};
//Recombine Surface {1, 2, 3, 4, 5, 12, 8, 9, 11, 10, 6, 7};
