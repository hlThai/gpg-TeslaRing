
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

# qhasm: reg256 a0

# qhasm: reg256 c

# qhasm: reg256 q

# qhasm: reg256 qinv

# qhasm: reg256 r

# qhasm: int64 ctri

# qhasm: enter compress_v
.p2align 5
.global _compress_v
.global compress_v
_compress_v:
compress_v:
mov %rsp,%r11
and $31,%r11
add $0,%r11
sub %r11,%rsp

# qhasm: ctri = 992
# asm 1: mov  $992,>ctri=int64#3
# asm 2: mov  $992,>ctri=%rdx
mov  $992,%rdx

# qhasm: qinv = mem256[qinv4x]
# asm 1: vmovupd qinv4x,>qinv=reg256#1
# asm 2: vmovupd qinv4x,>qinv=%ymm0
vmovupd qinv4x,%ymm0

# qhasm: q    = mem256[q4x]
# asm 1: vmovupd q4x,>q=reg256#2
# asm 2: vmovupd q4x,>q=%ymm1
vmovupd q4x,%ymm1

# qhasm: looptop:
._looptop:

# qhasm: a0   = mem256[input_1 +   0]
# asm 1: vmovupd   0(<input_1=int64#2),>a0=reg256#3
# asm 2: vmovupd   0(<input_1=%rsi),>a0=%ymm2
vmovupd   0(%rsi),%ymm2

# qhasm: 4x c = approx a0 * qinv
# asm 1: vmulpd <a0=reg256#3,<qinv=reg256#1,>c=reg256#4
# asm 2: vmulpd <a0=%ymm2,<qinv=%ymm0,>c=%ymm3
vmulpd %ymm2,%ymm0,%ymm3

# qhasm: 4x c = trunc(c)
# asm 1: vroundpd $11,<c=reg256#4,>c=reg256#4
# asm 2: vroundpd $11,<c=%ymm3,>c=%ymm3
vroundpd $11,%ymm3,%ymm3

# qhasm: 4x c approx*= q
# asm 1: vmulpd <q=reg256#2,<c=reg256#4,>c=reg256#4
# asm 2: vmulpd <q=%ymm1,<c=%ymm3,>c=%ymm3
vmulpd %ymm1,%ymm3,%ymm3

# qhasm: 4x a0 approx -= c
# asm 1: vsubpd <c=reg256#4,<a0=reg256#3,>a0=reg256#3
# asm 2: vsubpd <c=%ymm3,<a0=%ymm2,>a0=%ymm2
vsubpd %ymm3,%ymm2,%ymm2

# qhasm: a0 = (4x int32)(4x double)a0,0,0,0,0
# asm 1: vcvtpd2dq <a0=reg256#3,>a0=reg256#3dq
# asm 2: vcvtpd2dq <a0=%ymm2,>a0=%xmm2
vcvtpd2dq %ymm2,%xmm2

# qhasm: 8x a0 = a0 unsigned>> 24
# asm 1: vpsrld $24,<a0=reg256#3,>a0=reg256#3
# asm 2: vpsrld $24,<a0=%ymm2,>a0=%ymm2
vpsrld $24,%ymm2,%ymm2

# qhasm: mem128[input_0 + 0] = a0
# asm 1: movupd <a0=reg256#3dq,0(<input_0=int64#1)
# asm 2: movupd <a0=%xmm2,0(<input_0=%rdi)
movupd %xmm2,0(%rdi)

# qhasm: input_0 += 16
# asm 1: add  $16,<input_0=int64#1
# asm 2: add  $16,<input_0=%rdi
add  $16,%rdi

# qhasm: input_1 += 32
# asm 1: add  $32,<input_1=int64#2
# asm 2: add  $32,<input_1=%rsi
add  $32,%rsi

# qhasm: unsigned>? ctri -= 4
# asm 1: sub  $4,<ctri=int64#3
# asm 2: sub  $4,<ctri=%rdx
sub  $4,%rdx
# comment:fp stack unchanged by jump

# qhasm: goto looptop if unsigned>
ja ._looptop

# qhasm: return
add %r11,%rsp
ret
