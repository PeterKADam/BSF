# This script shows details of the TATA-box binding protein (TBP).
# Written by Ebbe Sloth Andersen, 15/9-2019.

reinit
fetch 1YTB, type=pdb1, async=0
remove solvent
set_view (\
    -0.167697921,    0.946113527,    0.277020037,\
    -0.984660268,   -0.174485460,   -0.000150886,\
     0.048190281,   -0.272798777,    0.960862398,\
     0.000000000,    0.000000000, -194.276046753,\
    21.672107697,   32.899223328,   51.303466797,\
   153.168716431,  235.383377075,  -20.000000000 )
color red, ss h
color yellow, ss s
color green, ss l+''
scene F1, store, TATA-box binding protein (TBP).

sele resi 6+24
util.cbaw sele
show sticks, sele
set_view (\
    -0.098604269,    0.888521194,   -0.448114246,\
     0.476427108,   -0.353197187,   -0.805153489,\
    -0.873667657,   -0.292887449,   -0.388489336,\
    -0.000045349,   -0.000222454,  -53.622795105,\
    22.506681442,   31.772714615,   51.645820618,\
    50.462326050,   56.754898071,  -20.000000000 )
scene F2, store, Zoom to basepair.

hide everything
sele resi 8+9+21+22+99+116
show sticks, sele
dist HB-F5, sele, sele, mode=2
hide labels
util.cbaw sele
set_view (\
     0.202245384,    0.070754223,    0.976773620,\
     0.044775948,    0.995673478,   -0.081394032,\
    -0.978307962,    0.060198210,    0.198203623,\
     0.000056811,   -0.000094240,  -77.163116455,\
    13.241073608,   24.287487030,   48.461109161,\
    36.052890778,  118.267601013,  -20.000000000 )
scene F3, store

set_view (\
     0.412723154,    0.888540387,    0.200372010,\
     0.867185056,   -0.316014946,   -0.384862244,\
    -0.278644472,    0.332603604,   -0.900956810,\
     0.000056811,   -0.000094240,  -77.163116455,\
    13.241073608,   24.287487030,   48.461109161,\
    36.052890778,  118.267601013,  -20.000000000 )
scene F4, store

scene F1