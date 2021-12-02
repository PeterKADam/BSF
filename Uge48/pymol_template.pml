#
# PyMOL evaluering - template
#

reinitialize

fetch 2q6h, LeuT1, async=0
fetch 2qju, LeuT2, async=0

hide all

# Spørgsmål 1

show_as cartoon, LeuT1
color lime, LeuT1
set_view (\
     1.000000000,    0.000000000,    0.000000000,\
     0.000000000,    1.000000000,    0.000000000,\
     0.000000000,    0.000000000,    1.000000000,\
     0.000000155,   -0.000000011, -297.114532471,\
    23.781013489,   28.985532761,  -21.719100952,\
   106.745788574,  487.483215332,  -20.000000000 )
scene F1, store

# Spørgsmål 2

sel na, resi 751-752
show_as sphere, na
color violetpurple, na
set_view (\
     1.000000000,    0.000000000,    0.000000000,\
     0.000000000,    1.000000000,    0.000000000,\
     0.000000000,    0.000000000,    1.000000000,\
     0.000000194,    0.000000082, -215.379989624,\
    22.920289993,   28.806680679,  -21.719100952,\
   169.807220459,  260.952758789,  -20.000000000 )
scene F2, store

# Spørgsmål 3
sel s3, (resi 112 + resi 179) and LeuT1
show sticks, s3
color atomic, (s3 and not elem C)
color lime, (s3 and elem C)
set_view (\
    -0.957182169,   -0.051251281,    0.284915984,\
     0.049658019,    0.940548480,    0.336014062,\
    -0.285198331,    0.335774571,   -0.897728741,\
    -0.000054386,    0.000078965,  -75.908599854,\
    34.869632721,   28.044820786,   21.701019287,\
    30.336668015,  121.482200623,  -20.000000000 )
scene F3, store

# Spørgsmål 4
#spørgsmålet giver ikke rigtigt mening, korteste afstand mellem residues eller atomer?
distance s4, /LeuT1/A/A/ASN`179/ND2 , /LeuT1/A/A/GLU`112/OE2
set_view (\
    -0.957182169,   -0.051251281,    0.284915984,\
     0.049658019,    0.940548480,    0.336014062,\
    -0.285198331,    0.335774571,   -0.897728741,\
    -0.000054386,    0.000078965,  -75.908599854,\
    34.869632721,   28.044820786,   21.701019287,\
    30.336668015,  121.482200623,  -20.000000000 )
scene F4, store

# Spørgsmål 5
scene F1, recall
disable s4
sel s5, LeuT1 within 6 of na
show_as sticks, s5 and not na
show sphere, na
color atomic, (s5 and not elem C)
set_view (\
    -0.951514423,   -0.146506459,   -0.270479143,\
    -0.061754026,    0.952375293,   -0.298614055,\
     0.301344663,   -0.267431468,   -0.915243864,\
    -0.000077387,    0.000048410,  -75.909538269,\
    28.326185226,   29.263481140,   19.776992798,\
    66.046150208,   85.772720337,  -20.000000000 )
desel
scene F5, store

# Spørgsmål 6

scene F1, recall
show_as cartoon, LeuT2
align LeuT2, LeuT1
set_view (\
     0.912287176,   -0.276280344,   -0.302325904,\
     0.184818417,    0.936473191,   -0.298094869,\
     0.365477860,    0.216072857,    0.905394197,\
     0.000002757,   -0.000001609, -276.049743652,\
    43.986968994,   32.345504761,   -4.863588333,\
   159.186843872,  392.912506104,  -20.000000000 )
scene F6, store

# Spørgsmål 7

disable LeuT1
spectrum b, blue_white_red, LeuT2

scene F7, store

# Spørgsmål 8
scene F1, recall
enable LeuT2
disable LeuT1
util.protein_vacuum_esp("LeuT2",mode=2,quiet=0,_self=cmd)

scene F8, store

scene F1, recall