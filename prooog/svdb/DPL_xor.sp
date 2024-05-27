* SPICE NETLIST
***************************************

.SUBCKT inverter Vdd Gnd Out In
** N=4 EP=4 IP=0 FDC=2
M0 Out In Gnd Gnd NMOS25 L=2.5e-07 W=1e-06 AD=6.5e-13 AS=6.5e-13 PD=3.3e-06 PS=3.3e-06 $X=-295 $Y=-1470 $D=1
M1 Out In Vdd Vdd PMOS25 L=2.5e-07 W=2e-06 AD=1.3e-12 AS=1.3e-12 PD=5.3e-06 PS=5.3e-06 $X=-295 $Y=1105 $D=2
.ENDS
***************************************
.SUBCKT pmos25x_Auto_6_1 B S D G
** N=5 EP=4 IP=0 FDC=1
M0 D G S B PMOS25 L=2.5e-07 W=5e-07 AD=4.025e-13 AS=4.025e-13 PD=2.6e-06 PS=2.6e-06 $X=0 $Y=0 $D=2
.ENDS
***************************************
.SUBCKT nmos25x_Auto_7_1 S D B G
** N=4 EP=4 IP=0 FDC=1
M0 D G S B NMOS25 L=2.5e-07 W=5e-07 AD=4.025e-13 AS=4.025e-13 PD=2.6e-06 PS=2.6e-06 $X=0 $Y=0 $D=1
.ENDS
***************************************
.SUBCKT DPL_xor Gnd Vdd A B out_xor
** N=7 EP=5 IP=26 FDC=8
X0 Vdd Gnd 5 A inverter $T=-7575 9840 1 0 $X=-10320 $Y=5985
X1 Vdd Gnd 3 B inverter $T=-7540 70 0 0 $X=-10285 $Y=-1700
X2 Vdd out_xor A B pmos25x_Auto_6_1 $T=-3670 6775 1 180 $X=-5420 $Y=5975
X3 Vdd out_xor 5 3 pmos25x_Auto_6_1 $T=-3635 2680 1 180 $X=-5385 $Y=1880
X4 3 out_xor Gnd A nmos25x_Auto_7_1 $T=-2870 10755 0 0 $X=-4920 $Y=10455
X5 B out_xor Gnd 5 nmos25x_Auto_7_1 $T=-2835 -1340 0 0 $X=-4885 $Y=-1640
.ENDS
***************************************
