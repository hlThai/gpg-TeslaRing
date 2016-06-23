
# qhasm: int64 input_0

# qhasm: int64 input_1

# qhasm: int64 input_2

# qhasm: int64 input_3

# qhasm: int64 input_4

# qhasm: int64 input_5

# qhasm: stack64 input_6

# qhasm: stack64 input_7

# qhasm: int64 caller_r11

# qhasm: int64 caller_r12

# qhasm: int64 caller_r13

# qhasm: int64 caller_r14

# qhasm: int64 caller_r15

# qhasm: int64 caller_rbx

# qhasm: int64 caller_rbp

# qhasm: reg256 r0

# qhasm: reg256 r1

# qhasm: reg256 r2

# qhasm: reg256 r3

# qhasm: reg256 r4

# qhasm: reg256 r5

# qhasm: reg256 r6

# qhasm: reg256 r7

# qhasm: reg256 b

# qhasm: reg256 c

# qhasm: reg256 a

# qhasm: reg256 qinv

# qhasm: reg256 q

# qhasm: int64 rp

# qhasm: int64 ap

# qhasm: int64 bp

# qhasm: int64 ictr

# qhasm: int64 jctr

# qhasm: int64 redctr

# qhasm: enter mul_mn_uniQ_n_uniB
.p2align 5
.global _mul_mn_uniQ_n_uniB
.global mul_mn_uniQ_n_uniB
_mul_mn_uniQ_n_uniB:
mul_mn_uniQ_n_uniB:
mov %rsp,%r11
and $31,%r11
add $0,%r11
sub %r11,%rsp

# qhasm: rp = input_0
# asm 1: mov  <input_0=int64#1,>rp=int64#1
# asm 2: mov  <input_0=%rdi,>rp=%rdi
mov  %rdi,%rdi

# qhasm: ap = input_2
# asm 1: mov  <input_2=int64#3,>ap=int64#3
# asm 2: mov  <input_2=%rdx,>ap=%rdx
mov  %rdx,%rdx

# qhasm: ictr = 992
# asm 1: mov  $992,>ictr=int64#4
# asm 2: mov  $992,>ictr=%rcx
mov  $992,%rcx

# qhasm: ilooptop:
._ilooptop:

# qhasm: bp = input_1
# asm 1: mov  <input_1=int64#2,>bp=int64#5
# asm 2: mov  <input_1=%rsi,>bp=%r8
mov  %rsi,%r8

# qhasm: redctr = 7
# asm 1: mov  $7,>redctr=int64#6
# asm 2: mov  $7,>redctr=%r9
mov  $7,%r9

# qhasm: b  = mem64[bp +  0],mem64[bp +  0],mem64[bp +  0],mem64[bp +  0]
# asm 1: vbroadcastsd 0(<bp=int64#5),>b=reg256#1
# asm 2: vbroadcastsd 0(<bp=%r8),>b=%ymm0
vbroadcastsd 0(%r8),%ymm0

# qhasm: a = (4x double)(4x int32)mem128[ap +   0]
# asm 1: vcvtdq2pd 0(<ap=int64#3),>a=reg256#2
# asm 2: vcvtdq2pd 0(<ap=%rdx),>a=%ymm1
vcvtdq2pd 0(%rdx),%ymm1

# qhasm: 4x r0 = approx a * b
# asm 1: vmulpd <a=reg256#2,<b=reg256#1,>r0=reg256#2
# asm 2: vmulpd <a=%ymm1,<b=%ymm0,>r0=%ymm1
vmulpd %ymm1,%ymm0,%ymm1

# qhasm: a = (4x double)(4x int32)mem128[ap +   16]
# asm 1: vcvtdq2pd 16(<ap=int64#3),>a=reg256#3
# asm 2: vcvtdq2pd 16(<ap=%rdx),>a=%ymm2
vcvtdq2pd 16(%rdx),%ymm2

# qhasm: 4x r1 = approx a * b
# asm 1: vmulpd <a=reg256#3,<b=reg256#1,>r1=reg256#3
# asm 2: vmulpd <a=%ymm2,<b=%ymm0,>r1=%ymm2
vmulpd %ymm2,%ymm0,%ymm2

