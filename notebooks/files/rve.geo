// Input .geo for rve
// author: Juan Gomez

l = 1.0;
c = l/10; 						// for size elements

// Define vertex points 						
Point(1) = {-l/2   , 0.00 , 0 , c};		        // {x,y,z, size}
Point(2) = { l/2   , 0.00 , 0 , c};
Point(3) = { l/2   , l , 0 , c};
Point(4) = {-l/2   , l , 0 , c};



// Define boundary lines
Line(1) = {1, 2};					// {Initial_point, end_point}
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};

// Joint Lines
Line Loop(1) = {1, 2, 3, 4};

// surface for mesh 					// {Id_Loop}
Plane Surface(1) = {1};

// Physical surface. Two material 
Physical Surface(100) = {1};


//Physical line. Boundary 
Physical Line(100) = {1};
Physical Line(200) = {3};