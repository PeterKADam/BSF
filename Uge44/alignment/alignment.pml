reinit
fetch 1Q2W
fetch 6yb7, type=pdb1, async=0
fetch 4yo9

remove solvent

disable 1q2w
disable 4yo9

split_states 6yb7
alter 6yb7_0002, chain='B'
delete 6yb7
create 6yb7, (6yb7_0001 or 6yb7_0002)
delete 6yb7_*

scene F1, store

run colCons.py
color_cons('6yb7','Nsp5-align.fasta.txt',1,1,0.5,1.0,'rain','yellow','red','BLOSUM62',True)

zoom 6yb7

scene F2, store

sel AS, resi 145+41+166 and chain A and 6yb7
zoom AS

scene F3, store

scene F1, recall
enable 1q2w
align 6yb7, 1q2w

scene F4, store

scene F1, recall
enable 4YO9
align 6yb7, 4YO9
#dosnt seem to work
scene F5, store

scene F1, recall

select sars1, resi 145+41+166 and 1q2W
select sars2, resi 145+41+166 and chain A and 6YB7
select mers, resi 145+41+169 and chain A and 4yo9

enable all

hide everything
show_as sticks, sars1 + sars2 + mers