# qhasm: a = (4x double)(4x int32)mem128[ap +   32]
# asm 1: vcvtdq2pd 32(<ap=int64#3),>a=reg256#4
# asm 2: vcvtdq2pd 32(<ap=%rdx),>a=%ymm3
vcvtdq2pd 32(%rdx),%ymm3

# qhasm: 4x r2 = approx a * b
# asm 1: vmulpd <a=reg256#4,<b=reg256#1,>r2=reg256#4
# asm 2: vmulpd <a=%ymm3,<b=%ymm0,>r2=%ymm3
vmulpd %ymm3,%ymm0,%ymm3

# qhasm: a = (4x double)(4x int32)mem128[ap +   48]
# asm 1: vcvtdq2pd 48(<ap=int64#3),>a=reg256#5
# asm 2: vcvtdq2pd 48(<ap=%rdx),>a=%ymm4
vcvtdq2pd 48(%rdx),%ymm4

# qhasm: 4x r3 = approx a * b
# asm 1: vmulpd <a=reg256#5,<b=reg256#1,>r3=reg256#5
# asm 2: vmulpd <a=%ymm4,<b=%ymm0,>r3=%ymm4
vmulpd %ymm4,%ymm0,%ymm4

# qhasm: a = (4x double)(4x int32)mem128[ap +   64]
# asm 1: vcvtdq2pd 64(<ap=int64#3),>a=reg256#6
# asm 2: vcvtdq2pd 64(<ap=%rdx),>a=%ymm5
vcvtdq2pd 64(%rdx),%ymm5

# qhasm: 4x r4 = approx a * b
# asm 1: vmulpd <a=reg256#6,<b=reg256#1,>r4=reg256#6
# asm 2: vmulpd <a=%ymm5,<b=%ymm0,>r4=%ymm5
vmulpd %ymm5,%ymm0,%ymm5

# qhasm: a = (4x double)(4x int32)mem128[ap +   80]
# asm 1: vcvtdq2pd 80(<ap=int64#3),>a=reg256#7
# asm 2: vcvtdq2pd 80(<ap=%rdx),>a=%ymm6
vcvtdq2pd 80(%rdx),%ymm6

# qhasm: 4x r5 = approx a * b
# asm 1: vmulpd <a=reg256#7,<b=reg256#1,>r5=reg256#7
# asm 2: vmulpd <a=%ymm6,<b=%ymm0,>r5=%ymm6
vmulpd %ymm6,%ymm0,%ymm6

# qhasm: a = (4x double)(4x int32)mem128[ap +   96]
# asm 1: vcvtdq2pd 96(<ap=int64#3),>a=reg256#8
# asm 2: vcvtdq2pd 96(<ap=%rdx),>a=%ymm7
vcvtdq2pd 96(%rdx),%ymm7

# qhasm: 4x r6 = approx a * b
# asm 1: vmulpd <a=reg256#8,<b=reg256#1,>r6=reg256#8
# asm 2: vmulpd <a=%ymm7,<b=%ymm0,>r6=%ymm7
vmulpd %ymm7,%ymm0,%ymm7

# qhasm: a = (4x double)(4x int32)mem128[ap +   112]
# asm 1: vcvtdq2pd 112(<ap=int64#3),>a=reg256#9
# asm 2: vcvtdq2pd 112(<ap=%rdx),>a=%ymm8
vcvtdq2pd 112(%rdx),%ymm8

# qhasm: 4x r7 = approx a * b
# asm 1: vmulpd <a=reg256#9,<b=reg256#1,>r7=reg256#1
# asm 2: vmulpd <a=%ymm8,<b=%ymm0,>r7=%ymm0
vmulpd %ymm8,%ymm0,%ymm0

# qhasm: jctr = 527
# asm 1: mov  $527,>jctr=int64#7
# asm 2: mov  $527,>jctr=%rax
mov  $527,%rax

# qhasm: jlooptop:
._jlooptop:

# qhasm: bp += 8
# asm 1: add  $8,<bp=int64#5
# asm 2: add  $8,<bp=%r8
add  $8,%r8

# qhasm: ap += 3968
# asm 1: add  $3968,<ap=int64#3
# asm 2: add  $3968,<ap=%rdx
add  $3968,%rdx

# qhasm: b  = mem64[bp +  0],mem64[bp +  0],mem64[bp +  0],mem64[bp +  0]
# asm 1: vbroadcastsd 0(<bp=int64#5),>b=reg256#9
# asm 2: vbroadcastsd 0(<bp=%r8),>b=%ymm8
vbroadcastsd 0(%r8),%ymm8

