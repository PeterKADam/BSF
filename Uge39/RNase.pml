reinit
fetch 1RPG
fetch 2RNS
hide everything

show cartoon, 1RPG
remove solvent
select ligandside, /1RPG/C/A/MPD`127 or /1RPG/B/A/CPA`126/ or /1RPG/A/A/12+41+119
show sticks, ligandside
select substrate, /1RPG/B/A/CPA`126/
create sidechains, /1RPG/A/A/12+41+119
orient 1RPG
scene F1, store

zoom /1RPG/B/A/CPA`126/
scene F2, store

hide everything
show cartoon, 1RPG
select bridges, resn Cys and /1RPG/A/A
show sticks, bridges
orient bridges
show sticks, /1RPG/B/A/CPA`126/
scene F3, store, "This shows disulfide bridges"


select Speptid, /1RPG/A/A/1-20
select Sprotein, /1RPG/A/A/21-124
show sticks, /1RPG/A/A/20
show sticks, /1RPG/B/A/CPA`126/
color brightorange, Speptid
scene F4, store, "This shows S-peptid and S-protein"

hide everything
show cartoon, 1RPG
dist Polarint, Speptid, Sprotein, mode=2
select interactingside, /1RPG/A/A/33+10+44+17+20+101+47+12+49+80+15+18+25+14+13
show sticks, interactingside
util.cnc interactingside
scene F5, store, "This shows distance between polar contacts"


#Opgave 5
hide everything
color carbon, 1RPG
align 2RNS, 1RPG
show_as ribbon, 2RNS + 1RPG
scene F8, store, "Align between RNase S and RNase A"

scene F1



