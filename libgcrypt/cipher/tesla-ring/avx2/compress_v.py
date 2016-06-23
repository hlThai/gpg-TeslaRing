#!/usr/bin/python

#XXX: EXTRACT THOSE FROM params.h
from params import paramList as pl

m=pl['PARAM_M']
d=pl['PARAM_D']

print "reg256 a0"
print "reg256 c"
print "reg256 q"
print "reg256 qinv"
print ""
print "reg256 r"
print ""
print "int64 ctri"
print ""
print "enter compress_v"
print ""
print "ctri = "+str(m)
print ""
print "qinv = mem256[qinv4x]"
print "q    = mem256[q4x]"
print ""
print "looptop:"
print ""
print "a0   = mem256[input_1 +   0]"
print "4x c = approx a0 * qinv"
print "4x c = trunc(c)"
print "4x c approx*= q"
print "4x a0 approx -= c"
print ""
print "a0 = (4x int32)(4x double)a0,0,0,0,0"
print "8x a0 = a0 unsigned>> "+str(d)
print ""
print "mem128[input_0 + 0] = a0"
print ""
print "input_0 += 16"
print "input_1 += 32"
print ""
print "unsigned>? ctri -= 4"
print "goto looptop if unsigned>"
print ""
print "return"
