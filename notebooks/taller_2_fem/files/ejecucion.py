#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Jan 20 07:28:02 2020

@author: juan
"""

import matplotlib.pyplot as plt  # load matplotlib
from solidspy import solids_GUI  # import our package
disp = solids_GUI(compute_strains=True)  # run the Finite Element Analysis
plt.show()    # plot contours