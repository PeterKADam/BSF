from pymol import cmd

# kaldes i pymol som "find_triads selection" hvor selection er navnet på sin.... selection :)
"""
IFT til MHETase (6QGA):
i pymol:
import scriptet:
File->Run script
................
fetch 6QGA
remove solvent
create subunit, ///F/
hide 6QGA
................
brug musen og marker subunitet med shift,
for ikke at vælge residues som "ikke eksisterer"

kør:
find_triads sele

skal gerne give resultatet:
[['492', '528', '225']]
som er de eneste tre residues som laver et katalytisk site
eller i 1SUB (subtilisin):
[['32', '64', '33'], ['32', '64', '125']]
"""


@cmd.extend
def find_triads(selection: str = "all"):

    # dict med positionen af residues
    vars = {"asp": [], "ser": [], "his": []}
    # for hvert slags residues i dict
    for residues in vars.keys():
        # find residue number: resn x med alpha carbon i selectionen.
        # append dette residue nummer til listen i dict.
        cmd.iterate(
            "{} and name CA and resn {}".format(selection, residues),
            "{}.append(resi)".format(residues),
            space=vars,
        )

    diadelist = []
    # for hvert asp residue
    for each in vars["asp"]:
        # og for hvert his residue
        for every in vars["his"]:
            # find afstanden i Å mellem carboxyl carbon i asp og et af nitrogenerne i his
            dist = cmd.get_distance(
                atom1="({} and resi {} and name CG)".format(selection, each),
                atom2="({} and resi {} and name NE2)".format(selection, every),
                state=1,
            )
            # Hvis dist er under 7 puttes parret i en liste
            if dist < 7:
                diadelist.append([each, every])

    triadelist = []
    # for hvert par i forrige liste
    for each in diadelist:
        # undersøges interaktionen med hvert Ser
        for every in vars["ser"]:
            # afstanden mellem carboxyl CG i asp og antager C-OH i Ser
            asptoser = cmd.get_distance(
                atom1="({} and resi {} and name CG)".format(selection, each[0]),
                atom2="({} and resi {} and name OG)".format(selection, every),
            )
            # FEJL I TIDLIGERE SENDT PROGRAM
            # afstanden mellem NE2 i his og igen C-OH i Ser
            histoser = cmd.get_distance(
                atom1="({} and resi {} and name NE2)".format(selection, each[1]),
                atom2="({} and resi {} and name OG)".format(selection, every),
            )
            # hvis begge disse afstande er under 7, lav en liste med disse par
            if asptoser < 7 and histoser < 7:
                triadelist.append([each[0], each[1], every])
    # returner alle triade-par
    return print(triadelist)
