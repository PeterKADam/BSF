from pymol import cmd


@cmd.extend
def all_x(selection: str):
    posname = []
    posx = []
    cmd.iterate_state(
        0,
        selection,
        "posname.append(resi),posx.append(x)",
        space={"posx": posx, "posname": posname},
    )
    for each in range(len(posname)):
        print(posname[each] + ":\t" + str(posx[each]))
    return
