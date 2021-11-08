reinit
fetch 3utu
remove solvent

scene F1, store


util.protein_vacuum_esp("3utu",mode=2,quiet=0,_self=cmd)
scene F2, store

fetch 1xmn
remove solvent
align 1xmn, 3utu
scene F3, store

disable all
fetch 1tb6
remove solvent
sel thrombin, /1tb6/A+B 
color green, thrombin
sel athrombin, /1tb6/C
color blue, athrombin
scene F4, store

set_view (\
     0.326789349,   -0.423642039,    0.844829202,\
     0.173035413,   -0.851977706,   -0.494155437,\
     0.929120481,    0.307670146,   -0.205112815,\
     0.000000000,    0.000000000, -275.215698242,\
    34.817180634,   11.152428627,   14.839073181,\
   216.982162476,  333.449249268,  -20.000000000 )
scene F5, store

fetch 3sor
remove solvent
align 3sor, 1tb6
zoom 3sor
scene F6, store

scene F1, recall