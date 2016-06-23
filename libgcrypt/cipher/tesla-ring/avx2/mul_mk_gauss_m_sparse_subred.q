reg256 r0
reg256 r1
reg256 r2
reg256 r3

reg256 v0
reg256 v1
reg256 v2
reg256 v3

reg256 c0
reg256 c1
reg256 c2
reg256 c3

reg256 sign

int64 pos
int64 ctri

enter mul_mk_gauss_m_sparse_subred

ctri = 62
ilooptop:

r0 = mem256[input_0 +   0]
r1 = mem256[input_0 +   32]
r2 = mem256[input_0 +   64]
r3 = mem256[input_0 +   96]
pos = *(uint32 *)(input_2 + 0)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  0],mem64[input_3 +  0],mem64[input_3 +  0],mem64[input_3 +  0]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 4)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  8],mem64[input_3 +  8],mem64[input_3 +  8],mem64[input_3 +  8]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 8)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  16],mem64[input_3 +  16],mem64[input_3 +  16],mem64[input_3 +  16]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 12)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  24],mem64[input_3 +  24],mem64[input_3 +  24],mem64[input_3 +  24]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 16)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  32],mem64[input_3 +  32],mem64[input_3 +  32],mem64[input_3 +  32]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 20)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  40],mem64[input_3 +  40],mem64[input_3 +  40],mem64[input_3 +  40]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 24)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  48],mem64[input_3 +  48],mem64[input_3 +  48],mem64[input_3 +  48]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 28)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  56],mem64[input_3 +  56],mem64[input_3 +  56],mem64[input_3 +  56]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 32)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  64],mem64[input_3 +  64],mem64[input_3 +  64],mem64[input_3 +  64]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 36)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  72],mem64[input_3 +  72],mem64[input_3 +  72],mem64[input_3 +  72]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 40)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  80],mem64[input_3 +  80],mem64[input_3 +  80],mem64[input_3 +  80]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 44)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  88],mem64[input_3 +  88],mem64[input_3 +  88],mem64[input_3 +  88]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 48)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  96],mem64[input_3 +  96],mem64[input_3 +  96],mem64[input_3 +  96]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 52)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  104],mem64[input_3 +  104],mem64[input_3 +  104],mem64[input_3 +  104]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 56)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  112],mem64[input_3 +  112],mem64[input_3 +  112],mem64[input_3 +  112]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 60)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  120],mem64[input_3 +  120],mem64[input_3 +  120],mem64[input_3 +  120]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 64)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  128],mem64[input_3 +  128],mem64[input_3 +  128],mem64[input_3 +  128]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 68)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  136],mem64[input_3 +  136],mem64[input_3 +  136],mem64[input_3 +  136]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 72)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  144],mem64[input_3 +  144],mem64[input_3 +  144],mem64[input_3 +  144]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 76)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  152],mem64[input_3 +  152],mem64[input_3 +  152],mem64[input_3 +  152]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 80)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  160],mem64[input_3 +  160],mem64[input_3 +  160],mem64[input_3 +  160]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 84)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  168],mem64[input_3 +  168],mem64[input_3 +  168],mem64[input_3 +  168]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 88)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  176],mem64[input_3 +  176],mem64[input_3 +  176],mem64[input_3 +  176]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 92)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  184],mem64[input_3 +  184],mem64[input_3 +  184],mem64[input_3 +  184]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 96)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  192],mem64[input_3 +  192],mem64[input_3 +  192],mem64[input_3 +  192]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 100)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  200],mem64[input_3 +  200],mem64[input_3 +  200],mem64[input_3 +  200]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 104)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  208],mem64[input_3 +  208],mem64[input_3 +  208],mem64[input_3 +  208]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 108)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  216],mem64[input_3 +  216],mem64[input_3 +  216],mem64[input_3 +  216]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 112)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  224],mem64[input_3 +  224],mem64[input_3 +  224],mem64[input_3 +  224]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 116)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  232],mem64[input_3 +  232],mem64[input_3 +  232],mem64[input_3 +  232]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 120)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  240],mem64[input_3 +  240],mem64[input_3 +  240],mem64[input_3 +  240]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 124)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  248],mem64[input_3 +  248],mem64[input_3 +  248],mem64[input_3 +  248]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 128)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  256],mem64[input_3 +  256],mem64[input_3 +  256],mem64[input_3 +  256]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 132)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  264],mem64[input_3 +  264],mem64[input_3 +  264],mem64[input_3 +  264]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 136)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  272],mem64[input_3 +  272],mem64[input_3 +  272],mem64[input_3 +  272]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 140)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  280],mem64[input_3 +  280],mem64[input_3 +  280],mem64[input_3 +  280]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 144)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  288],mem64[input_3 +  288],mem64[input_3 +  288],mem64[input_3 +  288]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 148)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  296],mem64[input_3 +  296],mem64[input_3 +  296],mem64[input_3 +  296]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 152)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  304],mem64[input_3 +  304],mem64[input_3 +  304],mem64[input_3 +  304]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 156)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  312],mem64[input_3 +  312],mem64[input_3 +  312],mem64[input_3 +  312]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 160)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  320],mem64[input_3 +  320],mem64[input_3 +  320],mem64[input_3 +  320]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 164)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  328],mem64[input_3 +  328],mem64[input_3 +  328],mem64[input_3 +  328]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 168)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  336],mem64[input_3 +  336],mem64[input_3 +  336],mem64[input_3 +  336]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


pos = *(uint32 *)(input_2 + 172)
pos *= 3968
pos += input_1

sign = mem64[input_3 +  344],mem64[input_3 +  344],mem64[input_3 +  344],mem64[input_3 +  344]

v0 = (4x double)(4x int32)mem128[pos +  0]
v1 = (4x double)(4x int32)mem128[pos +  16]
v2 = (4x double)(4x int32)mem128[pos +  32]
v3 = (4x double)(4x int32)mem128[pos +  48]

4x r0 approx -= v0 * sign
4x r1 approx -= v1 * sign
4x r2 approx -= v2 * sign
4x r3 approx -= v3 * sign


4x c0 = approx r0 * mem256[qinv4x]
4x c0 = round(c0)
4x c0 approx*= mem256[q4x]
4x r0 approx -= c0

4x c1 = approx r1 * mem256[qinv4x]
4x c1 = round(c1)
4x c1 approx*= mem256[q4x]
4x r1 approx -= c1

4x c2 = approx r2 * mem256[qinv4x]
4x c2 = round(c2)
4x c2 approx*= mem256[q4x]
4x r2 approx -= c2

4x c3 = approx r3 * mem256[qinv4x]
4x c3 = round(c3)
4x c3 approx*= mem256[q4x]
4x r3 approx -= c3


mem256[input_0 +   0] = r0
mem256[input_0 +   32] = r1
mem256[input_0 +   64] = r2
mem256[input_0 +   96] = r3

input_0 += 128
input_1 += 64

unsigned>? ctri -= 1
goto ilooptop if unsigned>

return
