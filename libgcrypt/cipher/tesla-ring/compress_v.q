reg256 a0
reg256 c
reg256 q
reg256 qinv

reg256 r

int64 ctri

enter compress_v

ctri = 992

qinv = mem256[qinv4x]
q    = mem256[q4x]

looptop:

a0   = mem256[input_1 +   0]
4x c = approx a0 * qinv
4x c = trunc(c)
4x c approx*= q
4x a0 approx -= c

a0 = (4x int32)(4x double)a0,0,0,0,0
8x a0 = a0 unsigned>> 24

mem128[input_0 + 0] = a0

input_0 += 16
input_1 += 32

unsigned>? ctri -= 4
goto looptop if unsigned>

return
