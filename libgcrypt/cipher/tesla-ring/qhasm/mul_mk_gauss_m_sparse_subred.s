
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

# qhasm: reg256 v0

# qhasm: reg256 v1

# qhasm: reg256 v2

# qhasm: reg256 v3

# qhasm: reg256 c0

# qhasm: reg256 c1

# qhasm: reg256 c2

# qhasm: reg256 c3

# qhasm: reg256 sign

# qhasm: int64 pos

# qhasm: int64 ctri

# qhasm: enter mul_mk_gauss_m_sparse_subred
.p2align 5
.global _mul_mk_gauss_m_sparse_subred
.global mul_mk_gauss_m_sparse_subred
_mul_mk_gauss_m_sparse_subred:
mul_mk_gauss_m_sparse_subred:
mov %rsp,%r11
and $31,%r11
add $0,%r11
sub %r11,%rsp

# qhasm: ctri = 62
# asm 1: mov  $62,>ctri=int64#5
# asm 2: mov  $62,>ctri=%r8
mov  $62,%r8

# qhasm: ilooptop:
._ilooptop:

# qhasm: r0 = mem256[input_0 +   0]
# asm 1: vmovupd   0(<input_0=int64#1),>r0=reg256#1
# asm 2: vmovupd   0(<input_0=%rdi),>r0=%ymm0
vmovupd   0(%rdi),%ymm0

# qhasm: r1 = mem256[input_0 +   32]
# asm 1: vmovupd   32(<input_0=int64#1),>r1=reg256#2
# asm 2: vmovupd   32(<input_0=%rdi),>r1=%ymm1
vmovupd   32(%rdi),%ymm1

# qhasm: r2 = mem256[input_0 +   64]
# asm 1: vmovupd   64(<input_0=int64#1),>r2=reg256#3
# asm 2: vmovupd   64(<input_0=%rdi),>r2=%ymm2
vmovupd   64(%rdi),%ymm2

