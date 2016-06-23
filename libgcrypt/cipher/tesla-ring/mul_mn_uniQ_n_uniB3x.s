
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

# qhasm: reg256 r8

# qhasm: reg256 r9

# qhasm: reg256 r10

# qhasm: reg256 r11

# qhasm: reg256 b

# qhasm: reg256 c

# qhasm: reg256 a0

# qhasm: reg256 a1

# qhasm: reg256 a2

# qhasm: reg256 qinv

# qhasm: reg256 q

# qhasm: int64 rp

# qhasm: int64 ap

# qhasm: int64 bp

# qhasm: int64 ictr

# qhasm: int64 jctr

# qhasm: int64 redctr

# qhasm: enter mul_mn_uniQ_n_uniB3x
.p2align 5
.global _mul_mn_uniQ_n_uniB3x
.global mul_mn_uniQ_n_uniB3x
_mul_mn_uniQ_n_uniB3x:
mul_mn_uniQ_n_uniB3x:
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

# qhasm: bp = input_1
# asm 1: mov  <input_1=int64#2,>bp=int64#5
# asm 2: mov  <input_1=%rsi,>bp=%r8
mov  %rsi,%r8

# qhasm: redctr = 63
# asm 1: mov  $63,>redctr=int64#6
# asm 2: mov  $63,>redctr=%r9
mov  $63,%r9

# qhasm: a0 = (4x double)(4x int32)mem128[ap +   0]
# asm 1: vcvtdq2pd 0(<ap=int64#3),>a0=reg256#1
# asm 2: vcvtdq2pd 0(<ap=%rdx),>a0=%ymm0
vcvtdq2pd 0(%rdx),%ymm0

# qhasm: a1 = (4x double)(4x int32)mem128[ap +   16]
# asm 1: vcvtdq2pd 16(<ap=int64#3),>a1=reg256#2
# asm 2: vcvtdq2pd 16(<ap=%rdx),>a1=%ymm1
vcvtdq2pd 16(%rdx),%ymm1

# qhasm: b  = mem64[bp +  0],mem64[bp +  0],mem64[bp +  0],mem64[bp +  0]
# asm 1: vbroadcastsd 0(<bp=int64#5),>b=reg256#3
# asm 2: vbroadcastsd 0(<bp=%r8),>b=%ymm2
vbroadcastsd 0(%r8),%ymm2

# qhasm: 4x r0 = approx b * a0
# asm 1: vmulpd <b=reg256#3,<a0=reg256#1,>r0=reg256#4
# asm 2: vmulpd <b=%ymm2,<a0=%ymm0,>r0=%ymm3
vmulpd %ymm2,%ymm0,%ymm3

# qhasm: 4x r1 = approx b * a1
# asm 1: vmulpd <b=reg256#3,<a1=reg256#2,>r1=reg256#3
# asm 2: vmulpd <b=%ymm2,<a1=%ymm1,>r1=%ymm2
vmulpd %ymm2,%ymm1,%ymm2

# qhasm: b  = mem64[bp +  4224],mem64[bp +  4224],mem64[bp +  4224],mem64[bp +  4224]
# asm 1: vbroadcastsd 4224(<bp=int64#5),>b=reg256#5
# asm 2: vbroadcastsd 4224(<bp=%r8),>b=%ymm4
vbroadcastsd 4224(%r8),%ymm4

# qhasm: 4x r3 = approx b * a0
# asm 1: vmulpd <b=reg256#5,<a0=reg256#1,>r3=reg256#6
# asm 2: vmulpd <b=%ymm4,<a0=%ymm0,>r3=%ymm5
vmulpd %ymm4,%ymm0,%ymm5

# qhasm: 4x r4 = approx b * a1
# asm 1: vmulpd <b=reg256#5,<a1=reg256#2,>r4=reg256#5
# asm 2: vmulpd <b=%ymm4,<a1=%ymm1,>r4=%ymm4
vmulpd %ymm4,%ymm1,%ymm4

# qhasm: b  = mem64[bp +  8448],mem64[bp +  8448],mem64[bp +  8448],mem64[bp +  8448]
# asm 1: vbroadcastsd 8448(<bp=int64#5),>b=reg256#7
# asm 2: vbroadcastsd 8448(<bp=%r8),>b=%ymm6
vbroadcastsd 8448(%r8),%ymm6

# qhasm: 4x r6 = approx b * a0
# asm 1: vmulpd <b=reg256#7,<a0=reg256#1,>r6=reg256#1
# asm 2: vmulpd <b=%ymm6,<a0=%ymm0,>r6=%ymm0
vmulpd %ymm6,%ymm0,%ymm0

# qhasm: 4x r7 = approx b * a1
# asm 1: vmulpd <b=reg256#7,<a1=reg256#2,>r7=reg256#2
# asm 2: vmulpd <b=%ymm6,<a1=%ymm1,>r7=%ymm1
vmulpd %ymm6,%ymm1,%ymm1

# qhasm: jctr = 527
# asm 1: mov  $527,>jctr=int64#7
# asm 2: mov  $527,>jctr=%rax
mov  $527,%rax

# qhasm: jflooptop:
._jflooptop:

# qhasm: bp += 8
# asm 1: add  $8,<bp=int64#5
# asm 2: add  $8,<bp=%r8
add  $8,%r8

# qhasm: ap += 3968
# asm 1: add  $3968,<ap=int64#3
# asm 2: add  $3968,<ap=%rdx
add  $3968,%rdx

# qhasm: a0 = (4x double)(4x int32)mem128[ap +   0]
# asm 1: vcvtdq2pd 0(<ap=int64#3),>a0=reg256#7
# asm 2: vcvtdq2pd 0(<ap=%rdx),>a0=%ymm6
vcvtdq2pd 0(%rdx),%ymm6

# qhasm: a1 = (4x double)(4x int32)mem128[ap +   16]
# asm 1: vcvtdq2pd 16(<ap=int64#3),>a1=reg256#8
# asm 2: vcvtdq2pd 16(<ap=%rdx),>a1=%ymm7
vcvtdq2pd 16(%rdx),%ymm7

# qhasm: b  = mem64[bp +  0],mem64[bp +  0],mem64[bp +  0],mem64[bp +  0]
# asm 1: vbroadcastsd 0(<bp=int64#5),>b=reg256#9
# asm 2: vbroadcastsd 0(<bp=%r8),>b=%ymm8
vbroadcastsd 0(%r8),%ymm8

# qhasm: 4x r0 approx+=  b * a0
# asm 1: vfmadd231pd <b=reg256#9,<a0=reg256#7,<r0=reg256#4
# asm 2: vfmadd231pd <b=%ymm8,<a0=%ymm6,<r0=%ymm3
vfmadd231pd %ymm8,%ymm6,%ymm3

# qhasm: 4x r1 approx+=  b * a1
# asm 1: vfmadd231pd <b=reg256#9,<a1=reg256#8,<r1=reg256#3
# asm 2: vfmadd231pd <b=%ymm8,<a1=%ymm7,<r1=%ymm2
vfmadd231pd %ymm8,%ymm7,%ymm2

