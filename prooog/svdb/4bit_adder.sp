* SPICE NETLIST
***************************************

.SUBCKT pmos25x_Auto_5_1 B S D G
** N=5 EP=4 IP=0 FDC=1
M0 D G S B PMOS25 L=2.5e-07 W=2e-06 AD=1.3e-12 AS=1.3e-12 PD=5.3e-06 PS=5.3e-06 $X=0 $Y=0 $D=2
.ENDS
***************************************
.SUBCKT inverter Gnd Out Vdd In
** N=4 EP=4 IP=5 FDC=2
M0 Out In Gnd Gnd NMOS25 L=2.5e-07 W=1e-06 AD=6.5e-13 AS=6.5e-13 PD=3.3e-06 PS=3.3e-06 $X=-295 $Y=-1470 $D=1
X1 Vdd Vdd Out In pmos25x_Auto_5_1 $T=-295 1105 0 0 $X=-2745 $Y=355
.ENDS
***************************************
.SUBCKT pmos25x_Auto_7_1 B S D G
** N=5 EP=4 IP=0 FDC=1
M0 D G S B PMOS25 L=2.5e-07 W=5e-07 AD=4.025e-13 AS=4.025e-13 PD=2.6e-06 PS=2.6e-06 $X=0 $Y=0 $D=2
.ENDS
***************************************
.SUBCKT nmos25x_Auto_6_1 S D B G
** N=4 EP=4 IP=0 FDC=1
M0 D G S B NMOS25 L=2.5e-07 W=5e-07 AD=4.025e-13 AS=4.025e-13 PD=2.6e-06 PS=2.6e-06 $X=0 $Y=0 $D=1
.ENDS
***************************************
.SUBCKT DPL_xor Gnd Vdd A B out_xor
** N=7 EP=5 IP=26 FDC=8
X0 Gnd 7 Vdd A inverter $T=-7575 9840 1 0 $X=-10320 $Y=5985
X1 Gnd 6 Vdd B inverter $T=-7540 70 0 0 $X=-10285 $Y=-1700
X2 Vdd out_xor A B pmos25x_Auto_7_1 $T=-3670 6775 1 180 $X=-5420 $Y=5975
X3 Vdd out_xor 7 6 pmos25x_Auto_7_1 $T=-3635 2680 1 180 $X=-5385 $Y=1880
X4 6 out_xor Gnd A nmos25x_Auto_6_1 $T=-2870 10755 0 0 $X=-4920 $Y=10455
X5 B out_xor Gnd 7 nmos25x_Auto_6_1 $T=-2835 -1340 0 0 $X=-4885 $Y=-1640
.ENDS
***************************************
.SUBCKT nmos25x_Auto_8_1 S D B G
** N=4 EP=4 IP=0 FDC=1
M0 D G S B NMOS25 L=2.5e-07 W=1.5e-06 AD=9.75e-13 AS=9.75e-13 PD=4.3e-06 PS=4.3e-06 $X=0 $Y=0 $D=1
.ENDS
***************************************
.SUBCKT nmos25x_Auto_4_1 S D B G
** N=4 EP=4 IP=0 FDC=1
M0 D G S B NMOS25 L=2.5e-07 W=2e-06 AD=1.3e-12 AS=1.3e-12 PD=5.3e-06 PS=5.3e-06 $X=0 $Y=0 $D=1
.ENDS
***************************************
.SUBCKT cmos_nand Gnd Vdd out_nand A B
** N=6 EP=5 IP=18 FDC=4
X0 Vdd Vdd out_nand A pmos25x_Auto_5_1 $T=3055 5255 0 0 $X=605 $Y=4505
X1 Vdd Vdd out_nand B pmos25x_Auto_5_1 $T=8055 5255 0 0 $X=5605 $Y=4505
X2 Gnd 6 Gnd B nmos25x_Auto_4_1 $T=5230 -3220 0 0 $X=3280 $Y=-3520
X3 6 out_nand Gnd A nmos25x_Auto_4_1 $T=5230 1050 0 0 $X=3280 $Y=750
.ENDS
***************************************
.SUBCKT falladderdd Gnd Vdd sum cout A B cin
** N=10 EP=7 IP=25 FDC=28
X0 Gnd Vdd A B 9 DPL_xor $T=6725 27520 0 0 $X=-4490 $Y=24265
X1 Gnd Vdd 9 cin sum DPL_xor $T=21620 27520 0 0 $X=10405 $Y=24265
X2 Gnd Vdd 8 A B cmos_nand $T=-5735 14055 0 0 $X=-5130 $Y=10535
X3 Gnd Vdd 10 cin 9 cmos_nand $T=6260 14055 0 0 $X=6865 $Y=10535
X4 Gnd Vdd cout 10 8 cmos_nand $T=17335 14055 0 0 $X=17940 $Y=10535
.ENDS
***************************************
.SUBCKT 4bit_adder Vdd A0 Gnd S0 C4 B0 A1 B1 A2 B2 A3 B3 S1 S2 S3
** N=19 EP=15 IP=38 FDC=97
M0 A0 5 2 Vdd PMOS25 L=2.5e-07 W=1.5e-06 AD=9.75e-13 AS=9.75e-13 PD=4.3e-06 PS=4.3e-06 $X=8125 $Y=5115 $D=2
X1 Gnd 5 Vdd B0 inverter $T=3550 2615 0 0 $X=805 $Y=845
X2 Gnd Vdd A0 B0 S0 DPL_xor $T=12020 14465 0 0 $X=805 $Y=11210
X3 A0 2 Gnd B0 nmos25x_Auto_8_1 $T=5520 9560 1 90 $X=5220 $Y=7610
X4 Gnd 2 Gnd 5 nmos25x_Auto_8_1 $T=8100 -30 0 270 $X=7800 $Y=-1180
X5 Gnd Vdd S1 6 A1 B1 2 falladderdd $T=20655 -9910 0 0 $X=15525 $Y=-770
X6 Gnd Vdd S2 7 A2 B2 6 falladderdd $T=54160 -11060 0 0 $X=49030 $Y=-1920
X7 Gnd Vdd S3 C4 A3 B3 7 falladderdd $T=88080 -11975 0 0 $X=82950 $Y=-2835
.ENDS
***************************************