# qhasm: r3 = mem256[input_0 +   96]
# asm 1: vmovupd   96(<input_0=int64#1),>r3=reg256#4
# asm 2: vmovupd   96(<input_0=%rdi),>r3=%ymm3
vmovupd   96(%rdi),%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 0)
# asm 1: movl   0(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   0(<input_2=%rdx),>pos=%r9d
movl   0(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  0],mem64[input_3 +  0],mem64[input_3 +  0],mem64[input_3 +  0]
# asm 1: vbroadcastsd 0(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 0(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 0(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 4)
# asm 1: movl   4(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   4(<input_2=%rdx),>pos=%r9d
movl   4(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  8],mem64[input_3 +  8],mem64[input_3 +  8],mem64[input_3 +  8]
# asm 1: vbroadcastsd 8(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 8(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 8(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 8)
# asm 1: movl   8(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   8(<input_2=%rdx),>pos=%r9d
movl   8(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  16],mem64[input_3 +  16],mem64[input_3 +  16],mem64[input_3 +  16]
# asm 1: vbroadcastsd 16(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 16(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 16(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 12)
# asm 1: movl   12(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   12(<input_2=%rdx),>pos=%r9d
movl   12(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  24],mem64[input_3 +  24],mem64[input_3 +  24],mem64[input_3 +  24]
# asm 1: vbroadcastsd 24(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 24(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 24(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 16)
# asm 1: movl   16(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   16(<input_2=%rdx),>pos=%r9d
movl   16(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  32],mem64[input_3 +  32],mem64[input_3 +  32],mem64[input_3 +  32]
# asm 1: vbroadcastsd 32(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 32(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 32(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 20)
# asm 1: movl   20(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   20(<input_2=%rdx),>pos=%r9d
movl   20(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  40],mem64[input_3 +  40],mem64[input_3 +  40],mem64[input_3 +  40]
# asm 1: vbroadcastsd 40(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 40(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 40(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 24)
# asm 1: movl   24(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   24(<input_2=%rdx),>pos=%r9d
movl   24(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  48],mem64[input_3 +  48],mem64[input_3 +  48],mem64[input_3 +  48]
# asm 1: vbroadcastsd 48(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 48(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 48(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 28)
# asm 1: movl   28(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   28(<input_2=%rdx),>pos=%r9d
movl   28(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  56],mem64[input_3 +  56],mem64[input_3 +  56],mem64[input_3 +  56]
# asm 1: vbroadcastsd 56(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 56(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 56(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 32)
# asm 1: movl   32(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   32(<input_2=%rdx),>pos=%r9d
movl   32(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  64],mem64[input_3 +  64],mem64[input_3 +  64],mem64[input_3 +  64]
# asm 1: vbroadcastsd 64(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 64(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 64(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 36)
# asm 1: movl   36(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   36(<input_2=%rdx),>pos=%r9d
movl   36(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  72],mem64[input_3 +  72],mem64[input_3 +  72],mem64[input_3 +  72]
# asm 1: vbroadcastsd 72(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 72(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 72(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 40)
# asm 1: movl   40(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   40(<input_2=%rdx),>pos=%r9d
movl   40(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  80],mem64[input_3 +  80],mem64[input_3 +  80],mem64[input_3 +  80]
# asm 1: vbroadcastsd 80(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 80(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 80(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 44)
# asm 1: movl   44(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   44(<input_2=%rdx),>pos=%r9d
movl   44(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  88],mem64[input_3 +  88],mem64[input_3 +  88],mem64[input_3 +  88]
# asm 1: vbroadcastsd 88(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 88(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 88(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 48)
# asm 1: movl   48(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   48(<input_2=%rdx),>pos=%r9d
movl   48(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  96],mem64[input_3 +  96],mem64[input_3 +  96],mem64[input_3 +  96]
# asm 1: vbroadcastsd 96(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 96(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 96(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 52)
# asm 1: movl   52(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   52(<input_2=%rdx),>pos=%r9d
movl   52(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  104],mem64[input_3 +  104],mem64[input_3 +  104],mem64[input_3 +  104]
# asm 1: vbroadcastsd 104(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 104(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 104(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 56)
# asm 1: movl   56(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   56(<input_2=%rdx),>pos=%r9d
movl   56(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  112],mem64[input_3 +  112],mem64[input_3 +  112],mem64[input_3 +  112]
# asm 1: vbroadcastsd 112(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 112(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 112(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 60)
# asm 1: movl   60(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   60(<input_2=%rdx),>pos=%r9d
movl   60(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  120],mem64[input_3 +  120],mem64[input_3 +  120],mem64[input_3 +  120]
# asm 1: vbroadcastsd 120(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 120(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 120(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 64)
# asm 1: movl   64(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   64(<input_2=%rdx),>pos=%r9d
movl   64(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  128],mem64[input_3 +  128],mem64[input_3 +  128],mem64[input_3 +  128]
# asm 1: vbroadcastsd 128(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 128(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 128(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 68)
# asm 1: movl   68(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   68(<input_2=%rdx),>pos=%r9d
movl   68(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  136],mem64[input_3 +  136],mem64[input_3 +  136],mem64[input_3 +  136]
# asm 1: vbroadcastsd 136(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 136(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 136(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 72)
# asm 1: movl   72(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   72(<input_2=%rdx),>pos=%r9d
movl   72(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  144],mem64[input_3 +  144],mem64[input_3 +  144],mem64[input_3 +  144]
# asm 1: vbroadcastsd 144(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 144(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 144(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 76)
# asm 1: movl   76(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   76(<input_2=%rdx),>pos=%r9d
movl   76(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  152],mem64[input_3 +  152],mem64[input_3 +  152],mem64[input_3 +  152]
# asm 1: vbroadcastsd 152(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 152(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 152(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 80)
# asm 1: movl   80(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   80(<input_2=%rdx),>pos=%r9d
movl   80(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  160],mem64[input_3 +  160],mem64[input_3 +  160],mem64[input_3 +  160]
# asm 1: vbroadcastsd 160(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 160(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 160(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 84)
# asm 1: movl   84(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   84(<input_2=%rdx),>pos=%r9d
movl   84(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  168],mem64[input_3 +  168],mem64[input_3 +  168],mem64[input_3 +  168]
# asm 1: vbroadcastsd 168(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 168(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 168(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 88)
# asm 1: movl   88(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   88(<input_2=%rdx),>pos=%r9d
movl   88(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  176],mem64[input_3 +  176],mem64[input_3 +  176],mem64[input_3 +  176]
# asm 1: vbroadcastsd 176(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 176(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 176(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 92)
# asm 1: movl   92(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   92(<input_2=%rdx),>pos=%r9d
movl   92(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  184],mem64[input_3 +  184],mem64[input_3 +  184],mem64[input_3 +  184]
# asm 1: vbroadcastsd 184(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 184(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 184(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 96)
# asm 1: movl   96(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   96(<input_2=%rdx),>pos=%r9d
movl   96(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  192],mem64[input_3 +  192],mem64[input_3 +  192],mem64[input_3 +  192]
# asm 1: vbroadcastsd 192(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 192(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 192(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 100)
# asm 1: movl   100(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   100(<input_2=%rdx),>pos=%r9d
movl   100(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  200],mem64[input_3 +  200],mem64[input_3 +  200],mem64[input_3 +  200]
# asm 1: vbroadcastsd 200(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 200(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 200(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 104)
# asm 1: movl   104(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   104(<input_2=%rdx),>pos=%r9d
movl   104(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  208],mem64[input_3 +  208],mem64[input_3 +  208],mem64[input_3 +  208]
# asm 1: vbroadcastsd 208(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 208(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 208(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 108)
# asm 1: movl   108(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   108(<input_2=%rdx),>pos=%r9d
movl   108(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  216],mem64[input_3 +  216],mem64[input_3 +  216],mem64[input_3 +  216]
# asm 1: vbroadcastsd 216(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 216(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 216(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 112)
# asm 1: movl   112(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   112(<input_2=%rdx),>pos=%r9d
movl   112(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  224],mem64[input_3 +  224],mem64[input_3 +  224],mem64[input_3 +  224]
# asm 1: vbroadcastsd 224(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 224(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 224(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 116)
# asm 1: movl   116(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   116(<input_2=%rdx),>pos=%r9d
movl   116(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  232],mem64[input_3 +  232],mem64[input_3 +  232],mem64[input_3 +  232]
# asm 1: vbroadcastsd 232(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 232(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 232(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 120)
# asm 1: movl   120(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   120(<input_2=%rdx),>pos=%r9d
movl   120(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  240],mem64[input_3 +  240],mem64[input_3 +  240],mem64[input_3 +  240]
# asm 1: vbroadcastsd 240(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 240(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 240(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 124)
# asm 1: movl   124(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   124(<input_2=%rdx),>pos=%r9d
movl   124(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  248],mem64[input_3 +  248],mem64[input_3 +  248],mem64[input_3 +  248]
# asm 1: vbroadcastsd 248(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 248(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 248(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 128)
# asm 1: movl   128(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   128(<input_2=%rdx),>pos=%r9d
movl   128(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  256],mem64[input_3 +  256],mem64[input_3 +  256],mem64[input_3 +  256]
# asm 1: vbroadcastsd 256(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 256(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 256(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 132)
# asm 1: movl   132(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   132(<input_2=%rdx),>pos=%r9d
movl   132(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  264],mem64[input_3 +  264],mem64[input_3 +  264],mem64[input_3 +  264]
# asm 1: vbroadcastsd 264(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 264(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 264(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 136)
# asm 1: movl   136(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   136(<input_2=%rdx),>pos=%r9d
movl   136(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  272],mem64[input_3 +  272],mem64[input_3 +  272],mem64[input_3 +  272]
# asm 1: vbroadcastsd 272(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 272(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 272(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 140)
# asm 1: movl   140(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   140(<input_2=%rdx),>pos=%r9d
movl   140(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  280],mem64[input_3 +  280],mem64[input_3 +  280],mem64[input_3 +  280]
# asm 1: vbroadcastsd 280(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 280(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 280(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 144)
# asm 1: movl   144(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   144(<input_2=%rdx),>pos=%r9d
movl   144(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  288],mem64[input_3 +  288],mem64[input_3 +  288],mem64[input_3 +  288]
# asm 1: vbroadcastsd 288(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 288(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 288(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 148)
# asm 1: movl   148(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   148(<input_2=%rdx),>pos=%r9d
movl   148(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  296],mem64[input_3 +  296],mem64[input_3 +  296],mem64[input_3 +  296]
# asm 1: vbroadcastsd 296(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 296(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 296(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 152)
# asm 1: movl   152(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   152(<input_2=%rdx),>pos=%r9d
movl   152(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  304],mem64[input_3 +  304],mem64[input_3 +  304],mem64[input_3 +  304]
# asm 1: vbroadcastsd 304(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 304(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 304(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 156)
# asm 1: movl   156(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   156(<input_2=%rdx),>pos=%r9d
movl   156(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  312],mem64[input_3 +  312],mem64[input_3 +  312],mem64[input_3 +  312]
# asm 1: vbroadcastsd 312(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 312(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 312(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 160)
# asm 1: movl   160(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   160(<input_2=%rdx),>pos=%r9d
movl   160(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  320],mem64[input_3 +  320],mem64[input_3 +  320],mem64[input_3 +  320]
# asm 1: vbroadcastsd 320(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 320(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 320(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 164)
# asm 1: movl   164(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   164(<input_2=%rdx),>pos=%r9d
movl   164(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  328],mem64[input_3 +  328],mem64[input_3 +  328],mem64[input_3 +  328]
# asm 1: vbroadcastsd 328(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 328(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 328(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 168)
# asm 1: movl   168(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   168(<input_2=%rdx),>pos=%r9d
movl   168(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  336],mem64[input_3 +  336],mem64[input_3 +  336],mem64[input_3 +  336]
# asm 1: vbroadcastsd 336(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 336(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 336(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: pos = *(uint32 *)(input_2 + 172)
# asm 1: movl   172(<input_2=int64#3),>pos=int64#6d
# asm 2: movl   172(<input_2=%rdx),>pos=%r9d
movl   172(%rdx),%r9d