# qhasm: b  = mem64[bp +  4224],mem64[bp +  4224],mem64[bp +  4224],mem64[bp +  4224]
# asm 1: vbroadcastsd 4224(<bp=int64#5),>b=reg256#9
# asm 2: vbroadcastsd 4224(<bp=%r8),>b=%ymm8
vbroadcastsd 4224(%r8),%ymm8

# qhasm: 4x r3 approx+=  b * a0
# asm 1: vfmadd231pd <b=reg256#9,<a0=reg256#7,<r3=reg256#6
# asm 2: vfmadd231pd <b=%ymm8,<a0=%ymm6,<r3=%ymm5
vfmadd231pd %ymm8,%ymm6,%ymm5

# qhasm: 4x r4 approx+=  b * a1
# asm 1: vfmadd231pd <b=reg256#9,<a1=reg256#8,<r4=reg256#5
# asm 2: vfmadd231pd <b=%ymm8,<a1=%ymm7,<r4=%ymm4
vfmadd231pd %ymm8,%ymm7,%ymm4

# qhasm: b  = mem64[bp +  8448],mem64[bp +  8448],mem64[bp +  8448],mem64[bp +  8448]
# asm 1: vbroadcastsd 8448(<bp=int64#5),>b=reg256#9
# asm 2: vbroadcastsd 8448(<bp=%r8),>b=%ymm8
vbroadcastsd 8448(%r8),%ymm8

# qhasm: 4x r6 approx+=  b * a0
# asm 1: vfmadd231pd <b=reg256#9,<a0=reg256#7,<r6=reg256#1
# asm 2: vfmadd231pd <b=%ymm8,<a0=%ymm6,<r6=%ymm0
vfmadd231pd %ymm8,%ymm6,%ymm0

# qhasm: 4x r7 approx+=  b * a1
# asm 1: vfmadd231pd <b=reg256#9,<a1=reg256#8,<r7=reg256#2
# asm 2: vfmadd231pd <b=%ymm8,<a1=%ymm7,<r7=%ymm1
vfmadd231pd %ymm8,%ymm7,%ymm1

# qhasm: unsigned>? redctr -= 1
# asm 1: sub  $1,<redctr=int64#6
# asm 2: sub  $1,<redctr=%r9
sub  $1,%r9
# comment:fp stack unchanged by jump

# qhasm: goto noreducef if unsigned>
ja ._noreducef

# qhasm: qinv = mem256[qinv4x]
# asm 1: vmovupd qinv4x,>qinv=reg256#7
# asm 2: vmovupd qinv4x,>qinv=%ymm6
vmovupd qinv4x,%ymm6

# qhasm: q = mem256[q4x]
# asm 1: vmovupd q4x,>q=reg256#8
# asm 2: vmovupd q4x,>q=%ymm7
vmovupd q4x,%ymm7

# qhasm: 4x c = approx r0 * qinv
# asm 1: vmulpd <r0=reg256#4,<qinv=reg256#7,>c=reg256#9
# asm 2: vmulpd <r0=%ymm3,<qinv=%ymm6,>c=%ymm8
vmulpd %ymm3,%ymm6,%ymm8

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#9,>c=reg256#9
# asm 2: vroundpd $8,<c=%ymm8,>c=%ymm8
vroundpd $8,%ymm8,%ymm8

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#8,<c=reg256#9,>c=reg256#9
# asm 2: vmulpd <q=%ymm7,<c=%ymm8,>c=%ymm8
vmulpd %ymm7,%ymm8,%ymm8

# qhasm: 4x r0 approx -= c
# asm 1: vsubpd <c=reg256#9,<r0=reg256#4,>r0=reg256#4
# asm 2: vsubpd <c=%ymm8,<r0=%ymm3,>r0=%ymm3
vsubpd %ymm8,%ymm3,%ymm3

# qhasm: 4x c = approx r1 * qinv
# asm 1: vmulpd <r1=reg256#3,<qinv=reg256#7,>c=reg256#9
# asm 2: vmulpd <r1=%ymm2,<qinv=%ymm6,>c=%ymm8
vmulpd %ymm2,%ymm6,%ymm8

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#9,>c=reg256#9
# asm 2: vroundpd $8,<c=%ymm8,>c=%ymm8
vroundpd $8,%ymm8,%ymm8

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#8,<c=reg256#9,>c=reg256#9
# asm 2: vmulpd <q=%ymm7,<c=%ymm8,>c=%ymm8
vmulpd %ymm7,%ymm8,%ymm8

# qhasm: 4x r1 approx -= c
# asm 1: vsubpd <c=reg256#9,<r1=reg256#3,>r1=reg256#3
# asm 2: vsubpd <c=%ymm8,<r1=%ymm2,>r1=%ymm2
vsubpd %ymm8,%ymm2,%ymm2

# qhasm: 4x c = approx r3 * qinv
# asm 1: vmulpd <r3=reg256#6,<qinv=reg256#7,>c=reg256#9
# asm 2: vmulpd <r3=%ymm5,<qinv=%ymm6,>c=%ymm8
vmulpd %ymm5,%ymm6,%ymm8

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#9,>c=reg256#9
# asm 2: vroundpd $8,<c=%ymm8,>c=%ymm8
vroundpd $8,%ymm8,%ymm8

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#8,<c=reg256#9,>c=reg256#9
# asm 2: vmulpd <q=%ymm7,<c=%ymm8,>c=%ymm8
vmulpd %ymm7,%ymm8,%ymm8

# qhasm: 4x r3 approx -= c
# asm 1: vsubpd <c=reg256#9,<r3=reg256#6,>r3=reg256#6
# asm 2: vsubpd <c=%ymm8,<r3=%ymm5,>r3=%ymm5
vsubpd %ymm8,%ymm5,%ymm5

# qhasm: 4x c = approx r4 * qinv
# asm 1: vmulpd <r4=reg256#5,<qinv=reg256#7,>c=reg256#9
# asm 2: vmulpd <r4=%ymm4,<qinv=%ymm6,>c=%ymm8
vmulpd %ymm4,%ymm6,%ymm8

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#9,>c=reg256#9
# asm 2: vroundpd $8,<c=%ymm8,>c=%ymm8
vroundpd $8,%ymm8,%ymm8

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#8,<c=reg256#9,>c=reg256#9
# asm 2: vmulpd <q=%ymm7,<c=%ymm8,>c=%ymm8
vmulpd %ymm7,%ymm8,%ymm8

# qhasm: 4x r4 approx -= c
# asm 1: vsubpd <c=reg256#9,<r4=reg256#5,>r4=reg256#5
# asm 2: vsubpd <c=%ymm8,<r4=%ymm4,>r4=%ymm4
vsubpd %ymm8,%ymm4,%ymm4

# qhasm: 4x c = approx r6 * qinv
# asm 1: vmulpd <r6=reg256#1,<qinv=reg256#7,>c=reg256#9
# asm 2: vmulpd <r6=%ymm0,<qinv=%ymm6,>c=%ymm8
vmulpd %ymm0,%ymm6,%ymm8

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#9,>c=reg256#9
# asm 2: vroundpd $8,<c=%ymm8,>c=%ymm8
vroundpd $8,%ymm8,%ymm8

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#8,<c=reg256#9,>c=reg256#9
# asm 2: vmulpd <q=%ymm7,<c=%ymm8,>c=%ymm8
vmulpd %ymm7,%ymm8,%ymm8