# qhasm: a = (4x double)(4x int32)mem128[ap +   0]
# asm 1: vcvtdq2pd 0(<ap=int64#3),>a=reg256#10
# asm 2: vcvtdq2pd 0(<ap=%rdx),>a=%ymm9
vcvtdq2pd 0(%rdx),%ymm9

# qhasm: 4x r0 approx+= a * b
# asm 1: vfmadd231pd <a=reg256#10,<b=reg256#9,<r0=reg256#2
# asm 2: vfmadd231pd <a=%ymm9,<b=%ymm8,<r0=%ymm1
vfmadd231pd %ymm9,%ymm8,%ymm1

# qhasm: a = (4x double)(4x int32)mem128[ap +   16]
# asm 1: vcvtdq2pd 16(<ap=int64#3),>a=reg256#10
# asm 2: vcvtdq2pd 16(<ap=%rdx),>a=%ymm9
vcvtdq2pd 16(%rdx),%ymm9

# qhasm: 4x r1 approx+= a * b
# asm 1: vfmadd231pd <a=reg256#10,<b=reg256#9,<r1=reg256#3
# asm 2: vfmadd231pd <a=%ymm9,<b=%ymm8,<r1=%ymm2
vfmadd231pd %ymm9,%ymm8,%ymm2

# qhasm: a = (4x double)(4x int32)mem128[ap +   32]
# asm 1: vcvtdq2pd 32(<ap=int64#3),>a=reg256#10
# asm 2: vcvtdq2pd 32(<ap=%rdx),>a=%ymm9
vcvtdq2pd 32(%rdx),%ymm9

# qhasm: 4x r2 approx+= a * b
# asm 1: vfmadd231pd <a=reg256#10,<b=reg256#9,<r2=reg256#4
# asm 2: vfmadd231pd <a=%ymm9,<b=%ymm8,<r2=%ymm3
vfmadd231pd %ymm9,%ymm8,%ymm3

# qhasm: a = (4x double)(4x int32)mem128[ap +   48]
# asm 1: vcvtdq2pd 48(<ap=int64#3),>a=reg256#10
# asm 2: vcvtdq2pd 48(<ap=%rdx),>a=%ymm9
vcvtdq2pd 48(%rdx),%ymm9

# qhasm: 4x r3 approx+= a * b
# asm 1: vfmadd231pd <a=reg256#10,<b=reg256#9,<r3=reg256#5
# asm 2: vfmadd231pd <a=%ymm9,<b=%ymm8,<r3=%ymm4
vfmadd231pd %ymm9,%ymm8,%ymm4

# qhasm: a = (4x double)(4x int32)mem128[ap +   64]
# asm 1: vcvtdq2pd 64(<ap=int64#3),>a=reg256#10
# asm 2: vcvtdq2pd 64(<ap=%rdx),>a=%ymm9
vcvtdq2pd 64(%rdx),%ymm9

# qhasm: 4x r4 approx+= a * b
# asm 1: vfmadd231pd <a=reg256#10,<b=reg256#9,<r4=reg256#6
# asm 2: vfmadd231pd <a=%ymm9,<b=%ymm8,<r4=%ymm5
vfmadd231pd %ymm9,%ymm8,%ymm5

# qhasm: a = (4x double)(4x int32)mem128[ap +   80]
# asm 1: vcvtdq2pd 80(<ap=int64#3),>a=reg256#10
# asm 2: vcvtdq2pd 80(<ap=%rdx),>a=%ymm9
vcvtdq2pd 80(%rdx),%ymm9

# qhasm: 4x r5 approx+= a * b
# asm 1: vfmadd231pd <a=reg256#10,<b=reg256#9,<r5=reg256#7
# asm 2: vfmadd231pd <a=%ymm9,<b=%ymm8,<r5=%ymm6
vfmadd231pd %ymm9,%ymm8,%ymm6

# qhasm: a = (4x double)(4x int32)mem128[ap +   96]
# asm 1: vcvtdq2pd 96(<ap=int64#3),>a=reg256#10
# asm 2: vcvtdq2pd 96(<ap=%rdx),>a=%ymm9
vcvtdq2pd 96(%rdx),%ymm9

