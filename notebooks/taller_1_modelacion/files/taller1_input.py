# -*- coding: utf-8 -*-
"""
Template to generate the input files for the FEM code SolidsPy.
The script uses module meshio to read a gmsh mesh and produce
text files nodes.txt, eles.txt , mater.txt and loads.txt

@authors: Juan Gomez
          Nicolas Guarin-Zapata
"""
#from __future__ import division, print_function
import numpy as np
import meshio
import solidspy.preprocesor as msh
#
# Read the mesh file
#
mesh = meshio.read("taller1.msh")

points = mesh.points
cells  = mesh.cells
point_data = mesh.point_data
cell_data  = mesh.cell_data
field_data = mesh.field_data
#
# Forms the nodes_array
#
nodes_array = msh.node_writer(points, point_data)
#
# Forms the elements array
#
nf , els_array = msh.ele_writer(cells, cell_data, "triangle", 100 , 3 , 0 , 0)
#
# Write the results to text files
#
np.savetxt("nodes.txt", nodes_array, fmt=("%d", "%.4f", "%.4f", "%d", "%d"))
np.savetxt("eles.txt" , els_array   , fmt="%d")