# qhasm: 4x r6 approx -= c
# asm 1: vsubpd <c=reg256#9,<r6=reg256#1,>r6=reg256#1
# asm 2: vsubpd <c=%ymm8,<r6=%ymm0,>r6=%ymm0
vsubpd %ymm8,%ymm0,%ymm0

# qhasm: 4x c = approx r7 * qinv
# asm 1: vmulpd <r7=reg256#2,<qinv=reg256#7,>c=reg256#7
# asm 2: vmulpd <r7=%ymm1,<qinv=%ymm6,>c=%ymm6
vmulpd %ymm1,%ymm6,%ymm6

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#7,>c=reg256#7
# asm 2: vroundpd $8,<c=%ymm6,>c=%ymm6
vroundpd $8,%ymm6,%ymm6

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#8,<c=reg256#7,>c=reg256#7
# asm 2: vmulpd <q=%ymm7,<c=%ymm6,>c=%ymm6
vmulpd %ymm7,%ymm6,%ymm6

# qhasm: 4x r7 approx -= c
# asm 1: vsubpd <c=reg256#7,<r7=reg256#2,>r7=reg256#2
# asm 2: vsubpd <c=%ymm6,<r7=%ymm1,>r7=%ymm1
vsubpd %ymm6,%ymm1,%ymm1

# qhasm: redctr = 64
# asm 1: mov  $64,>redctr=int64#6
# asm 2: mov  $64,>redctr=%r9
mov  $64,%r9
# comment:fp stack unchanged by fallthrough

# qhasm: noreducef:
._noreducef:

# qhasm: unsigned>? jctr -= 1
# asm 1: sub  $1,<jctr=int64#7
# asm 2: sub  $1,<jctr=%rax
sub  $1,%rax
# comment:fp stack unchanged by jump

# qhasm: goto jflooptop if unsigned>
ja ._jflooptop

# qhasm: qinv = mem256[qinv4x]
# asm 1: vmovupd qinv4x,>qinv=reg256#7
# asm 2: vmovupd qinv4x,>qinv=%ymm6
vmovupd qinv4x,%ymm6

# qhasm: q = mem256[q4x]
# asm 1: vmovupd q4x,>q=reg256#8
# asm 2: vmovupd q4x,>q=%ymm7
vmovupd q4x,%ymm7

# qhasm: 4x c = approx r0 * qinv
# asm 1: vmulpd <r0=reg256#4,<qinv=reg256#7,>c=reg256#9
# asm 2: vmulpd <r0=%ymm3,<qinv=%ymm6,>c=%ymm8
vmulpd %ymm3,%ymm6,%ymm8

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#9,>c=reg256#9
# asm 2: vroundpd $8,<c=%ymm8,>c=%ymm8
vroundpd $8,%ymm8,%ymm8

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#8,<c=reg256#9,>c=reg256#9
# asm 2: vmulpd <q=%ymm7,<c=%ymm8,>c=%ymm8
vmulpd %ymm7,%ymm8,%ymm8

# qhasm: 4x r0 approx -= c
# asm 1: vsubpd <c=reg256#9,<r0=reg256#4,>r0=reg256#4
# asm 2: vsubpd <c=%ymm8,<r0=%ymm3,>r0=%ymm3
vsubpd %ymm8,%ymm3,%ymm3

# qhasm: 4x c = approx r1 * qinv
# asm 1: vmulpd <r1=reg256#3,<qinv=reg256#7,>c=reg256#9
# asm 2: vmulpd <r1=%ymm2,<qinv=%ymm6,>c=%ymm8
vmulpd %ymm2,%ymm6,%ymm8

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#9,>c=reg256#9
# asm 2: vroundpd $8,<c=%ymm8,>c=%ymm8
vroundpd $8,%ymm8,%ymm8

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#8,<c=reg256#9,>c=reg256#9
# asm 2: vmulpd <q=%ymm7,<c=%ymm8,>c=%ymm8
vmulpd %ymm7,%ymm8,%ymm8

# qhasm: 4x r1 approx -= c
# asm 1: vsubpd <c=reg256#9,<r1=reg256#3,>r1=reg256#3
# asm 2: vsubpd <c=%ymm8,<r1=%ymm2,>r1=%ymm2
vsubpd %ymm8,%ymm2,%ymm2

# qhasm: 4x c = approx r3 * qinv
# asm 1: vmulpd <r3=reg256#6,<qinv=reg256#7,>c=reg256#9
# asm 2: vmulpd <r3=%ymm5,<qinv=%ymm6,>c=%ymm8
vmulpd %ymm5,%ymm6,%ymm8

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#9,>c=reg256#9
# asm 2: vroundpd $8,<c=%ymm8,>c=%ymm8
vroundpd $8,%ymm8,%ymm8

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#8,<c=reg256#9,>c=reg256#9
# asm 2: vmulpd <q=%ymm7,<c=%ymm8,>c=%ymm8
vmulpd %ymm7,%ymm8,%ymm8

# qhasm: 4x r3 approx -= c
# asm 1: vsubpd <c=reg256#9,<r3=reg256#6,>r3=reg256#6
# asm 2: vsubpd <c=%ymm8,<r3=%ymm5,>r3=%ymm5
vsubpd %ymm8,%ymm5,%ymm5

# qhasm: 4x c = approx r4 * qinv
# asm 1: vmulpd <r4=reg256#5,<qinv=reg256#7,>c=reg256#9
# asm 2: vmulpd <r4=%ymm4,<qinv=%ymm6,>c=%ymm8
vmulpd %ymm4,%ymm6,%ymm8

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#9,>c=reg256#9
# asm 2: vroundpd $8,<c=%ymm8,>c=%ymm8
vroundpd $8,%ymm8,%ymm8

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#8,<c=reg256#9,>c=reg256#9
# asm 2: vmulpd <q=%ymm7,<c=%ymm8,>c=%ymm8
vmulpd %ymm7,%ymm8,%ymm8

# qhasm: 4x r4 approx -= c
# asm 1: vsubpd <c=reg256#9,<r4=reg256#5,>r4=reg256#5
# asm 2: vsubpd <c=%ymm8,<r4=%ymm4,>r4=%ymm4
vsubpd %ymm8,%ymm4,%ymm4

# qhasm: 4x c = approx r6 * qinv
# asm 1: vmulpd <r6=reg256#1,<qinv=reg256#7,>c=reg256#9
# asm 2: vmulpd <r6=%ymm0,<qinv=%ymm6,>c=%ymm8
vmulpd %ymm0,%ymm6,%ymm8

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#9,>c=reg256#9
# asm 2: vroundpd $8,<c=%ymm8,>c=%ymm8
vroundpd $8,%ymm8,%ymm8

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#8,<c=reg256#9,>c=reg256#9
# asm 2: vmulpd <q=%ymm7,<c=%ymm8,>c=%ymm8
vmulpd %ymm7,%ymm8,%ymm8