# qhasm: 4x r6 approx+= a * b
# asm 1: vfmadd231pd <a=reg256#10,<b=reg256#9,<r6=reg256#8
# asm 2: vfmadd231pd <a=%ymm9,<b=%ymm8,<r6=%ymm7
vfmadd231pd %ymm9,%ymm8,%ymm7

# qhasm: a = (4x double)(4x int32)mem128[ap +   112]
# asm 1: vcvtdq2pd 112(<ap=int64#3),>a=reg256#10
# asm 2: vcvtdq2pd 112(<ap=%rdx),>a=%ymm9
vcvtdq2pd 112(%rdx),%ymm9

# qhasm: 4x r7 approx+= a * b
# asm 1: vfmadd231pd <a=reg256#10,<b=reg256#9,<r7=reg256#1
# asm 2: vfmadd231pd <a=%ymm9,<b=%ymm8,<r7=%ymm0
vfmadd231pd %ymm9,%ymm8,%ymm0

# qhasm: unsigned>? redctr -= 1
# asm 1: sub  $1,<redctr=int64#6
# asm 2: sub  $1,<redctr=%r9
sub  $1,%r9
# comment:fp stack unchanged by jump

# qhasm: goto noreduce if unsigned>
ja ._noreduce

# qhasm: qinv = mem256[qinv4x]
# asm 1: vmovupd qinv4x,>qinv=reg256#9
# asm 2: vmovupd qinv4x,>qinv=%ymm8
vmovupd qinv4x,%ymm8

# qhasm: q = mem256[q4x]
# asm 1: vmovupd q4x,>q=reg256#10
# asm 2: vmovupd q4x,>q=%ymm9
vmovupd q4x,%ymm9

# qhasm: 4x c = approx r0 * qinv
# asm 1: vmulpd <r0=reg256#2,<qinv=reg256#9,>c=reg256#11
# asm 2: vmulpd <r0=%ymm1,<qinv=%ymm8,>c=%ymm10
vmulpd %ymm1,%ymm8,%ymm10

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#11,>c=reg256#11
# asm 2: vroundpd $8,<c=%ymm10,>c=%ymm10
vroundpd $8,%ymm10,%ymm10

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#10,<c=reg256#11,>c=reg256#11
# asm 2: vmulpd <q=%ymm9,<c=%ymm10,>c=%ymm10
vmulpd %ymm9,%ymm10,%ymm10

# qhasm: 4x r0 approx -= c
# asm 1: vsubpd <c=reg256#11,<r0=reg256#2,>r0=reg256#2
# asm 2: vsubpd <c=%ymm10,<r0=%ymm1,>r0=%ymm1
vsubpd %ymm10,%ymm1,%ymm1

# qhasm: 4x c = approx r1 * qinv
# asm 1: vmulpd <r1=reg256#3,<qinv=reg256#9,>c=reg256#11
# asm 2: vmulpd <r1=%ymm2,<qinv=%ymm8,>c=%ymm10
vmulpd %ymm2,%ymm8,%ymm10

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#11,>c=reg256#11
# asm 2: vroundpd $8,<c=%ymm10,>c=%ymm10
vroundpd $8,%ymm10,%ymm10

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#10,<c=reg256#11,>c=reg256#11
# asm 2: vmulpd <q=%ymm9,<c=%ymm10,>c=%ymm10
vmulpd %ymm9,%ymm10,%ymm10

# qhasm: 4x r1 approx -= c
# asm 1: vsubpd <c=reg256#11,<r1=reg256#3,>r1=reg256#3
# asm 2: vsubpd <c=%ymm10,<r1=%ymm2,>r1=%ymm2
vsubpd %ymm10,%ymm2,%ymm2

# qhasm: 4x c = approx r2 * qinv
# asm 1: vmulpd <r2=reg256#4,<qinv=reg256#9,>c=reg256#11
# asm 2: vmulpd <r2=%ymm3,<qinv=%ymm8,>c=%ymm10
vmulpd %ymm3,%ymm8,%ymm10

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#11,>c=reg256#11
# asm 2: vroundpd $8,<c=%ymm10,>c=%ymm10
vroundpd $8,%ymm10,%ymm10

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#10,<c=reg256#11,>c=reg256#11
# asm 2: vmulpd <q=%ymm9,<c=%ymm10,>c=%ymm10
vmulpd %ymm9,%ymm10,%ymm10