# qhasm: pos *= 3968
# asm 1: imulq  $3968,<pos=int64#6,>pos=int64#6
# asm 2: imulq  $3968,<pos=%r9,>pos=%r9
imulq  $3968,%r9,%r9

# qhasm: pos += input_1
# asm 1: add  <input_1=int64#2,<pos=int64#6
# asm 2: add  <input_1=%rsi,<pos=%r9
add  %rsi,%r9

# qhasm: sign = mem64[input_3 +  344],mem64[input_3 +  344],mem64[input_3 +  344],mem64[input_3 +  344]
# asm 1: vbroadcastsd 344(<input_3=int64#4),>sign=reg256#5
# asm 2: vbroadcastsd 344(<input_3=%rcx),>sign=%ymm4
vbroadcastsd 344(%rcx),%ymm4

# qhasm: v0 = (4x double)(4x int32)mem128[pos +  0]
# asm 1: vcvtdq2pd 0(<pos=int64#6),>v0=reg256#6
# asm 2: vcvtdq2pd 0(<pos=%r9),>v0=%ymm5
vcvtdq2pd 0(%r9),%ymm5

# qhasm: v1 = (4x double)(4x int32)mem128[pos +  16]
# asm 1: vcvtdq2pd 16(<pos=int64#6),>v1=reg256#7
# asm 2: vcvtdq2pd 16(<pos=%r9),>v1=%ymm6
vcvtdq2pd 16(%r9),%ymm6