# qhasm: 4x r6 approx -= c
# asm 1: vsubpd <c=reg256#9,<r6=reg256#1,>r6=reg256#1
# asm 2: vsubpd <c=%ymm8,<r6=%ymm0,>r6=%ymm0
vsubpd %ymm8,%ymm0,%ymm0

# qhasm: 4x c = approx r7 * qinv
# asm 1: vmulpd <r7=reg256#2,<qinv=reg256#7,>c=reg256#7
# asm 2: vmulpd <r7=%ymm1,<qinv=%ymm6,>c=%ymm6
vmulpd %ymm1,%ymm6,%ymm6

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#7,>c=reg256#7
# asm 2: vroundpd $8,<c=%ymm6,>c=%ymm6
vroundpd $8,%ymm6,%ymm6

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#8,<c=reg256#7,>c=reg256#7
# asm 2: vmulpd <q=%ymm7,<c=%ymm6,>c=%ymm6
vmulpd %ymm7,%ymm6,%ymm6

# qhasm: 4x r7 approx -= c
# asm 1: vsubpd <c=reg256#7,<r7=reg256#2,>r7=reg256#2
# asm 2: vsubpd <c=%ymm6,<r7=%ymm1,>r7=%ymm1
vsubpd %ymm6,%ymm1,%ymm1

# qhasm: mem256[rp +     0] = r0
# asm 1: vmovupd   <r0=reg256#4,0(<rp=int64#1)
# asm 2: vmovupd   <r0=%ymm3,0(<rp=%rdi)
vmovupd   %ymm3,0(%rdi)

# qhasm: mem256[rp +    32] = r1
# asm 1: vmovupd   <r1=reg256#3,32(<rp=int64#1)
# asm 2: vmovupd   <r1=%ymm2,32(<rp=%rdi)
vmovupd   %ymm2,32(%rdi)

# qhasm: mem256[rp +  7936] = r3
# asm 1: vmovupd   <r3=reg256#6,7936(<rp=int64#1)
# asm 2: vmovupd   <r3=%ymm5,7936(<rp=%rdi)
vmovupd   %ymm5,7936(%rdi)

# qhasm: mem256[rp + 7968] = r4
# asm 1: vmovupd   <r4=reg256#5,7968(<rp=int64#1)
# asm 2: vmovupd   <r4=%ymm4,7968(<rp=%rdi)
vmovupd   %ymm4,7968(%rdi)

# qhasm: mem256[rp + 15872] = r6
# asm 1: vmovupd   <r6=reg256#1,15872(<rp=int64#1)
# asm 2: vmovupd   <r6=%ymm0,15872(<rp=%rdi)
vmovupd   %ymm0,15872(%rdi)

# qhasm: mem256[rp + 15904] = r7
# asm 1: vmovupd   <r7=reg256#2,15904(<rp=int64#1)
# asm 2: vmovupd   <r7=%ymm1,15904(<rp=%rdi)
vmovupd   %ymm1,15904(%rdi)

# qhasm: rp+=64
# asm 1: add  $64,<rp=int64#1
# asm 2: add  $64,<rp=%rdi
add  $64,%rdi

# qhasm: ap -= 2091104
# asm 1: sub  $2091104,<ap=int64#3
# asm 2: sub  $2091104,<ap=%rdx
sub  $2091104,%rdx

# qhasm: ictr -= 8
# asm 1: sub  $8,<ictr=int64#4
# asm 2: sub  $8,<ictr=%rcx
sub  $8,%rcx

# qhasm: ilooptop:
._ilooptop:

# qhasm: bp = input_1
# asm 1: mov  <input_1=int64#2,>bp=int64#5
# asm 2: mov  <input_1=%rsi,>bp=%r8
mov  %rsi,%r8

# qhasm: redctr = 63
# asm 1: mov  $63,>redctr=int64#6
# asm 2: mov  $63,>redctr=%r9
mov  $63,%r9

# qhasm: a0 = (4x double)(4x int32)mem128[ap +   0]
# asm 1: vcvtdq2pd 0(<ap=int64#3),>a0=reg256#1
# asm 2: vcvtdq2pd 0(<ap=%rdx),>a0=%ymm0
vcvtdq2pd 0(%rdx),%ymm0

# qhasm: a1 = (4x double)(4x int32)mem128[ap +   16]
# asm 1: vcvtdq2pd 16(<ap=int64#3),>a1=reg256#2
# asm 2: vcvtdq2pd 16(<ap=%rdx),>a1=%ymm1
vcvtdq2pd 16(%rdx),%ymm1

# qhasm: a2 = (4x double)(4x int32)mem128[ap +   32]
# asm 1: vcvtdq2pd 32(<ap=int64#3),>a2=reg256#3
# asm 2: vcvtdq2pd 32(<ap=%rdx),>a2=%ymm2
vcvtdq2pd 32(%rdx),%ymm2

# qhasm: b  = mem64[bp +  0],mem64[bp +  0],mem64[bp +  0],mem64[bp +  0]
# asm 1: vbroadcastsd 0(<bp=int64#5),>b=reg256#4
# asm 2: vbroadcastsd 0(<bp=%r8),>b=%ymm3
vbroadcastsd 0(%r8),%ymm3

# qhasm: 4x r0 = approx b * a0
# asm 1: vmulpd <b=reg256#4,<a0=reg256#1,>r0=reg256#5
# asm 2: vmulpd <b=%ymm3,<a0=%ymm0,>r0=%ymm4
vmulpd %ymm3,%ymm0,%ymm4

# qhasm: 4x r1 = approx b * a1
# asm 1: vmulpd <b=reg256#4,<a1=reg256#2,>r1=reg256#6
# asm 2: vmulpd <b=%ymm3,<a1=%ymm1,>r1=%ymm5
vmulpd %ymm3,%ymm1,%ymm5

# qhasm: 4x r2 = approx b * a2
# asm 1: vmulpd <b=reg256#4,<a2=reg256#3,>r2=reg256#4
# asm 2: vmulpd <b=%ymm3,<a2=%ymm2,>r2=%ymm3
vmulpd %ymm3,%ymm2,%ymm3

# qhasm: b  = mem64[bp +  4224],mem64[bp +  4224],mem64[bp +  4224],mem64[bp +  4224]
# asm 1: vbroadcastsd 4224(<bp=int64#5),>b=reg256#7
# asm 2: vbroadcastsd 4224(<bp=%r8),>b=%ymm6
vbroadcastsd 4224(%r8),%ymm6

# qhasm: 4x r3 = approx b * a0
# asm 1: vmulpd <b=reg256#7,<a0=reg256#1,>r3=reg256#8
# asm 2: vmulpd <b=%ymm6,<a0=%ymm0,>r3=%ymm7
vmulpd %ymm6,%ymm0,%ymm7

# qhasm: 4x r4 = approx b * a1
# asm 1: vmulpd <b=reg256#7,<a1=reg256#2,>r4=reg256#9
# asm 2: vmulpd <b=%ymm6,<a1=%ymm1,>r4=%ymm8
vmulpd %ymm6,%ymm1,%ymm8

# qhasm: 4x r5 = approx b * a2
# asm 1: vmulpd <b=reg256#7,<a2=reg256#3,>r5=reg256#7
# asm 2: vmulpd <b=%ymm6,<a2=%ymm2,>r5=%ymm6
vmulpd %ymm6,%ymm2,%ymm6

