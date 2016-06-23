#!/usr/bin/python
from params import paramList as pl

parallel = pl['PARAM_PARALLEL']/(2**(not(pl['PARAM_PARALLEL']%2)))#4 
#print parallel
param_w = pl['PARAM_W']#20
param_m = pl['PARAM_M']#704
#print parallel
for k in range(0,parallel):
    print "reg256 r"+str(k)
print ""

for k in range(0,parallel):
    print "reg256 v"+str(k)
print ""

for k in range(0,parallel):
    print "reg256 c"+str(k)
print ""

print "reg256 sign"
print ""
print "int64 pos"
print "int64 ctri"
print ""
print "enter mul_mk_gauss_m_sparse_subred"
print ""
print "ctri = "+str(param_m/(4*parallel))
print "ilooptop:"
print ""
for k in range(0,parallel):
    print "r"+str(k)+" = mem256[input_0 +   "+str(32*k)+"]"

for j in range(0,param_w):
    print "pos = *(uint32 *)(input_2 + "+str(4*j)+")"
    print "pos *= "+str(4*param_m)
    print "pos += input_1"
    print ""
    print "sign = mem64[input_3 +  "+str(8*j)+"],mem64[input_3 +  "+str(8*j)+"],mem64[input_3 +  "+str(8*j)+"],mem64[input_3 +  "+str(8*j)+"]"
    print ""
    for k in range(0,parallel):
        print "v"+str(k)+" = (4x double)(4x int32)mem128[pos +  "+str(16*k)+"]"
    print ""
    for k in range(0,parallel):
        print "4x r"+str(k)+" approx -= v"+str(k)+" * sign"
    print ""
    print ""


for k in range(0,parallel):
    print "4x c"+str(k)+" = approx r"+str(k)+" * mem256[qinv4x]"
    print "4x c"+str(k)+" = round(c"+str(k)+")"
    print "4x c"+str(k)+" approx*= mem256[q4x]"
    print "4x r"+str(k)+" approx -= c"+str(k)+""
    print ""
print ""

for k in range(0,parallel):
    print "mem256[input_0 +   "+str(32*k)+"] = r"+str(k)
print ""
print "input_0 += "+str(parallel*32)
print "input_1 += "+str(parallel*16)
print ""
print "unsigned>? ctri -= 1"
print "goto ilooptop if unsigned>"
print ""
print "return"