# qhasm: v2 = (4x double)(4x int32)mem128[pos +  32]
# asm 1: vcvtdq2pd 32(<pos=int64#6),>v2=reg256#8
# asm 2: vcvtdq2pd 32(<pos=%r9),>v2=%ymm7
vcvtdq2pd 32(%r9),%ymm7

# qhasm: v3 = (4x double)(4x int32)mem128[pos +  48]
# asm 1: vcvtdq2pd 48(<pos=int64#6),>v3=reg256#9
# asm 2: vcvtdq2pd 48(<pos=%r9),>v3=%ymm8
vcvtdq2pd 48(%r9),%ymm8

# qhasm: 4x r0 approx -= v0 * sign
# asm 1: vfnmadd231pd <v0=reg256#6,<sign=reg256#5,<r0=reg256#1
# asm 2: vfnmadd231pd <v0=%ymm5,<sign=%ymm4,<r0=%ymm0
vfnmadd231pd %ymm5,%ymm4,%ymm0

# qhasm: 4x r1 approx -= v1 * sign
# asm 1: vfnmadd231pd <v1=reg256#7,<sign=reg256#5,<r1=reg256#2
# asm 2: vfnmadd231pd <v1=%ymm6,<sign=%ymm4,<r1=%ymm1
vfnmadd231pd %ymm6,%ymm4,%ymm1

