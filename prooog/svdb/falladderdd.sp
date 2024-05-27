* SPICE NETLIST
***************************************

.SUBCKT pmos25x_Auto_1_1 B S D G
** N=5 EP=4 IP=0 FDC=1
M0 D G S B PMOS25 L=2.5e-07 W=2e-06 AD=1.3e-12 AS=1.3e-12 PD=5.3e-06 PS=5.3e-06 $X=0 $Y=0 $D=2
.ENDS
***************************************
.SUBCKT nmos25x_Auto_0_1 S D B G
** N=4 EP=4 IP=0 FDC=1
M0 D G S B NMOS25 L=2.5e-07 W=2e-06 AD=1.3e-12 AS=1.3e-12 PD=5.3e-06 PS=5.3e-06 $X=0 $Y=0 $D=1
.ENDS
***************************************
.SUBCKT cmos_nand Gnd Vdd out_nand A B
** N=6 EP=5 IP=18 FDC=4
X0 Vdd Vdd out_nand A pmos25x_Auto_1_1 $T=3055 5255 0 0 $X=605 $Y=4505
X1 Vdd Vdd out_nand B pmos25x_Auto_1_1 $T=8055 5255 0 0 $X=5605 $Y=4505
X2 Gnd 6 Gnd B nmos25x_Auto_0_1 $T=5230 -3220 0 0 $X=3280 $Y=-3520
X3 6 out_nand Gnd A nmos25x_Auto_0_1 $T=5230 1050 0 0 $X=3280 $Y=750
.ENDS
***************************************
.SUBCKT inverter Gnd Out Vdd In
** N=4 EP=4 IP=5 FDC=2
M0 Out In Gnd Gnd NMOS25 L=2.5e-07 W=1e-06 AD=6.5e-13 AS=6.5e-13 PD=3.3e-06 PS=3.3e-06 $X=-295 $Y=-1470 $D=1
X1 Vdd Vdd Out In pmos25x_Auto_1_1 $T=-295 1105 0 0 $X=-2745 $Y=355
.ENDS
***************************************
.SUBCKT pmos25x_Auto_4_1 B S D G
** N=5 EP=4 IP=0 FDC=1
M0 D G S B PMOS25 L=2.5e-07 W=5e-07 AD=4.025e-13 AS=4.025e-13 PD=2.6e-06 PS=2.6e-06 $X=0 $Y=0 $D=2
.ENDS
***************************************
.SUBCKT nmos25x_Auto_5_1 S D B G
** N=4 EP=4 IP=0 FDC=1
M0 D G S B NMOS25 L=2.5e-07 W=5e-07 AD=4.025e-13 AS=4.025e-13 PD=2.6e-06 PS=2.6e-06 $X=0 $Y=0 $D=1
.ENDS
***************************************
.SUBCKT DPL_xor Gnd Vdd A 4 out_xor
** N=7 EP=5 IP=26 FDC=8
X0 Gnd 7 Vdd A inverter $T=-7575 9840 1 0 $X=-10320 $Y=5985
X1 Gnd 6 Vdd 4 inverter $T=-7540 70 0 0 $X=-10285 $Y=-1700
X2 Vdd out_xor A 4 pmos25x_Auto_4_1 $T=-3670 6775 1 180 $X=-5420 $Y=5975
X3 Vdd out_xor 7 6 pmos25x_Auto_4_1 $T=-3635 2680 1 180 $X=-5385 $Y=1880
X4 6 out_xor Gnd A nmos25x_Auto_5_1 $T=-2870 10755 0 0 $X=-4920 $Y=10455
X5 4 out_xor Gnd 7 nmos25x_Auto_5_1 $T=-2835 -1340 0 0 $X=-4885 $Y=-1640
.ENDS
***************************************
.SUBCKT falladderdd Gnd Vdd sum A B cin cout
** N=10 EP=7 IP=25 FDC=28
X0 Gnd Vdd 3 A B cmos_nand $T=-5735 14055 0 0 $X=-5130 $Y=10535
X1 Gnd Vdd 5 cin 4 cmos_nand $T=6260 14055 0 0 $X=6865 $Y=10535
X2 Gnd Vdd cout 5 3 cmos_nand $T=17335 14055 0 0 $X=17940 $Y=10535
X3 Gnd Vdd A B 4 DPL_xor $T=6725 27520 0 0 $X=-4490 $Y=24265
X4 Gnd Vdd 4 cin sum DPL_xor $T=21620 27520 0 0 $X=10405 $Y=24265
.ENDS
***************************************