# qhasm: b  = mem64[bp +  8448],mem64[bp +  8448],mem64[bp +  8448],mem64[bp +  8448]
# asm 1: vbroadcastsd 8448(<bp=int64#5),>b=reg256#10
# asm 2: vbroadcastsd 8448(<bp=%r8),>b=%ymm9
vbroadcastsd 8448(%r8),%ymm9

# qhasm: 4x r6 = approx b * a0
# asm 1: vmulpd <b=reg256#10,<a0=reg256#1,>r6=reg256#1
# asm 2: vmulpd <b=%ymm9,<a0=%ymm0,>r6=%ymm0
vmulpd %ymm9,%ymm0,%ymm0

# qhasm: 4x r7 = approx b * a1
# asm 1: vmulpd <b=reg256#10,<a1=reg256#2,>r7=reg256#2
# asm 2: vmulpd <b=%ymm9,<a1=%ymm1,>r7=%ymm1
vmulpd %ymm9,%ymm1,%ymm1

# qhasm: 4x r8 = approx b * a2
# asm 1: vmulpd <b=reg256#10,<a2=reg256#3,>r8=reg256#3
# asm 2: vmulpd <b=%ymm9,<a2=%ymm2,>r8=%ymm2
vmulpd %ymm9,%ymm2,%ymm2

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

# qhasm: a0 = (4x double)(4x int32)mem128[ap +   0]
# asm 1: vcvtdq2pd 0(<ap=int64#3),>a0=reg256#10
# asm 2: vcvtdq2pd 0(<ap=%rdx),>a0=%ymm9
vcvtdq2pd 0(%rdx),%ymm9

# qhasm: a1 = (4x double)(4x int32)mem128[ap +   16]
# asm 1: vcvtdq2pd 16(<ap=int64#3),>a1=reg256#11
# asm 2: vcvtdq2pd 16(<ap=%rdx),>a1=%ymm10
vcvtdq2pd 16(%rdx),%ymm10

# qhasm: a2 = (4x double)(4x int32)mem128[ap +   32]
# asm 1: vcvtdq2pd 32(<ap=int64#3),>a2=reg256#12
# asm 2: vcvtdq2pd 32(<ap=%rdx),>a2=%ymm11
vcvtdq2pd 32(%rdx),%ymm11

# qhasm: b  = mem64[bp +  0],mem64[bp +  0],mem64[bp +  0],mem64[bp +  0]
# asm 1: vbroadcastsd 0(<bp=int64#5),>b=reg256#13
# asm 2: vbroadcastsd 0(<bp=%r8),>b=%ymm12
vbroadcastsd 0(%r8),%ymm12

# qhasm: 4x r0 approx+=  b * a0
# asm 1: vfmadd231pd <b=reg256#13,<a0=reg256#10,<r0=reg256#5
# asm 2: vfmadd231pd <b=%ymm12,<a0=%ymm9,<r0=%ymm4
vfmadd231pd %ymm12,%ymm9,%ymm4

# qhasm: 4x r1 approx+=  b * a1
# asm 1: vfmadd231pd <b=reg256#13,<a1=reg256#11,<r1=reg256#6
# asm 2: vfmadd231pd <b=%ymm12,<a1=%ymm10,<r1=%ymm5
vfmadd231pd %ymm12,%ymm10,%ymm5

# qhasm: 4x r2 approx+=  b * a2
# asm 1: vfmadd231pd <b=reg256#13,<a2=reg256#12,<r2=reg256#4
# asm 2: vfmadd231pd <b=%ymm12,<a2=%ymm11,<r2=%ymm3
vfmadd231pd %ymm12,%ymm11,%ymm3

# qhasm: b  = mem64[bp +  4224],mem64[bp +  4224],mem64[bp +  4224],mem64[bp +  4224]
# asm 1: vbroadcastsd 4224(<bp=int64#5),>b=reg256#13
# asm 2: vbroadcastsd 4224(<bp=%r8),>b=%ymm12
vbroadcastsd 4224(%r8),%ymm12

# qhasm: 4x r3 approx+=  b * a0
# asm 1: vfmadd231pd <b=reg256#13,<a0=reg256#10,<r3=reg256#8
# asm 2: vfmadd231pd <b=%ymm12,<a0=%ymm9,<r3=%ymm7
vfmadd231pd %ymm12,%ymm9,%ymm7

# qhasm: 4x r4 approx+=  b * a1
# asm 1: vfmadd231pd <b=reg256#13,<a1=reg256#11,<r4=reg256#9
# asm 2: vfmadd231pd <b=%ymm12,<a1=%ymm10,<r4=%ymm8
vfmadd231pd %ymm12,%ymm10,%ymm8

# qhasm: 4x r5 approx+=  b * a2
# asm 1: vfmadd231pd <b=reg256#13,<a2=reg256#12,<r5=reg256#7
# asm 2: vfmadd231pd <b=%ymm12,<a2=%ymm11,<r5=%ymm6
vfmadd231pd %ymm12,%ymm11,%ymm6

# qhasm: b  = mem64[bp +  8448],mem64[bp +  8448],mem64[bp +  8448],mem64[bp +  8448]
# asm 1: vbroadcastsd 8448(<bp=int64#5),>b=reg256#13
# asm 2: vbroadcastsd 8448(<bp=%r8),>b=%ymm12
vbroadcastsd 8448(%r8),%ymm12

# qhasm: 4x r6 approx+=  b * a0
# asm 1: vfmadd231pd <b=reg256#13,<a0=reg256#10,<r6=reg256#1
# asm 2: vfmadd231pd <b=%ymm12,<a0=%ymm9,<r6=%ymm0
vfmadd231pd %ymm12,%ymm9,%ymm0

# qhasm: 4x r7 approx+=  b * a1
# asm 1: vfmadd231pd <b=reg256#13,<a1=reg256#11,<r7=reg256#2
# asm 2: vfmadd231pd <b=%ymm12,<a1=%ymm10,<r7=%ymm1
vfmadd231pd %ymm12,%ymm10,%ymm1

# qhasm: 4x r8 approx+=  b * a2
# asm 1: vfmadd231pd <b=reg256#13,<a2=reg256#12,<r8=reg256#3
# asm 2: vfmadd231pd <b=%ymm12,<a2=%ymm11,<r8=%ymm2
vfmadd231pd %ymm12,%ymm11,%ymm2

# qhasm: unsigned>? redctr -= 1
# asm 1: sub  $1,<redctr=int64#6
# asm 2: sub  $1,<redctr=%r9
sub  $1,%r9
# comment:fp stack unchanged by jump

# qhasm: goto noreduce if unsigned>
ja ._noreduce

# qhasm: qinv = mem256[qinv4x]
# asm 1: vmovupd qinv4x,>qinv=reg256#10
# asm 2: vmovupd qinv4x,>qinv=%ymm9
vmovupd qinv4x,%ymm9

# qhasm: q = mem256[q4x]
# asm 1: vmovupd q4x,>q=reg256#11
# asm 2: vmovupd q4x,>q=%ymm10
vmovupd q4x,%ymm10

