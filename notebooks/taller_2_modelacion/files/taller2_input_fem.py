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
def locate_pts_line(physical_line, points , cells , cell_data):
    """
    Find the nodes located on a physical line and their coordinates.

    Parameters
    ----------
    physical_line : int
        Physical line identifier.
    points : array
        Array with the coordinates of the mesh.

    Returns
    -------
    nodes_line : list
        Number identifier for nodes on the physical line.
    line_x : array
        Array with the x coordinates for the nodes locates in the
        physical line.
    line_y : array
        Array with the y coordinates for the nodes locates in the
        physical line.
    """
    lines = cells["line"]
    phy_line = cell_data["line"]["gmsh:physical"]
    id_carga = [cont for cont in range(len(phy_line))
                if phy_line[cont] == physical_line]
    nodes_line = lines[id_carga]
    nodes_line = nodes_line.flatten()
    nodes_line = list(set(nodes_line))
    line_x = points[nodes_line][:, 0]
    line_y = points[nodes_line][:, 1]
    return nodes_line, line_x, line_y
#
def dam_loading(cells, cell_data, phy_lin, nodes , gamma_h , Hdam):
    """
    Impone cargas nodales que varían linealmente con intensidad máxima en la pata
    de la presa consistentes con presión hidriestática.

    Parameters
    ----------
        cells : diccionario
            Diccionario creado por meshio con información de las celdas.
        cell_data: diccionario
            Diccionario creado por meshio con información de campo de las celdas.
        phy_lin : int
            Linea fisica sobre la que se aplicaran las cargas.            
        nodes: int
            Arreglo con la informacion nodal y usado para calcular las cragas.
        gamma_h: float
            Peso especifico del fluido
        Hdam  : float
            Altura de la presa.

    Returns
    -------
        cargas : int
            Arreglo de cargas nodales para SolidsPy.

    """
    lines = cells["line"]
    phy_line = cell_data["line"]["gmsh:physical"]
    id_carga = [cont for cont in range(len(phy_line))
                if phy_line[cont] == phy_lin]
    nodes_carga = lines[id_carga]
    nodes_carga = nodes_carga.flatten()
    nodes_carga = list(set(nodes_carga))
    ncargas = len(nodes_carga)
    nodes_line, line_x, line_y = locate_pts_line(phy_lin, nodes , cells , cell_data)
    cargas = np.zeros((ncargas, 3))
    cargas[:, 0] = nodes_carga
    cargas[:, 1] = gamma_h*(Hdam-line_y)*Hdam/ncargas
    return cargas

#
# Read the mesh file
#
mesh = meshio.read("taller2_fem.msh")

points = mesh.points
cells  = mesh.cells
point_data = mesh.point_data
cell_data  = mesh.cell_data
field_data = mesh.field_data
#
# Forms the nodes_array
#
nodes_array = msh.node_writer(points, point_data)

nodes_array = msh.boundary_conditions(cells, cell_data, 1000, nodes_array, -1, -1)

gamma = 9.8
H_p   = 100.0
#cargas      = msh.loading(cells, cell_data, 2000, 98.0e3, 0.0)
cargas      = dam_loading(cells, cell_data, 2000, points, gamma, H_p)
#
# Forms the elements array
#
nf , els_array = msh.ele_writer(cells, cell_data, "triangle", 100 , 3 , 0 , 0)
#
# Write the results to text files
#
np.savetxt("nodes.txt", nodes_array, fmt=("%d", "%.4f", "%.4f", "%d", "%d"))
np.savetxt("eles.txt" , els_array   , fmt="%d")
np.savetxt("loads.txt", cargas, fmt=("%d", "%.4f", "%.4f"))
#np.savetxt("loads.txt", cargas, fmt=("%d", "%.3g", "%.3g"))

