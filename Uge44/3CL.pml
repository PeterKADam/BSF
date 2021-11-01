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
color bismuth, D2
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

sel active_site_A, resi 166+145+41 and chain A

show_as sticks, active_site_A
color atomic, active_site_A

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
sel active_site_B, resi 166+145+41 and chain B


show_as sticks, active_site_B + active_site_A
color atomic, active_site_B + active_site_A

set_view (\
    -0.586302042,    0.587266922,    0.558001876,\
     0.574497998,    0.787044227,   -0.224691987,\
    -0.571132123,    0.188841671,   -0.798837304,\
     0.000123665,    0.000155739, -268.039855957,\
   -12.330641747,   -7.144522667,   -1.953126073,\
   225.155654907,  310.927551270,  -20.000000000 )

scene F7, store

sel interactions, (resi 172 and chain A) and (resi 1 and chain B)
show_as sticks, interactions

set_view (\
    -0.185820580,   -0.636153400,   -0.748833537,\
     0.974415779,   -0.021374283,   -0.223627999,\
     0.126259893,   -0.771257460,    0.623863041,\
    -0.000272819,    0.000206937,  -34.290950775,\
     6.785839081,    4.673930168,   17.306854248,\
    13.317678452,   55.256000519,  -20.000000000 )
scene F8, store