# qhasm: 4x c = approx r0 * qinv
# asm 1: vmulpd <r0=reg256#5,<qinv=reg256#10,>c=reg256#12
# asm 2: vmulpd <r0=%ymm4,<qinv=%ymm9,>c=%ymm11
vmulpd %ymm4,%ymm9,%ymm11

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#12,>c=reg256#12
# asm 2: vroundpd $8,<c=%ymm11,>c=%ymm11
vroundpd $8,%ymm11,%ymm11

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#11,<c=reg256#12,>c=reg256#12
# asm 2: vmulpd <q=%ymm10,<c=%ymm11,>c=%ymm11
vmulpd %ymm10,%ymm11,%ymm11

# qhasm: 4x r0 approx -= c
# asm 1: vsubpd <c=reg256#12,<r0=reg256#5,>r0=reg256#5
# asm 2: vsubpd <c=%ymm11,<r0=%ymm4,>r0=%ymm4
vsubpd %ymm11,%ymm4,%ymm4

# qhasm: 4x c = approx r1 * qinv
# asm 1: vmulpd <r1=reg256#6,<qinv=reg256#10,>c=reg256#12
# asm 2: vmulpd <r1=%ymm5,<qinv=%ymm9,>c=%ymm11
vmulpd %ymm5,%ymm9,%ymm11

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#12,>c=reg256#12
# asm 2: vroundpd $8,<c=%ymm11,>c=%ymm11
vroundpd $8,%ymm11,%ymm11

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#11,<c=reg256#12,>c=reg256#12
# asm 2: vmulpd <q=%ymm10,<c=%ymm11,>c=%ymm11
vmulpd %ymm10,%ymm11,%ymm11

# qhasm: 4x r1 approx -= c
# asm 1: vsubpd <c=reg256#12,<r1=reg256#6,>r1=reg256#6
# asm 2: vsubpd <c=%ymm11,<r1=%ymm5,>r1=%ymm5
vsubpd %ymm11,%ymm5,%ymm5

# qhasm: 4x c = approx r2 * qinv
# asm 1: vmulpd <r2=reg256#4,<qinv=reg256#10,>c=reg256#12
# asm 2: vmulpd <r2=%ymm3,<qinv=%ymm9,>c=%ymm11
vmulpd %ymm3,%ymm9,%ymm11

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#12,>c=reg256#12
# asm 2: vroundpd $8,<c=%ymm11,>c=%ymm11
vroundpd $8,%ymm11,%ymm11

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#11,<c=reg256#12,>c=reg256#12
# asm 2: vmulpd <q=%ymm10,<c=%ymm11,>c=%ymm11
vmulpd %ymm10,%ymm11,%ymm11

# qhasm: 4x r2 approx -= c
# asm 1: vsubpd <c=reg256#12,<r2=reg256#4,>r2=reg256#4
# asm 2: vsubpd <c=%ymm11,<r2=%ymm3,>r2=%ymm3
vsubpd %ymm11,%ymm3,%ymm3

# qhasm: 4x c = approx r3 * qinv
# asm 1: vmulpd <r3=reg256#8,<qinv=reg256#10,>c=reg256#12
# asm 2: vmulpd <r3=%ymm7,<qinv=%ymm9,>c=%ymm11
vmulpd %ymm7,%ymm9,%ymm11

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#12,>c=reg256#12
# asm 2: vroundpd $8,<c=%ymm11,>c=%ymm11
vroundpd $8,%ymm11,%ymm11

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#11,<c=reg256#12,>c=reg256#12
# asm 2: vmulpd <q=%ymm10,<c=%ymm11,>c=%ymm11
vmulpd %ymm10,%ymm11,%ymm11

# qhasm: 4x r3 approx -= c
# asm 1: vsubpd <c=reg256#12,<r3=reg256#8,>r3=reg256#8
# asm 2: vsubpd <c=%ymm11,<r3=%ymm7,>r3=%ymm7
vsubpd %ymm11,%ymm7,%ymm7

# qhasm: 4x c = approx r4 * qinv
# asm 1: vmulpd <r4=reg256#9,<qinv=reg256#10,>c=reg256#12
# asm 2: vmulpd <r4=%ymm8,<qinv=%ymm9,>c=%ymm11
vmulpd %ymm8,%ymm9,%ymm11

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#12,>c=reg256#12
# asm 2: vroundpd $8,<c=%ymm11,>c=%ymm11
vroundpd $8,%ymm11,%ymm11

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#11,<c=reg256#12,>c=reg256#12
# asm 2: vmulpd <q=%ymm10,<c=%ymm11,>c=%ymm11
vmulpd %ymm10,%ymm11,%ymm11

# qhasm: 4x r4 approx -= c
# asm 1: vsubpd <c=reg256#12,<r4=reg256#9,>r4=reg256#9
# asm 2: vsubpd <c=%ymm11,<r4=%ymm8,>r4=%ymm8
vsubpd %ymm11,%ymm8,%ymm8

# qhasm: 4x c = approx r5 * qinv
# asm 1: vmulpd <r5=reg256#7,<qinv=reg256#10,>c=reg256#12
# asm 2: vmulpd <r5=%ymm6,<qinv=%ymm9,>c=%ymm11
vmulpd %ymm6,%ymm9,%ymm11

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#12,>c=reg256#12
# asm 2: vroundpd $8,<c=%ymm11,>c=%ymm11
vroundpd $8,%ymm11,%ymm11

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#11,<c=reg256#12,>c=reg256#12
# asm 2: vmulpd <q=%ymm10,<c=%ymm11,>c=%ymm11
vmulpd %ymm10,%ymm11,%ymm11

# qhasm: 4x r5 approx -= c
# asm 1: vsubpd <c=reg256#12,<r5=reg256#7,>r5=reg256#7
# asm 2: vsubpd <c=%ymm11,<r5=%ymm6,>r5=%ymm6
vsubpd %ymm11,%ymm6,%ymm6

# qhasm: 4x c = approx r6 * qinv
# asm 1: vmulpd <r6=reg256#1,<qinv=reg256#10,>c=reg256#12
# asm 2: vmulpd <r6=%ymm0,<qinv=%ymm9,>c=%ymm11
vmulpd %ymm0,%ymm9,%ymm11

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#12,>c=reg256#12
# asm 2: vroundpd $8,<c=%ymm11,>c=%ymm11
vroundpd $8,%ymm11,%ymm11

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#11,<c=reg256#12,>c=reg256#12
# asm 2: vmulpd <q=%ymm10,<c=%ymm11,>c=%ymm11
vmulpd %ymm10,%ymm11,%ymm11

# qhasm: 4x r6 approx -= c
# asm 1: vsubpd <c=reg256#12,<r6=reg256#1,>r6=reg256#1
# asm 2: vsubpd <c=%ymm11,<r6=%ymm0,>r6=%ymm0
vsubpd %ymm11,%ymm0,%ymm0

