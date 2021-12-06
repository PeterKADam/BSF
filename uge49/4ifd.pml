reinit
fetch 4ifd
sel subs, ///A+B+C+D+E+F+G+H+I+J+K
sel chains, ///A+B+D+E+C+F

scene F1, store
color blue, chains

scene F2, store

sel rna, //L

sel sidechains, (all and not //L) within 6 of //L
show sticks, sidechains
cmd.dist("sele_polar_conts","(/4IFD/L/) and not solvent","(not (/4IFD/L/)) and not solvent",quiet=1,mode=2,label=0,reset=1);cmd.enable("sele_polar_conts")
