reinitialize
fetch 4PO7, async=0
remove solvent

zoom 4po7
scene F1, store

show surface, 4po7
scene F2, store

show_as sticks, 4po7
scene sticks, store

scene F1, recall

fetch 3f6k, async=0
remove solvent
align 4po7,3f6k

scene F3, store

sel asn129, /4PO7/A/A/ASN`129
sel asn373, /4PO7/A/A/ASN`373
sel asn549, /4PO7/A/A/ASN`549

#Å buffer
zoom asn129, 10 
show sticks, asn129
scene F4, store

zoom asn373, 10 
show sticks, asn373
scene F5, store

zoom asn549, 10 
show sticks, asn549
scene F6, store

zoom /4po7/A/A/ASN

scene F1, recall