# qhasm: 4x c = approx r7 * qinv
# asm 1: vmulpd <r7=reg256#2,<qinv=reg256#10,>c=reg256#12
# asm 2: vmulpd <r7=%ymm1,<qinv=%ymm9,>c=%ymm11
vmulpd %ymm1,%ymm9,%ymm11

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#12,>c=reg256#12
# asm 2: vroundpd $8,<c=%ymm11,>c=%ymm11
vroundpd $8,%ymm11,%ymm11

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#11,<c=reg256#12,>c=reg256#12
# asm 2: vmulpd <q=%ymm10,<c=%ymm11,>c=%ymm11
vmulpd %ymm10,%ymm11,%ymm11

# qhasm: 4x r7 approx -= c
# asm 1: vsubpd <c=reg256#12,<r7=reg256#2,>r7=reg256#2
# asm 2: vsubpd <c=%ymm11,<r7=%ymm1,>r7=%ymm1
vsubpd %ymm11,%ymm1,%ymm1

# qhasm: 4x c = approx r8 * qinv
# asm 1: vmulpd <r8=reg256#3,<qinv=reg256#10,>c=reg256#10
# asm 2: vmulpd <r8=%ymm2,<qinv=%ymm9,>c=%ymm9
vmulpd %ymm2,%ymm9,%ymm9

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#10,>c=reg256#10
# asm 2: vroundpd $8,<c=%ymm9,>c=%ymm9
vroundpd $8,%ymm9,%ymm9

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#11,<c=reg256#10,>c=reg256#10
# asm 2: vmulpd <q=%ymm10,<c=%ymm9,>c=%ymm9
vmulpd %ymm10,%ymm9,%ymm9

# qhasm: 4x r8 approx -= c
# asm 1: vsubpd <c=reg256#10,<r8=reg256#3,>r8=reg256#3
# asm 2: vsubpd <c=%ymm9,<r8=%ymm2,>r8=%ymm2
vsubpd %ymm9,%ymm2,%ymm2

# qhasm: redctr = 64
# asm 1: mov  $64,>redctr=int64#6
# asm 2: mov  $64,>redctr=%r9
mov  $64,%r9
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
# asm 1: vmovupd qinv4x,>qinv=reg256#10
# asm 2: vmovupd qinv4x,>qinv=%ymm9
vmovupd qinv4x,%ymm9

# qhasm: q = mem256[q4x]
# asm 1: vmovupd q4x,>q=reg256#11
# asm 2: vmovupd q4x,>q=%ymm10
vmovupd q4x,%ymm10

# qhasm: 4x c = approx r0 * qinv
# asm 1: vmulpd <r0=reg256#5,<qinv=reg256#10,>c=reg256#12
# asm 2: vmulpd <r0=%ymm4,<qinv=%ymm9,>c=%ymm11
vmulpd %ymm4,%ymm9,%ymm11

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#12,>c=reg256#12
# asm 2: vroundpd $8,<c=%ymm11,>c=%ymm11
vroundpd $8,%ymm11,%ymm11

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#11,<c=reg256#12,>c=reg256#12
# asm 2: vmulpd <q=%ymm10,<c=%ymm11,>c=%ymm11
vmulpd %ymm10,%ymm11,%ymm11

# qhasm: 4x r0 approx -= c
# asm 1: vsubpd <c=reg256#12,<r0=reg256#5,>r0=reg256#5
# asm 2: vsubpd <c=%ymm11,<r0=%ymm4,>r0=%ymm4
vsubpd %ymm11,%ymm4,%ymm4

# qhasm: 4x c = approx r1 * qinv
# asm 1: vmulpd <r1=reg256#6,<qinv=reg256#10,>c=reg256#12
# asm 2: vmulpd <r1=%ymm5,<qinv=%ymm9,>c=%ymm11
vmulpd %ymm5,%ymm9,%ymm11

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#12,>c=reg256#12
# asm 2: vroundpd $8,<c=%ymm11,>c=%ymm11
vroundpd $8,%ymm11,%ymm11

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#11,<c=reg256#12,>c=reg256#12
# asm 2: vmulpd <q=%ymm10,<c=%ymm11,>c=%ymm11
vmulpd %ymm10,%ymm11,%ymm11

# qhasm: 4x r1 approx -= c
# asm 1: vsubpd <c=reg256#12,<r1=reg256#6,>r1=reg256#6
# asm 2: vsubpd <c=%ymm11,<r1=%ymm5,>r1=%ymm5
vsubpd %ymm11,%ymm5,%ymm5

# qhasm: 4x c = approx r2 * qinv
# asm 1: vmulpd <r2=reg256#4,<qinv=reg256#10,>c=reg256#12
# asm 2: vmulpd <r2=%ymm3,<qinv=%ymm9,>c=%ymm11
vmulpd %ymm3,%ymm9,%ymm11

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#12,>c=reg256#12
# asm 2: vroundpd $8,<c=%ymm11,>c=%ymm11
vroundpd $8,%ymm11,%ymm11

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#11,<c=reg256#12,>c=reg256#12
# asm 2: vmulpd <q=%ymm10,<c=%ymm11,>c=%ymm11
vmulpd %ymm10,%ymm11,%ymm11

# qhasm: 4x r2 approx -= c
# asm 1: vsubpd <c=reg256#12,<r2=reg256#4,>r2=reg256#4
# asm 2: vsubpd <c=%ymm11,<r2=%ymm3,>r2=%ymm3
vsubpd %ymm11,%ymm3,%ymm3

# qhasm: 4x c = approx r3 * qinv
# asm 1: vmulpd <r3=reg256#8,<qinv=reg256#10,>c=reg256#12
# asm 2: vmulpd <r3=%ymm7,<qinv=%ymm9,>c=%ymm11
vmulpd %ymm7,%ymm9,%ymm11

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#12,>c=reg256#12
# asm 2: vroundpd $8,<c=%ymm11,>c=%ymm11
vroundpd $8,%ymm11,%ymm11

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#11,<c=reg256#12,>c=reg256#12
# asm 2: vmulpd <q=%ymm10,<c=%ymm11,>c=%ymm11
vmulpd %ymm10,%ymm11,%ymm11

# qhasm: 4x r3 approx -= c
# asm 1: vsubpd <c=reg256#12,<r3=reg256#8,>r3=reg256#8
# asm 2: vsubpd <c=%ymm11,<r3=%ymm7,>r3=%ymm7
vsubpd %ymm11,%ymm7,%ymm7

# qhasm: 4x c = approx r4 * qinv
# asm 1: vmulpd <r4=reg256#9,<qinv=reg256#10,>c=reg256#12
# asm 2: vmulpd <r4=%ymm8,<qinv=%ymm9,>c=%ymm11
vmulpd %ymm8,%ymm9,%ymm11

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#12,>c=reg256#12
# asm 2: vroundpd $8,<c=%ymm11,>c=%ymm11
vroundpd $8,%ymm11,%ymm11

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#11,<c=reg256#12,>c=reg256#12
# asm 2: vmulpd <q=%ymm10,<c=%ymm11,>c=%ymm11
vmulpd %ymm10,%ymm11,%ymm11

# qhasm: 4x r4 approx -= c
# asm 1: vsubpd <c=reg256#12,<r4=reg256#9,>r4=reg256#9
# asm 2: vsubpd <c=%ymm11,<r4=%ymm8,>r4=%ymm8
vsubpd %ymm11,%ymm8,%ymm8

