reinit
fetch 3utu
remove solvent

scene F1, store


util.protein_vacuum_esp("3utu",mode=2,quiet=0,_self=cmd)
scene F2, store

fetch 1xmn
align 1xmn, 3utu
scene F3, store


scene F1, recall