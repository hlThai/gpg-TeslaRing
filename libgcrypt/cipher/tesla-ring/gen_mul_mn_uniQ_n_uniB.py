#!/usr/bin/python

#XXX: EXTRACT THOSE FROM params.h
from params import paramList as pl

n=pl['PARAM_N']
m=pl['PARAM_M']
parallel=pl['PARAM_PARALLEL']
redc=pl['PARAM_RED']

assert(m%(4*parallel) == 0)

for k in range(0,parallel):
    print "reg256 r"+str(k)
print ""
print "reg256 b"
print "reg256 c"
print ""
print "reg256 a"
print "reg256 qinv"
print "reg256 q"
print ""
print "int64 rp"
print "int64 ap"
print "int64 bp"
print ""
print "int64 ictr"
print "int64 jctr"
print "int64 redctr"
print ""
print "enter mul_mn_uniQ_n_uniB"
print ""
print "rp = input_0"
print "ap = input_2"
print ""
print "ictr = "+str(m)
print ""
print "ilooptop:"
print "bp = input_1"
print "redctr = "+str(redc-1)
print ""
print "b  = mem64[bp +  0],mem64[bp +  0],mem64[bp +  0],mem64[bp +  0]"
for k in range(0,parallel):
    print "a = (4x double)(4x int32)mem128[ap +   "+str(16*k)+"]"
    print "4x r"+str(k)+" = approx a * b"
    print ""
print "jctr = "+str(n-1)
print "jlooptop:"
print "bp += 8"
print "ap += "+str(4*m)
print ""
print "b  = mem64[bp +  0],mem64[bp +  0],mem64[bp +  0],mem64[bp +  0]"
for k in range(0,parallel):
    print "a = (4x double)(4x int32)mem128[ap +   "+str(16*k)+"]"
    print "4x r"+str(k)+" approx+= a * b"
    print ""
print ""
print "unsigned>? redctr -= 1"
print "goto noreduce if unsigned>"
print ""
print "qinv = mem256[qinv4x]"
print "q = mem256[q4x]"
print ""
for k in range(0,parallel):
    print "4x c = approx r"+str(k)+" * qinv"
    print "4x c = round(c)"
    print "4x c approx*= q"
    print "4x r"+str(k)+" approx -= c"
    print ""
print ""
print "redctr = "+str(redc)
print ""
print "noreduce:"

print "unsigned>? jctr -= 1"
print "goto jlooptop if unsigned>"
print ""
print "qinv = mem256[qinv4x]"
print "q = mem256[q4x]"
print ""
for k in range(0,parallel):
    print "4x c = approx r"+str(k)+" * qinv"
    print "4x c = round(c)"
    print "4x c approx*= q"
    print "4x r"+str(k)+" approx -= c"
    print ""
for k in range(0,parallel):
    print "mem256[rp +    "+str(32*k)+"] = r"+str(k)
print ""
print "rp+="+str(32*parallel)
print "ap -= "+str((n-1)*4*m-16*parallel)
print ""
print "unsigned>? ictr -= "+str(4*parallel)
print "goto ilooptop if unsigned>"
print ""
print "return"
