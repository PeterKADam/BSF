reinitialize

bg_color white

 

fetch 1eft, async=0

create eftu, /1eft//A                       

hide everything

 

select nucleotide , /eftu///GNP or /eftu///MG       

select sidechains , byres eftu within 4.0 of nucleotide 

 

show sticks , nucleotide sidechains

color yellow , (nucleotide and name C*)

center nucleotide

 

distance dist1 ,(nucleotide and name O6) , /eftu///174/OG

distance dist2 ,(nucleotide and name N1) , /eftu///139/OD1

distance dist3 ,(nucleotide and name N2) , /eftu///139/OD2

distance dist4 ,(nucleotide and name N7) , /eftu///136/ND2

distance dist5 ,(nucleotide and name O4') , /eftu///137/NZ

 

color blue , dist*

set_view (\
    -0.109455384,    0.982079029,   -0.153432161,\
     0.962231278,    0.065979414,   -0.264118969,\
    -0.249262244,   -0.176546380,   -0.952207744,\
     0.000000000,    0.000000000,  -98.338493347,\
    99.026321411,  -10.912067413,   33.015758514,\
  -139.074127197,  335.751129150,  -20.000000000 )