# qhasm: 4x c = approx r5 * qinv
# asm 1: vmulpd <r5=reg256#7,<qinv=reg256#10,>c=reg256#12
# asm 2: vmulpd <r5=%ymm6,<qinv=%ymm9,>c=%ymm11
vmulpd %ymm6,%ymm9,%ymm11

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#12,>c=reg256#12
# asm 2: vroundpd $8,<c=%ymm11,>c=%ymm11
vroundpd $8,%ymm11,%ymm11

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#11,<c=reg256#12,>c=reg256#12
# asm 2: vmulpd <q=%ymm10,<c=%ymm11,>c=%ymm11
vmulpd %ymm10,%ymm11,%ymm11

# qhasm: 4x r5 approx -= c
# asm 1: vsubpd <c=reg256#12,<r5=reg256#7,>r5=reg256#7
# asm 2: vsubpd <c=%ymm11,<r5=%ymm6,>r5=%ymm6
vsubpd %ymm11,%ymm6,%ymm6

# qhasm: 4x c = approx r6 * qinv
# asm 1: vmulpd <r6=reg256#1,<qinv=reg256#10,>c=reg256#12
# asm 2: vmulpd <r6=%ymm0,<qinv=%ymm9,>c=%ymm11
vmulpd %ymm0,%ymm9,%ymm11

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#12,>c=reg256#12
# asm 2: vroundpd $8,<c=%ymm11,>c=%ymm11
vroundpd $8,%ymm11,%ymm11

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#11,<c=reg256#12,>c=reg256#12
# asm 2: vmulpd <q=%ymm10,<c=%ymm11,>c=%ymm11
vmulpd %ymm10,%ymm11,%ymm11

# qhasm: 4x r6 approx -= c
# asm 1: vsubpd <c=reg256#12,<r6=reg256#1,>r6=reg256#1
# asm 2: vsubpd <c=%ymm11,<r6=%ymm0,>r6=%ymm0
vsubpd %ymm11,%ymm0,%ymm0

# qhasm: 4x c = approx r7 * qinv
# asm 1: vmulpd <r7=reg256#2,<qinv=reg256#10,>c=reg256#12
# asm 2: vmulpd <r7=%ymm1,<qinv=%ymm9,>c=%ymm11
vmulpd %ymm1,%ymm9,%ymm11

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#12,>c=reg256#12
# asm 2: vroundpd $8,<c=%ymm11,>c=%ymm11
vroundpd $8,%ymm11,%ymm11

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#11,<c=reg256#12,>c=reg256#12
# asm 2: vmulpd <q=%ymm10,<c=%ymm11,>c=%ymm11
vmulpd %ymm10,%ymm11,%ymm11

# qhasm: 4x r7 approx -= c
# asm 1: vsubpd <c=reg256#12,<r7=reg256#2,>r7=reg256#2
# asm 2: vsubpd <c=%ymm11,<r7=%ymm1,>r7=%ymm1
vsubpd %ymm11,%ymm1,%ymm1

# qhasm: 4x c = approx r8 * qinv
# asm 1: vmulpd <r8=reg256#3,<qinv=reg256#10,>c=reg256#10
# asm 2: vmulpd <r8=%ymm2,<qinv=%ymm9,>c=%ymm9
vmulpd %ymm2,%ymm9,%ymm9

# qhasm: 4x c = round(c)
# asm 1: vroundpd $8,<c=reg256#10,>c=reg256#10
# asm 2: vroundpd $8,<c=%ymm9,>c=%ymm9
vroundpd $8,%ymm9,%ymm9

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#11,<c=reg256#10,>c=reg256#10
# asm 2: vmulpd <q=%ymm10,<c=%ymm9,>c=%ymm9
vmulpd %ymm10,%ymm9,%ymm9

# qhasm: 4x r8 approx -= c
# asm 1: vsubpd <c=reg256#10,<r8=reg256#3,>r8=reg256#3
# asm 2: vsubpd <c=%ymm9,<r8=%ymm2,>r8=%ymm2
vsubpd %ymm9,%ymm2,%ymm2

# qhasm: mem256[rp +     0] = r0
# asm 1: vmovupd   <r0=reg256#5,0(<rp=int64#1)
# asm 2: vmovupd   <r0=%ymm4,0(<rp=%rdi)
vmovupd   %ymm4,0(%rdi)

# qhasm: mem256[rp +    32] = r1
# asm 1: vmovupd   <r1=reg256#6,32(<rp=int64#1)
# asm 2: vmovupd   <r1=%ymm5,32(<rp=%rdi)
vmovupd   %ymm5,32(%rdi)

# qhasm: mem256[rp +    64] = r2
# asm 1: vmovupd   <r2=reg256#4,64(<rp=int64#1)
# asm 2: vmovupd   <r2=%ymm3,64(<rp=%rdi)
vmovupd   %ymm3,64(%rdi)

# qhasm: mem256[rp +  7936] = r3
# asm 1: vmovupd   <r3=reg256#8,7936(<rp=int64#1)
# asm 2: vmovupd   <r3=%ymm7,7936(<rp=%rdi)
vmovupd   %ymm7,7936(%rdi)

# qhasm: mem256[rp + 7968] = r4
# asm 1: vmovupd   <r4=reg256#9,7968(<rp=int64#1)
# asm 2: vmovupd   <r4=%ymm8,7968(<rp=%rdi)
vmovupd   %ymm8,7968(%rdi)

# qhasm: mem256[rp + 8000] = r5
# asm 1: vmovupd   <r5=reg256#7,8000(<rp=int64#1)
# asm 2: vmovupd   <r5=%ymm6,8000(<rp=%rdi)
vmovupd   %ymm6,8000(%rdi)

# qhasm: mem256[rp + 15872] = r6
# asm 1: vmovupd   <r6=reg256#1,15872(<rp=int64#1)
# asm 2: vmovupd   <r6=%ymm0,15872(<rp=%rdi)
vmovupd   %ymm0,15872(%rdi)

# qhasm: mem256[rp + 15904] = r7
# asm 1: vmovupd   <r7=reg256#2,15904(<rp=int64#1)
# asm 2: vmovupd   <r7=%ymm1,15904(<rp=%rdi)
vmovupd   %ymm1,15904(%rdi)

# qhasm: mem256[rp + 15936] = r8
# asm 1: vmovupd   <r8=reg256#3,15936(<rp=int64#1)
# asm 2: vmovupd   <r8=%ymm2,15936(<rp=%rdi)
vmovupd   %ymm2,15936(%rdi)

# qhasm: rp+=96
# asm 1: add  $96,<rp=int64#1
# asm 2: add  $96,<rp=%rdi
add  $96,%rdi

# qhasm: ap -= 2091088
# asm 1: sub  $2091088,<ap=int64#3
# asm 2: sub  $2091088,<ap=%rdx
sub  $2091088,%rdx

# qhasm: unsigned>? ictr -= 12
# asm 1: sub  $12,<ictr=int64#4
# asm 2: sub  $12,<ictr=%rcx
sub  $12,%rcx
# comment:fp stack unchanged by jump

# qhasm: goto ilooptop if unsigned>
ja ._ilooptop

# qhasm: return
add %r11,%rsp
ret
