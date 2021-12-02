reinit

fetch 1out, type=pdb1
remove solvent

scene F1, store
split_states 1out
alter 1out_0002 and chain A, chain="C"
alter 1out_0002 and chain B, chain="D"

create biounit, 1out_0001 + 1out_0002

disable all
enable biounit

scene F2, store
