import glob
import os

sources = glob.glob("src/*.asm")
out_dir =  os.getcwd() + "/bin/"

if not os.path.isdir(out_dir):
    os.mkdir(out_dir)

for src in sources:
    name = os.path.splitext(os.path.basename(src))[0]
    out = out_dir + name
    o = out + ".o"
    asm = "as -o " + o + " " + src
    lnk = "gcc -o " + out + " " + o + " -no-pie"
    print(asm + "\n")
    os.system(asm)
    print(lnk + "\n")
    os.system(lnk)
    os.remove(o)

binaries = glob.glob("bin/*")
for bin in binaries:
    os.system("./" + bin)