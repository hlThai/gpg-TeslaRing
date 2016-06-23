reg256 r0
reg256 r1
reg256 r2
reg256 r3
reg256 r4
reg256 r5
reg256 r6
reg256 r7

reg256 b
reg256 c

reg256 a
reg256 qinv
reg256 q

int64 rp
int64 ap
int64 bp

int64 ictr
int64 jctr
int64 redctr

enter mul_mn_uniQ_n_uniB

rp = input_0
ap = input_2

ictr = 992

ilooptop:
bp = input_1
redctr = 7

b  = mem64[bp +  0],mem64[bp +  0],mem64[bp +  0],mem64[bp +  0]
a = (4x double)(4x int32)mem128[ap +   0]
4x r0 = approx a * b

a = (4x double)(4x int32)mem128[ap +   16]
4x r1 = approx a * b

a = (4x double)(4x int32)mem128[ap +   32]
4x r2 = approx a * b

a = (4x double)(4x int32)mem128[ap +   48]
4x r3 = approx a * b

a = (4x double)(4x int32)mem128[ap +   64]
4x r4 = approx a * b

a = (4x double)(4x int32)mem128[ap +   80]
4x r5 = approx a * b

a = (4x double)(4x int32)mem128[ap +   96]
4x r6 = approx a * b

a = (4x double)(4x int32)mem128[ap +   112]
4x r7 = approx a * b

jctr = 527
jlooptop:
bp += 8
ap += 3968

b  = mem64[bp +  0],mem64[bp +  0],mem64[bp +  0],mem64[bp +  0]
a = (4x double)(4x int32)mem128[ap +   0]
4x r0 approx+= a * b

a = (4x double)(4x int32)mem128[ap +   16]
4x r1 approx+= a * b

a = (4x double)(4x int32)mem128[ap +   32]
4x r2 approx+= a * b

a = (4x double)(4x int32)mem128[ap +   48]
4x r3 approx+= a * b

a = (4x double)(4x int32)mem128[ap +   64]
4x r4 approx+= a * b

a = (4x double)(4x int32)mem128[ap +   80]
4x r5 approx+= a * b

a = (4x double)(4x int32)mem128[ap +   96]
4x r6 approx+= a * b

a = (4x double)(4x int32)mem128[ap +   112]
4x r7 approx+= a * b


unsigned>? redctr -= 1
goto noreduce if unsigned>

qinv = mem256[qinv4x]
q = mem256[q4x]

4x c = approx r0 * qinv
4x c = round(c)
4x c approx*= q
4x r0 approx -= c

4x c = approx r1 * qinv
4x c = round(c)
4x c approx*= q
4x r1 approx -= c

4x c = approx r2 * qinv
4x c = round(c)
4x c approx*= q
4x r2 approx -= c

4x c = approx r3 * qinv
4x c = round(c)
4x c approx*= q
4x r3 approx -= c

4x c = approx r4 * qinv
4x c = round(c)
4x c approx*= q
4x r4 approx -= c

4x c = approx r5 * qinv
4x c = round(c)
4x c approx*= q
4x r5 approx -= c

4x c = approx r6 * qinv
4x c = round(c)
4x c approx*= q
4x r6 approx -= c

4x c = approx r7 * qinv
4x c = round(c)
4x c approx*= q
4x r7 approx -= c


redctr = 8

noreduce:
unsigned>? jctr -= 1
goto jlooptop if unsigned>

qinv = mem256[qinv4x]
q = mem256[q4x]

4x c = approx r0 * qinv
4x c = round(c)
4x c approx*= q
4x r0 approx -= c

4x c = approx r1 * qinv
4x c = round(c)
4x c approx*= q
4x r1 approx -= c

4x c = approx r2 * qinv
4x c = round(c)
4x c approx*= q
4x r2 approx -= c

4x c = approx r3 * qinv
4x c = round(c)
4x c approx*= q
4x r3 approx -= c

4x c = approx r4 * qinv
4x c = round(c)
4x c approx*= q
4x r4 approx -= c

4x c = approx r5 * qinv
4x c = round(c)
4x c approx*= q
4x r5 approx -= c

4x c = approx r6 * qinv
4x c = round(c)
4x c approx*= q
4x r6 approx -= c

4x c = approx r7 * qinv
4x c = round(c)
4x c approx*= q
4x r7 approx -= c

mem256[rp +    0] = r0
mem256[rp +    32] = r1
mem256[rp +    64] = r2
mem256[rp +    96] = r3
mem256[rp +    128] = r4
mem256[rp +    160] = r5
mem256[rp +    192] = r6
mem256[rp +    224] = r7

rp+=256
ap -= 2091008

unsigned>? ictr -= 32
goto ilooptop if unsigned>

return