# qhasm: 4x r2 approx -= c
# asm 1: vsubpd <c=reg256#11,<r2=reg256#4,>r2=reg256#4
# asm 2: vsubpd <c=%ymm10,<r2=%ymm3,>r2=%ymm3
vsubpd %ymm10,%ymm3,%ymm3

# qhasm: 4x c = approx r3 * qinv
# asm 1: vmulpd <r3=reg256#5,<qinv=reg256#9,>c=reg256#11
# asm 2: vmulpd <r3=%ymm4,<qinv=%ymm8,>c=%ymm10
vmulpd %ymm4,%ymm8,%ymm10

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#11,>c=reg256#11
# asm 2: vroundpd $8,<c=%ymm10,>c=%ymm10
vroundpd $8,%ymm10,%ymm10

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#10,<c=reg256#11,>c=reg256#11
# asm 2: vmulpd <q=%ymm9,<c=%ymm10,>c=%ymm10
vmulpd %ymm9,%ymm10,%ymm10

# qhasm: 4x r3 approx -= c
# asm 1: vsubpd <c=reg256#11,<r3=reg256#5,>r3=reg256#5
# asm 2: vsubpd <c=%ymm10,<r3=%ymm4,>r3=%ymm4
vsubpd %ymm10,%ymm4,%ymm4

# qhasm: 4x c = approx r4 * qinv
# asm 1: vmulpd <r4=reg256#6,<qinv=reg256#9,>c=reg256#11
# asm 2: vmulpd <r4=%ymm5,<qinv=%ymm8,>c=%ymm10
vmulpd %ymm5,%ymm8,%ymm10

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#11,>c=reg256#11
# asm 2: vroundpd $8,<c=%ymm10,>c=%ymm10
vroundpd $8,%ymm10,%ymm10

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#10,<c=reg256#11,>c=reg256#11
# asm 2: vmulpd <q=%ymm9,<c=%ymm10,>c=%ymm10
vmulpd %ymm9,%ymm10,%ymm10

# qhasm: 4x r4 approx -= c
# asm 1: vsubpd <c=reg256#11,<r4=reg256#6,>r4=reg256#6
# asm 2: vsubpd <c=%ymm10,<r4=%ymm5,>r4=%ymm5
vsubpd %ymm10,%ymm5,%ymm5

# qhasm: 4x c = approx r5 * qinv
# asm 1: vmulpd <r5=reg256#7,<qinv=reg256#9,>c=reg256#11
# asm 2: vmulpd <r5=%ymm6,<qinv=%ymm8,>c=%ymm10
vmulpd %ymm6,%ymm8,%ymm10

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#11,>c=reg256#11
# asm 2: vroundpd $8,<c=%ymm10,>c=%ymm10
vroundpd $8,%ymm10,%ymm10

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#10,<c=reg256#11,>c=reg256#11
# asm 2: vmulpd <q=%ymm9,<c=%ymm10,>c=%ymm10
vmulpd %ymm9,%ymm10,%ymm10

# qhasm: 4x r5 approx -= c
# asm 1: vsubpd <c=reg256#11,<r5=reg256#7,>r5=reg256#7
# asm 2: vsubpd <c=%ymm10,<r5=%ymm6,>r5=%ymm6
vsubpd %ymm10,%ymm6,%ymm6

# qhasm: 4x c = approx r6 * qinv
# asm 1: vmulpd <r6=reg256#8,<qinv=reg256#9,>c=reg256#11
# asm 2: vmulpd <r6=%ymm7,<qinv=%ymm8,>c=%ymm10
vmulpd %ymm7,%ymm8,%ymm10

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#11,>c=reg256#11
# asm 2: vroundpd $8,<c=%ymm10,>c=%ymm10
vroundpd $8,%ymm10,%ymm10

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#10,<c=reg256#11,>c=reg256#11
# asm 2: vmulpd <q=%ymm9,<c=%ymm10,>c=%ymm10
vmulpd %ymm9,%ymm10,%ymm10

# qhasm: 4x r6 approx -= c
# asm 1: vsubpd <c=reg256#11,<r6=reg256#8,>r6=reg256#8
# asm 2: vsubpd <c=%ymm10,<r6=%ymm7,>r6=%ymm7
vsubpd %ymm10,%ymm7,%ymm7

