import ase.io
atoms = ase.io.read("PENCEN06.cif")
ase.io.write("geometry.in", atoms, format="aims")
