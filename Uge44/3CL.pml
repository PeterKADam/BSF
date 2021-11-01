reinitialize

fetch 6yb7, type=pdb1, async=0
split_states 6yb7
alter 6yb7_0002, chain='B'
remove 6yb7
remove solvent
remove resn DMS
disable 6yb7_0002


sel D3, resi 199:306
sel D2, resi 99:175
sel D1, resi 1:98
deselect

color americium, D1
color Bismuth, D2
color calcium, D3

set_view (\
    -0.118661709,   -0.428617537,   -0.895660460,\
     0.614072323,    0.677157998,   -0.405412376,\
     0.780275345,   -0.598106802,    0.182847410,\
     0.000000000,    0.000000000, -220.114776611,\
    11.960699081,    0.785278320,    4.805091858,\
   177.228851318,  263.000701904,  -20.000000000 )
scene F1, store

spectrum count, rainbow, 6yb7_0001, byres=1
scene F3, store

sel active_site, resi 166+145+41

show_as sticks, active_site
color atomic, active_site

set_view (\
     0.852409005,   -0.025014825,   -0.522276163,\
     0.215476543,    0.926895559,    0.307273567,\
     0.476420283,   -0.374455512,    0.795487881,\
     0.000000000,    0.000000000,  -70.145690918,\
     9.729798317,   -2.139160395,   19.750440598,\
    38.218898773,  102.072486877,  -20.000000000 )

scene F4, store

dist chain A and resi 145 and elem S, chain A and resi 41 and name NE2

scene F5, store

scene F1, recall

color grey, 6yb7_0002
enable 6yb7_0002

set_view (\
    -0.091443695,   -0.995511651,    0.024446929,\
     0.105342939,   -0.034082163,   -0.993840098,\
     0.990219951,   -0.088308603,    0.107986487,\
     0.000000000,    0.000000000, -268.041564941,\
    11.960699081,    0.785278320,    4.805091858,\
   225.155654907,  310.927551270,  -20.000000000 )

scene F6, store
