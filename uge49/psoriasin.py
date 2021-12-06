from re import X
from pymol import cmd

cmd.reinitialize
cmd.fetch("1psr")
cmd.hide("everything", "1psr")
cmd.show(representation="cartoon", selection="Chain A+B")
cmd.show(representation="sticks", selection="resi 13")

cmd.iterate_state(0,"1psr","print(x)")