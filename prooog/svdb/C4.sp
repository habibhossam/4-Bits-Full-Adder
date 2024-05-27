* SPICE NETLIST
***************************************

.SUBCKT pmos25x_Auto_3_1 B S D G
** N=5 EP=4 IP=0 FDC=1
M0 D G S B PMOS25 L=2.5e-07 W=1.25e-06 AD=8.125e-13 AS=8.125e-13 PD=3.8e-06 PS=3.8e-06 $X=0 $Y=0 $D=2
.ENDS
***************************************
.SUBCKT nmos25x_Auto_2_1 S D B G
** N=4 EP=4 IP=0 FDC=1
M0 D G S B NMOS25 L=2.5e-07 W=7.5e-07 AD=4.875e-13 AS=4.875e-13 PD=2.8e-06 PS=2.8e-06 $X=0 $Y=0 $D=1
.ENDS
***************************************
.SUBCKT inverter Vdd Gnd Out In
** N=4 EP=4 IP=0 FDC=2
M0 Out In Gnd Gnd NMOS25 L=2.5e-07 W=1e-06 AD=6.5e-13 AS=6.5e-13 PD=3.3e-06 PS=3.3e-06 $X=-295 $Y=-1470 $D=1
M1 Out In Vdd Vdd PMOS25 L=2.5e-07 W=2e-06 AD=1.3e-12 AS=1.3e-12 PD=5.3e-06 PS=5.3e-06 $X=-295 $Y=1105 $D=2
.ENDS
***************************************
.SUBCKT or_with_inverter Gnd Vdd out_or A B
** N=7 EP=5 IP=22 FDC=6
X0 Vdd 6 7 A pmos25x_Auto_3_1 $T=4490 425 0 0 $X=2040 $Y=-325
X1 Vdd Vdd 6 B pmos25x_Auto_3_1 $T=4490 4420 0 0 $X=2040 $Y=3670
X2 Gnd 7 Gnd A nmos25x_Auto_2_1 $T=4015 -3510 0 90 $X=2965 $Y=-5460
X3 Gnd 7 Gnd B nmos25x_Auto_2_1 $T=8250 -3510 0 90 $X=7200 $Y=-5460
X4 Vdd Gnd out_or 7 inverter $T=10070 85 0 0 $X=7325 $Y=-1685
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
.SUBCKT C4 Gnd A0 A1 Vdd A3 A2 B1 B3 C4 B0 B2 C0
** N=27 EP=12 IP=80 FDC=88
X0 Gnd Vdd 4 A0 B0 or_with_inverter $T=-915 53660 0 0 $X=1125 $Y=48200
X1 Gnd Vdd 10 A1 B1 or_with_inverter $T=11765 36680 0 0 $X=13805 $Y=31220
X2 Gnd Vdd 12 A3 B3 or_with_inverter $T=12625 1860 0 0 $X=14665 $Y=-3600
X3 Gnd Vdd 13 A2 B2 or_with_inverter $T=13195 17285 0 0 $X=15235 $Y=11825
X4 Gnd Vdd 17 11 15 or_with_inverter $T=24590 53660 0 0 $X=26630 $Y=48200
X5 Gnd Vdd 22 16 19 or_with_inverter $T=36725 36605 0 0 $X=38765 $Y=31145
X6 Gnd Vdd C4 18 20 or_with_inverter $T=37030 1860 0 0 $X=39070 $Y=-3600
X7 Gnd Vdd 14 21 23 or_with_inverter $T=41330 17285 0 0 $X=43370 $Y=11825
X8 Vdd 15 A0 Gnd B0 TG_hf_AND $T=3755 39170 0 0 $X=-690 $Y=35810
X9 Vdd 23 A2 Gnd B2 TG_hf_AND $T=4070 13780 0 0 $X=-375 $Y=10420
X10 Vdd 19 A1 Gnd B1 TG_hf_AND $T=4085 26330 0 0 $X=-360 $Y=22970
X11 Vdd 20 A3 Gnd B3 TG_hf_AND $T=4145 -210 0 0 $X=-300 $Y=-3570
X12 Vdd 11 4 Gnd C0 TG_hf_AND $T=16780 49785 0 0 $X=12335 $Y=46425
X13 Vdd 16 10 Gnd 17 TG_hf_AND $T=28790 34480 0 0 $X=24345 $Y=31120
X14 Vdd 18 12 Gnd 14 TG_hf_AND $T=29540 -240 0 0 $X=25095 $Y=-3600
X15 Vdd 21 13 Gnd 22 TG_hf_AND $T=31710 15265 0 0 $X=27265 $Y=11905
.ENDS
***************************************
