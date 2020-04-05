// Input .geo for dam analysis
// author: Juan Gomez

H = 100.0;
c = H/5; 						// chracteristic element size


// Define vertex points 						
Point(1) = {0.00 , 0.00 , 0 , c};		        // {x,y,z, size}
Point(2) = { H   , 0.00 , 0 , c};
Point(3) = { 0   , H  , 0 , c};



// Define boundary lines
Line(1) = {1, 2};					// {Initial_point, end_point}
Line(2) = {2, 3};
Line(3) = {3, 1};

// Joint Lines
Line Loop(1) = {1, 2, 3};

// surface for mesh 					// {Id_Loop}

Plane Surface(1) = {1};

// Physical surface. 
Physical Surface(100) = {1};

// Physical line
Physical Line(1000) = {1};
Physical Line(2000) = {3};