# qhasm: 4x c = approx r7 * qinv
# asm 1: vmulpd <r7=reg256#1,<qinv=reg256#9,>c=reg256#9
# asm 2: vmulpd <r7=%ymm0,<qinv=%ymm8,>c=%ymm8
vmulpd %ymm0,%ymm8,%ymm8

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#9,>c=reg256#9
# asm 2: vroundpd $8,<c=%ymm8,>c=%ymm8
vroundpd $8,%ymm8,%ymm8

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#10,<c=reg256#9,>c=reg256#9
# asm 2: vmulpd <q=%ymm9,<c=%ymm8,>c=%ymm8
vmulpd %ymm9,%ymm8,%ymm8

# qhasm: 4x r7 approx -= c
# asm 1: vsubpd <c=reg256#9,<r7=reg256#1,>r7=reg256#1
# asm 2: vsubpd <c=%ymm8,<r7=%ymm0,>r7=%ymm0
vsubpd %ymm8,%ymm0,%ymm0

# qhasm: redctr = 8
# asm 1: mov  $8,>redctr=int64#6
# asm 2: mov  $8,>redctr=%r9
mov  $8,%r9
# comment:fp stack unchanged by fallthrough

# qhasm: noreduce:
._noreduce:

# qhasm: unsigned>? jctr -= 1
# asm 1: sub  $1,<jctr=int64#7
# asm 2: sub  $1,<jctr=%rax
sub  $1,%rax
# comment:fp stack unchanged by jump

# qhasm: goto jlooptop if unsigned>
ja ._jlooptop

# qhasm: qinv = mem256[qinv4x]
# asm 1: vmovupd qinv4x,>qinv=reg256#9
# asm 2: vmovupd qinv4x,>qinv=%ymm8
vmovupd qinv4x,%ymm8

# qhasm: q = mem256[q4x]
# asm 1: vmovupd q4x,>q=reg256#10
# asm 2: vmovupd q4x,>q=%ymm9
vmovupd q4x,%ymm9

# qhasm: 4x c = approx r0 * qinv
# asm 1: vmulpd <r0=reg256#2,<qinv=reg256#9,>c=reg256#11
# asm 2: vmulpd <r0=%ymm1,<qinv=%ymm8,>c=%ymm10
vmulpd %ymm1,%ymm8,%ymm10

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#11,>c=reg256#11
# asm 2: vroundpd $8,<c=%ymm10,>c=%ymm10
vroundpd $8,%ymm10,%ymm10

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#10,<c=reg256#11,>c=reg256#11
# asm 2: vmulpd <q=%ymm9,<c=%ymm10,>c=%ymm10
vmulpd %ymm9,%ymm10,%ymm10

# qhasm: 4x r0 approx -= c
# asm 1: vsubpd <c=reg256#11,<r0=reg256#2,>r0=reg256#2
# asm 2: vsubpd <c=%ymm10,<r0=%ymm1,>r0=%ymm1
vsubpd %ymm10,%ymm1,%ymm1

# qhasm: 4x c = approx r1 * qinv
# asm 1: vmulpd <r1=reg256#3,<qinv=reg256#9,>c=reg256#11
# asm 2: vmulpd <r1=%ymm2,<qinv=%ymm8,>c=%ymm10
vmulpd %ymm2,%ymm8,%ymm10

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#11,>c=reg256#11
# asm 2: vroundpd $8,<c=%ymm10,>c=%ymm10
vroundpd $8,%ymm10,%ymm10

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#10,<c=reg256#11,>c=reg256#11
# asm 2: vmulpd <q=%ymm9,<c=%ymm10,>c=%ymm10
vmulpd %ymm9,%ymm10,%ymm10

# qhasm: 4x r1 approx -= c
# asm 1: vsubpd <c=reg256#11,<r1=reg256#3,>r1=reg256#3
# asm 2: vsubpd <c=%ymm10,<r1=%ymm2,>r1=%ymm2
vsubpd %ymm10,%ymm2,%ymm2

