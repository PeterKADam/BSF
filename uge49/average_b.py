from pymol import cmd
from pymol import stored


@cmd.extend
def average_b(selection: str):
    stored.natoms, stored.sumofb = 0, 0
    cmd.iterate_state(
        -1, selection, "stored.natoms,stored.sumofb = stored.natoms+1,stored.sumofb+b"
    )
    return print(stored.sumofb / stored.natoms)