# qhasm: 4x r2 approx -= v2 * sign
# asm 1: vfnmadd231pd <v2=reg256#8,<sign=reg256#5,<r2=reg256#3
# asm 2: vfnmadd231pd <v2=%ymm7,<sign=%ymm4,<r2=%ymm2
vfnmadd231pd %ymm7,%ymm4,%ymm2

# qhasm: 4x r3 approx -= v3 * sign
# asm 1: vfnmadd231pd <v3=reg256#9,<sign=reg256#5,<r3=reg256#4
# asm 2: vfnmadd231pd <v3=%ymm8,<sign=%ymm4,<r3=%ymm3
vfnmadd231pd %ymm8,%ymm4,%ymm3

# qhasm: 4x c0 = approx r0 * mem256[qinv4x]
# asm 1: vmulpd qinv4x,<r0=reg256#1,>c0=reg256#5
# asm 2: vmulpd qinv4x,<r0=%ymm0,>c0=%ymm4
vmulpd qinv4x,%ymm0,%ymm4

# qhasm: 4x c0 = round(c0)
# asm 1: vroundpd $8,<c0=reg256#5,>c0=reg256#5
# asm 2: vroundpd $8,<c0=%ymm4,>c0=%ymm4
vroundpd $8,%ymm4,%ymm4

# qhasm: 4x c0 approx*= mem256[q4x]
# asm 1: vmulpd q4x,<c0=reg256#5,>c0=reg256#5
# asm 2: vmulpd q4x,<c0=%ymm4,>c0=%ymm4
vmulpd q4x,%ymm4,%ymm4

# qhasm: 4x r0 approx -= c0
# asm 1: vsubpd <c0=reg256#5,<r0=reg256#1,>r0=reg256#1
# asm 2: vsubpd <c0=%ymm4,<r0=%ymm0,>r0=%ymm0
vsubpd %ymm4,%ymm0,%ymm0

# qhasm: 4x c1 = approx r1 * mem256[qinv4x]
# asm 1: vmulpd qinv4x,<r1=reg256#2,>c1=reg256#5
# asm 2: vmulpd qinv4x,<r1=%ymm1,>c1=%ymm4
vmulpd qinv4x,%ymm1,%ymm4

# qhasm: 4x c1 = round(c1)
# asm 1: vroundpd $8,<c1=reg256#5,>c1=reg256#5
# asm 2: vroundpd $8,<c1=%ymm4,>c1=%ymm4
vroundpd $8,%ymm4,%ymm4

# qhasm: 4x c1 approx*= mem256[q4x]
# asm 1: vmulpd q4x,<c1=reg256#5,>c1=reg256#5
# asm 2: vmulpd q4x,<c1=%ymm4,>c1=%ymm4
vmulpd q4x,%ymm4,%ymm4

# qhasm: 4x r1 approx -= c1
# asm 1: vsubpd <c1=reg256#5,<r1=reg256#2,>r1=reg256#2
# asm 2: vsubpd <c1=%ymm4,<r1=%ymm1,>r1=%ymm1
vsubpd %ymm4,%ymm1,%ymm1

