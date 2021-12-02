reinit
fetch 1m6p
remove solvent

scene standard, store

create ChainA, /1m6p/A
create ChainB, /1m6p/B

disable all
enable ChainA
spectrum count, rainbow, ChainA, byres=1

scene F1, store

show_as sticks, ChainB
create m6p, /1m6p/F/B
disable all
enable m6p + ChainB
set_view (\
     0.883746028,    0.347431213,    0.313500971,\
     0.246767268,    0.223223656,   -0.943012893,\
    -0.397612929,    0.910747588,    0.111538962,\
     0.000000000,    0.000000000,  -57.897747040,\
     9.784999847,   20.804000854,   37.428001404,\
    15.954258919,   99.841239929,  -20.000000000 )
scene F2, store

create mnion, /1m6p/E/
disable m6p
set_view (\
     0.883746028,    0.347431213,    0.313500971,\
     0.246767268,    0.223223656,   -0.943012893,\
    -0.397612929,    0.910747588,    0.111538962,\
     0.000000000,    0.000000000,  -57.897747040,\
     9.784999847,   20.804000854,   37.428001404,\
    15.954258919,   99.841239929,  -20.000000000 )
scene F3, store

scene standard, recall