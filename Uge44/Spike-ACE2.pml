# Spike-ACE2 
# by Ebbe Sloth Andersen 31/5-2021

reinit
fetch 6vxx, async=0
fetch 6vsb , async=0
align 6vsb, 6vxx
set_view (\
    -0.943680167,    0.046812125,   -0.327529669,\
    -0.330630779,   -0.170001134,    0.928319812,\
    -0.012226451,    0.984330058,    0.175904989,\
     0.000143678,    0.000455528, -565.865234375,\
   216.740447998,  198.277236938,  199.891937256,\
   443.839630127,  687.539184570,  -20.000000000 )
hide everything, 6vsb
hide everything, resn NAG
scene F1, store
hide everything, 6vxx
show cartoon, 6vsb
scene F2, store
fetch 6m17, async=0
align 6m17 & chain F, 6vsb & chain A
set_view (\
    -0.943680167,    0.046812125,   -0.327529669,\
    -0.330630779,   -0.170001134,    0.928319812,\
    -0.012226451,    0.984330058,    0.175904989,\
    -0.000154376,    0.000198960, -1146.631835938,\
   196.597061157,  176.100280762,  279.889526367,\
  1024.687866211, 1268.387695312,  -20.000000000 )
sele 6m17 & chain F
hide everything, resn NAG
color cyan, sele
scene F3, store
hide everything, 6vsb
zoom sele
scene F4, store
scene F1