# qhasm: 4x c = approx r2 * qinv
# asm 1: vmulpd <r2=reg256#4,<qinv=reg256#9,>c=reg256#11
# asm 2: vmulpd <r2=%ymm3,<qinv=%ymm8,>c=%ymm10
vmulpd %ymm3,%ymm8,%ymm10

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#11,>c=reg256#11
# asm 2: vroundpd $8,<c=%ymm10,>c=%ymm10
vroundpd $8,%ymm10,%ymm10

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#10,<c=reg256#11,>c=reg256#11
# asm 2: vmulpd <q=%ymm9,<c=%ymm10,>c=%ymm10
vmulpd %ymm9,%ymm10,%ymm10

# qhasm: 4x r2 approx -= c
# asm 1: vsubpd <c=reg256#11,<r2=reg256#4,>r2=reg256#4
# asm 2: vsubpd <c=%ymm10,<r2=%ymm3,>r2=%ymm3
vsubpd %ymm10,%ymm3,%ymm3

# qhasm: 4x c = approx r3 * qinv
# asm 1: vmulpd <r3=reg256#5,<qinv=reg256#9,>c=reg256#11
# asm 2: vmulpd <r3=%ymm4,<qinv=%ymm8,>c=%ymm10
vmulpd %ymm4,%ymm8,%ymm10

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#11,>c=reg256#11
# asm 2: vroundpd $8,<c=%ymm10,>c=%ymm10
vroundpd $8,%ymm10,%ymm10

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#10,<c=reg256#11,>c=reg256#11
# asm 2: vmulpd <q=%ymm9,<c=%ymm10,>c=%ymm10
vmulpd %ymm9,%ymm10,%ymm10

# qhasm: 4x r3 approx -= c
# asm 1: vsubpd <c=reg256#11,<r3=reg256#5,>r3=reg256#5
# asm 2: vsubpd <c=%ymm10,<r3=%ymm4,>r3=%ymm4
vsubpd %ymm10,%ymm4,%ymm4

# qhasm: 4x c = approx r4 * qinv
# asm 1: vmulpd <r4=reg256#6,<qinv=reg256#9,>c=reg256#11
# asm 2: vmulpd <r4=%ymm5,<qinv=%ymm8,>c=%ymm10
vmulpd %ymm5,%ymm8,%ymm10

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#11,>c=reg256#11
# asm 2: vroundpd $8,<c=%ymm10,>c=%ymm10
vroundpd $8,%ymm10,%ymm10

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#10,<c=reg256#11,>c=reg256#11
# asm 2: vmulpd <q=%ymm9,<c=%ymm10,>c=%ymm10
vmulpd %ymm9,%ymm10,%ymm10

# qhasm: 4x r4 approx -= c
# asm 1: vsubpd <c=reg256#11,<r4=reg256#6,>r4=reg256#6
# asm 2: vsubpd <c=%ymm10,<r4=%ymm5,>r4=%ymm5
vsubpd %ymm10,%ymm5,%ymm5

# qhasm: 4x c = approx r5 * qinv
# asm 1: vmulpd <r5=reg256#7,<qinv=reg256#9,>c=reg256#11
# asm 2: vmulpd <r5=%ymm6,<qinv=%ymm8,>c=%ymm10
vmulpd %ymm6,%ymm8,%ymm10

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#11,>c=reg256#11
# asm 2: vroundpd $8,<c=%ymm10,>c=%ymm10
vroundpd $8,%ymm10,%ymm10

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#10,<c=reg256#11,>c=reg256#11
# asm 2: vmulpd <q=%ymm9,<c=%ymm10,>c=%ymm10
vmulpd %ymm9,%ymm10,%ymm10

# qhasm: 4x r5 approx -= c
# asm 1: vsubpd <c=reg256#11,<r5=reg256#7,>r5=reg256#7
# asm 2: vsubpd <c=%ymm10,<r5=%ymm6,>r5=%ymm6
vsubpd %ymm10,%ymm6,%ymm6

# qhasm: 4x c = approx r6 * qinv
# asm 1: vmulpd <r6=reg256#8,<qinv=reg256#9,>c=reg256#11
# asm 2: vmulpd <r6=%ymm7,<qinv=%ymm8,>c=%ymm10
vmulpd %ymm7,%ymm8,%ymm10

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#11,>c=reg256#11
# asm 2: vroundpd $8,<c=%ymm10,>c=%ymm10
vroundpd $8,%ymm10,%ymm10

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#10,<c=reg256#11,>c=reg256#11
# asm 2: vmulpd <q=%ymm9,<c=%ymm10,>c=%ymm10
vmulpd %ymm9,%ymm10,%ymm10

