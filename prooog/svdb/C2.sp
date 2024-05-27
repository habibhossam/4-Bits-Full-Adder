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
.SUBCKT C2 Gnd A0 A1 Vdd B1 C2 B0 C0
** N=15 EP=8 IP=40 FDC=44
X0 Vdd 5 A0 Gnd B0 TG_hf_AND $T=12205 43600 0 0 $X=7760 $Y=40240
X1 Vdd 6 A1 Gnd B1 TG_hf_AND $T=12535 30760 0 0 $X=8090 $Y=27400
X2 Vdd 10 4 Gnd C0 TG_hf_AND $T=25230 54215 0 0 $X=20785 $Y=50855
X3 Vdd 11 9 Gnd 12 TG_hf_AND $T=37240 38910 0 0 $X=32795 $Y=35550
X4 Gnd Vdd 4 A0 B0 or_with_inverter $T=7535 58090 0 0 $X=9575 $Y=52630
X5 Gnd Vdd 9 A1 B1 or_with_inverter $T=20215 41110 0 0 $X=22255 $Y=35650
X6 Gnd Vdd 12 10 5 or_with_inverter $T=33040 58090 0 0 $X=35080 $Y=52630
X7 Gnd Vdd C2 11 6 or_with_inverter $T=45175 41035 0 0 $X=47215 $Y=35575
.ENDS
***************************************
