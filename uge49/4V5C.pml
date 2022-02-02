reinit
fetch 4v5c, type=cif

#unset atom_name_wildcard, 4v5c
create 70S, ///A* + ///B*
disable 4v5c
enable 70S

scene F1, store

sel RNA, ///BA+BB+AA+AY+AV+AW
sel fakeRNA ///AY+AV+AW
show_as ribbon, 70S and not RNA

color blue, ///A*
color red, ///B*
color green, RNA
scene F2, store

hide everything, RNA
scene F3, store

sel paro, resn PAR and 70S
show_as sticks, paro
color atomic, paro and not elem C
zoom paro

scene F4, store
scene F1, recall