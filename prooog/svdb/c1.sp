* SPICE NETLIST
***************************************

.SUBCKT inverter Vdd Gnd Out In
** N=4 EP=4 IP=0 FDC=2
M0 Out In Gnd Gnd NMOS25 L=2.5e-07 W=1e-06 AD=6.5e-13 AS=6.5e-13 PD=3.3e-06 PS=3.3e-06 $X=-295 $Y=-1470 $D=1
M1 Out In Vdd Vdd PMOS25 L=2.5e-07 W=2e-06 AD=1.3e-12 AS=1.3e-12 PD=5.3e-06 PS=5.3e-06 $X=-295 $Y=1105 $D=2
.ENDS
***************************************
.SUBCKT nmos25x_Auto_4_1 S D B G
** N=4 EP=4 IP=0 FDC=1
M0 D G S B NMOS25 L=2.5e-07 W=1.5e-06 AD=9.75e-13 AS=9.75e-13 PD=4.3e-06 PS=4.3e-06 $X=0 $Y=0 $D=1
.ENDS
***************************************
.SUBCKT TG_hf_AND Vdd out_and A Gnd B
** N=6 EP=5 IP=12 FDC=5
M0 A 6 out_and Vdd PMOS25 L=2.5e-07 W=1.5e-06 AD=9.75e-13 AS=9.75e-13 PD=4.3e-06 PS=4.3e-06 $X=2875 $Y=2935 $D=2
X1 Vdd Gnd 6 B inverter $T=-1700 435 0 0 $X=-4445 $Y=-1335
X2 A out_and Gnd B nmos25x_Auto_4_1 $T=270 7380 1 90 $X=-30 $Y=5430
X3 Gnd out_and Gnd 6 nmos25x_Auto_4_1 $T=2850 -2210 0 270 $X=2550 $Y=-3360
.ENDS
***************************************
.SUBCKT pmos25x_Auto_0_1 B S D G
** N=5 EP=4 IP=0 FDC=1
M0 D G S B PMOS25 L=2.5e-07 W=1.25e-06 AD=8.125e-13 AS=8.125e-13 PD=3.8e-06 PS=3.8e-06 $X=0 $Y=0 $D=2
.ENDS
***************************************
.SUBCKT nmos25x_Auto_1_1 S D B G
** N=4 EP=4 IP=0 FDC=1
M0 D G S B NMOS25 L=2.5e-07 W=7.5e-07 AD=4.875e-13 AS=4.875e-13 PD=2.8e-06 PS=2.8e-06 $X=0 $Y=0 $D=1
.ENDS
***************************************
.SUBCKT or_with_inverter Gnd Vdd out_or A B
** N=7 EP=5 IP=22 FDC=6
X0 Vdd Gnd out_or 7 inverter $T=10070 85 0 0 $X=7325 $Y=-1685
X1 Vdd 6 7 A pmos25x_Auto_0_1 $T=4490 425 0 0 $X=2040 $Y=-325
X2 Vdd Vdd 6 B pmos25x_Auto_0_1 $T=4490 4420 0 0 $X=2040 $Y=3670
X3 Gnd 7 Gnd A nmos25x_Auto_1_1 $T=4015 -3510 0 90 $X=2965 $Y=-5460
X4 Gnd 7 Gnd B nmos25x_Auto_1_1 $T=8250 -3510 0 90 $X=7200 $Y=-5460
.ENDS
***************************************
.SUBCKT c1 Gnd A0 Vdd C1 B0 C0
** N=9 EP=6 IP=20 FDC=22
X0 Vdd 4 A0 Gnd B0 TG_hf_AND $T=2700 1615 0 0 $X=-1745 $Y=-1745
X1 Vdd 6 3 Gnd C0 TG_hf_AND $T=15725 12230 0 0 $X=11280 $Y=8870
X2 Gnd Vdd 3 A0 B0 or_with_inverter $T=-1970 16105 0 0 $X=70 $Y=10645
X3 Gnd Vdd C1 6 4 or_with_inverter $T=23535 16105 0 0 $X=25575 $Y=10645
.ENDS
***************************************