# qhasm: 4x c2 = approx r2 * mem256[qinv4x]
# asm 1: vmulpd qinv4x,<r2=reg256#3,>c2=reg256#5
# asm 2: vmulpd qinv4x,<r2=%ymm2,>c2=%ymm4
vmulpd qinv4x,%ymm2,%ymm4

# qhasm: 4x c2 = round(c2)
# asm 1: vroundpd $8,<c2=reg256#5,>c2=reg256#5
# asm 2: vroundpd $8,<c2=%ymm4,>c2=%ymm4
vroundpd $8,%ymm4,%ymm4

# qhasm: 4x c2 approx*= mem256[q4x]
# asm 1: vmulpd q4x,<c2=reg256#5,>c2=reg256#5
# asm 2: vmulpd q4x,<c2=%ymm4,>c2=%ymm4
vmulpd q4x,%ymm4,%ymm4

# qhasm: 4x r2 approx -= c2
# asm 1: vsubpd <c2=reg256#5,<r2=reg256#3,>r2=reg256#3
# asm 2: vsubpd <c2=%ymm4,<r2=%ymm2,>r2=%ymm2
vsubpd %ymm4,%ymm2,%ymm2

# qhasm: 4x c3 = approx r3 * mem256[qinv4x]
# asm 1: vmulpd qinv4x,<r3=reg256#4,>c3=reg256#5
# asm 2: vmulpd qinv4x,<r3=%ymm3,>c3=%ymm4
vmulpd qinv4x,%ymm3,%ymm4

# qhasm: 4x c3 = round(c3)
# asm 1: vroundpd $8,<c3=reg256#5,>c3=reg256#5
# asm 2: vroundpd $8,<c3=%ymm4,>c3=%ymm4
vroundpd $8,%ymm4,%ymm4

# qhasm: 4x c3 approx*= mem256[q4x]
# asm 1: vmulpd q4x,<c3=reg256#5,>c3=reg256#5
# asm 2: vmulpd q4x,<c3=%ymm4,>c3=%ymm4
vmulpd q4x,%ymm4,%ymm4

# qhasm: 4x r3 approx -= c3
# asm 1: vsubpd <c3=reg256#5,<r3=reg256#4,>r3=reg256#4
# asm 2: vsubpd <c3=%ymm4,<r3=%ymm3,>r3=%ymm3
vsubpd %ymm4,%ymm3,%ymm3

# qhasm: mem256[input_0 +   0] = r0
# asm 1: vmovupd   <r0=reg256#1,0(<input_0=int64#1)
# asm 2: vmovupd   <r0=%ymm0,0(<input_0=%rdi)
vmovupd   %ymm0,0(%rdi)

# qhasm: mem256[input_0 +   32] = r1
# asm 1: vmovupd   <r1=reg256#2,32(<input_0=int64#1)
# asm 2: vmovupd   <r1=%ymm1,32(<input_0=%rdi)
vmovupd   %ymm1,32(%rdi)

# qhasm: mem256[input_0 +   64] = r2
# asm 1: vmovupd   <r2=reg256#3,64(<input_0=int64#1)
# asm 2: vmovupd   <r2=%ymm2,64(<input_0=%rdi)
vmovupd   %ymm2,64(%rdi)

# qhasm: mem256[input_0 +   96] = r3
# asm 1: vmovupd   <r3=reg256#4,96(<input_0=int64#1)
# asm 2: vmovupd   <r3=%ymm3,96(<input_0=%rdi)
vmovupd   %ymm3,96(%rdi)

# qhasm: input_0 += 128
# asm 1: add  $128,<input_0=int64#1
# asm 2: add  $128,<input_0=%rdi
add  $128,%rdi

# qhasm: input_1 += 64
# asm 1: add  $64,<input_1=int64#2
# asm 2: add  $64,<input_1=%rsi
add  $64,%rsi

# qhasm: unsigned>? ctri -= 1
# asm 1: sub  $1,<ctri=int64#5
# asm 2: sub  $1,<ctri=%r8
sub  $1,%r8
# comment:fp stack unchanged by jump

# qhasm: goto ilooptop if unsigned>
ja ._ilooptop

# qhasm: return
add %r11,%rsp
ret