# qhasm: 4x r6 approx -= c
# asm 1: vsubpd <c=reg256#11,<r6=reg256#8,>r6=reg256#8
# asm 2: vsubpd <c=%ymm10,<r6=%ymm7,>r6=%ymm7
vsubpd %ymm10,%ymm7,%ymm7

# qhasm: 4x c = approx r7 * qinv
# asm 1: vmulpd <r7=reg256#1,<qinv=reg256#9,>c=reg256#9
# asm 2: vmulpd <r7=%ymm0,<qinv=%ymm8,>c=%ymm8
vmulpd %ymm0,%ymm8,%ymm8

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#9,>c=reg256#9
# asm 2: vroundpd $8,<c=%ymm8,>c=%ymm8
vroundpd $8,%ymm8,%ymm8

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#10,<c=reg256#9,>c=reg256#9
# asm 2: vmulpd <q=%ymm9,<c=%ymm8,>c=%ymm8
vmulpd %ymm9,%ymm8,%ymm8

# qhasm: 4x r7 approx -= c
# asm 1: vsubpd <c=reg256#9,<r7=reg256#1,>r7=reg256#1
# asm 2: vsubpd <c=%ymm8,<r7=%ymm0,>r7=%ymm0
vsubpd %ymm8,%ymm0,%ymm0

# qhasm: mem256[rp +    0] = r0
# asm 1: vmovupd   <r0=reg256#2,0(<rp=int64#1)
# asm 2: vmovupd   <r0=%ymm1,0(<rp=%rdi)
vmovupd   %ymm1,0(%rdi)

# qhasm: mem256[rp +    32] = r1
# asm 1: vmovupd   <r1=reg256#3,32(<rp=int64#1)
# asm 2: vmovupd   <r1=%ymm2,32(<rp=%rdi)
vmovupd   %ymm2,32(%rdi)

# qhasm: mem256[rp +    64] = r2
# asm 1: vmovupd   <r2=reg256#4,64(<rp=int64#1)
# asm 2: vmovupd   <r2=%ymm3,64(<rp=%rdi)
vmovupd   %ymm3,64(%rdi)

# qhasm: mem256[rp +    96] = r3
# asm 1: vmovupd   <r3=reg256#5,96(<rp=int64#1)
# asm 2: vmovupd   <r3=%ymm4,96(<rp=%rdi)
vmovupd   %ymm4,96(%rdi)

# qhasm: mem256[rp +    128] = r4
# asm 1: vmovupd   <r4=reg256#6,128(<rp=int64#1)
# asm 2: vmovupd   <r4=%ymm5,128(<rp=%rdi)
vmovupd   %ymm5,128(%rdi)

# qhasm: mem256[rp +    160] = r5
# asm 1: vmovupd   <r5=reg256#7,160(<rp=int64#1)
# asm 2: vmovupd   <r5=%ymm6,160(<rp=%rdi)
vmovupd   %ymm6,160(%rdi)

# qhasm: mem256[rp +    192] = r6
# asm 1: vmovupd   <r6=reg256#8,192(<rp=int64#1)
# asm 2: vmovupd   <r6=%ymm7,192(<rp=%rdi)
vmovupd   %ymm7,192(%rdi)

# qhasm: mem256[rp +    224] = r7
# asm 1: vmovupd   <r7=reg256#1,224(<rp=int64#1)
# asm 2: vmovupd   <r7=%ymm0,224(<rp=%rdi)
vmovupd   %ymm0,224(%rdi)

# qhasm: rp+=256
# asm 1: add  $256,<rp=int64#1
# asm 2: add  $256,<rp=%rdi
add  $256,%rdi

# qhasm: ap -= 2091008
# asm 1: sub  $2091008,<ap=int64#3
# asm 2: sub  $2091008,<ap=%rdx
sub  $2091008,%rdx

# qhasm: unsigned>? ictr -= 32
# asm 1: sub  $32,<ictr=int64#4
# asm 2: sub  $32,<ictr=%rcx
sub  $32,%rcx
# comment:fp stack unchanged by jump

# qhasm: goto ilooptop if unsigned>
ja ._ilooptop

# qhasm: return
add %r11,%rsp
ret
