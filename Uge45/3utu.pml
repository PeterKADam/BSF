reinit
fetch 3utu
remove solvent

scene F1, store


util.protein_vacuum_esp("3utu",mode=2,quiet=0,_self=cmd)
scene F2, store

scene F1, recall