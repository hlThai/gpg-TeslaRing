reg256 r0
reg256 r1
reg256 r2
reg256 r3
reg256 r4
reg256 r5
reg256 r6
reg256 r7
reg256 r8
reg256 r9
reg256 r10
reg256 r11

reg256 b
reg256 c

reg256 a0
reg256 a1
reg256 a2
reg256 qinv
reg256 q

int64 rp
int64 ap
int64 bp

int64 ictr
int64 jctr
int64 redctr

enter mul_mn_uniQ_n_uniB3x

rp = input_0
ap = input_2

ictr = 992

bp = input_1
redctr = 63

a0 = (4x double)(4x int32)mem128[ap +   0]
a1 = (4x double)(4x int32)mem128[ap +   16]

b  = mem64[bp +  0],mem64[bp +  0],mem64[bp +  0],mem64[bp +  0]
4x r0 = approx b * a0
4x r1 = approx b * a1

b  = mem64[bp +  4224],mem64[bp +  4224],mem64[bp +  4224],mem64[bp +  4224]
4x r3 = approx b * a0
4x r4 = approx b * a1

b  = mem64[bp +  8448],mem64[bp +  8448],mem64[bp +  8448],mem64[bp +  8448]
4x r6 = approx b * a0
4x r7 = approx b * a1

jctr = 527
jflooptop:
bp += 8
ap += 3968

a0 = (4x double)(4x int32)mem128[ap +   0]
a1 = (4x double)(4x int32)mem128[ap +   16]

b  = mem64[bp +  0],mem64[bp +  0],mem64[bp +  0],mem64[bp +  0]
4x r0 approx+=  b * a0
4x r1 approx+=  b * a1

b  = mem64[bp +  4224],mem64[bp +  4224],mem64[bp +  4224],mem64[bp +  4224]
4x r3 approx+=  b * a0
4x r4 approx+=  b * a1

b  = mem64[bp +  8448],mem64[bp +  8448],mem64[bp +  8448],mem64[bp +  8448]
4x r6 approx+=  b * a0
4x r7 approx+=  b * a1

unsigned>? redctr -= 1
goto noreducef if unsigned>

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

4x c = approx r3 * qinv
4x c = round(c)
4x c approx*= q
4x r3 approx -= c

4x c = approx r4 * qinv
4x c = round(c)
4x c approx*= q
4x r4 approx -= c

4x c = approx r6 * qinv
4x c = round(c)
4x c approx*= q
4x r6 approx -= c

4x c = approx r7 * qinv
4x c = round(c)
4x c approx*= q
4x r7 approx -= c

redctr = 64

noreducef:
unsigned>? jctr -= 1
goto jflooptop if unsigned>
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

4x c = approx r3 * qinv
4x c = round(c)
4x c approx*= q
4x r3 approx -= c

4x c = approx r4 * qinv
4x c = round(c)
4x c approx*= q
4x r4 approx -= c

4x c = approx r6 * qinv
4x c = round(c)
4x c approx*= q
4x r6 approx -= c

4x c = approx r7 * qinv
4x c = round(c)
4x c approx*= q
4x r7 approx -= c

mem256[rp +     0] = r0
mem256[rp +    32] = r1
mem256[rp +  7936] = r3
mem256[rp + 7968] = r4
mem256[rp + 15872] = r6
mem256[rp + 15904] = r7

rp+=64
ap -= 2091104
ictr -= 8

ilooptop:
bp = input_1
redctr = 63

a0 = (4x double)(4x int32)mem128[ap +   0]
a1 = (4x double)(4x int32)mem128[ap +   16]
a2 = (4x double)(4x int32)mem128[ap +   32]

b  = mem64[bp +  0],mem64[bp +  0],mem64[bp +  0],mem64[bp +  0]
4x r0 = approx b * a0
4x r1 = approx b * a1
4x r2 = approx b * a2

b  = mem64[bp +  4224],mem64[bp +  4224],mem64[bp +  4224],mem64[bp +  4224]
4x r3 = approx b * a0
4x r4 = approx b * a1
4x r5 = approx b * a2

b  = mem64[bp +  8448],mem64[bp +  8448],mem64[bp +  8448],mem64[bp +  8448]
4x r6 = approx b * a0
4x r7 = approx b * a1
4x r8 = approx b * a2

jctr = 527
jlooptop:
bp += 8
ap += 3968

a0 = (4x double)(4x int32)mem128[ap +   0]
a1 = (4x double)(4x int32)mem128[ap +   16]
a2 = (4x double)(4x int32)mem128[ap +   32]

b  = mem64[bp +  0],mem64[bp +  0],mem64[bp +  0],mem64[bp +  0]
4x r0 approx+=  b * a0
4x r1 approx+=  b * a1
4x r2 approx+=  b * a2

b  = mem64[bp +  4224],mem64[bp +  4224],mem64[bp +  4224],mem64[bp +  4224]
4x r3 approx+=  b * a0
4x r4 approx+=  b * a1
4x r5 approx+=  b * a2

b  = mem64[bp +  8448],mem64[bp +  8448],mem64[bp +  8448],mem64[bp +  8448]
4x r6 approx+=  b * a0
4x r7 approx+=  b * a1
4x r8 approx+=  b * a2

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

4x c = approx r8 * qinv
4x c = round(c)
4x c approx*= q
4x r8 approx -= c

redctr = 64

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

4x c = approx r8 * qinv
4x c = round(c)
4x c approx*= q
4x r8 approx -= c

mem256[rp +     0] = r0
mem256[rp +    32] = r1
mem256[rp +    64] = r2
mem256[rp +  7936] = r3
mem256[rp + 7968] = r4
mem256[rp + 8000] = r5
mem256[rp + 15872] = r6
mem256[rp + 15904] = r7
mem256[rp + 15936] = r8

rp+=96
ap -= 2091088

unsigned>? ictr -= 12
goto ilooptop if unsigned>

return
