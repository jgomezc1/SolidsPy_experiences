// Input .geo for rve
// author: Juan Gomez

l = 1.0;
c = l/10; 						// for size elements

// Define vertex points 						
Point(1) = {-l/2   , 0.00 , 0 , c};		        // {x,y,z, size}
Point(2) = {-l/15   , 0.00 , 0 , c};
Point(3) = {+l/15   , 0.00 , 0 , c};
Point(4) = { l/2   , 0.00 , 0 , c};
Point(5) = { l/2   , l , 0 , c};
Point(6) = {-l/2   , l , 0 , c};



// Define boundary lines
Line(1) = {1, 2};					// {Initial_point, end_point}
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 5};
Line(5) = {5, 6};
Line(6) = {6, 1};

// Joint Lines
Line Loop(1) = {1 , 2 , 3 , 4 , 5 , 6};

// surface for mesh 					// {Id_Loop}
Plane Surface(1) = {1};

// Physical surface.
Physical Surface(100) = {1};


//Physical line. Boundary 
Physical Line(100) = {1 , 3};
Physical Line(300) = {2};
Physical Line(200) = {5};