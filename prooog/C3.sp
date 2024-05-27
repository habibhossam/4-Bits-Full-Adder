* SPICE NETLIST
***************************************

.SUBCKT inverter Vdd Gnd Out In
** N=4 EP=4 IP=0 FDC=2
M0 Out In Gnd Gnd NMOS25 L=2.5e-07 W=1e-06 $X=-295 $Y=-1470 $D=1
M1 Out In Vdd Vdd PMOS25 L=2.5e-07 W=2e-06 $X=-295 $Y=1105 $D=2
.ENDS
***************************************
.SUBCKT nmos25x_Auto_4_1 S D B G
** N=4 EP=4 IP=0 FDC=1
M0 D G S B NMOS25 L=2.5e-07 W=1.5e-06 $X=0 $Y=0 $D=1
.ENDS
***************************************
.SUBCKT TG_hf_AND Vdd out_and A Gnd B
** N=6 EP=5 IP=12 FDC=5
M0 A 6 out_and Vdd PMOS25 L=2.5e-07 W=1.5e-06 $X=2875 $Y=2935 $D=2
X1 Vdd Gnd 6 B inverter $T=-1700 435 0 0 $X=-4445 $Y=-1335
X2 A out_and Gnd B nmos25x_Auto_4_1 $T=270 7380 1 90 $X=-30 $Y=5430
X3 Gnd out_and Gnd 6 nmos25x_Auto_4_1 $T=2850 -2210 0 270 $X=2550 $Y=-3360
.ENDS
***************************************
.SUBCKT pmos25x_Auto_3_1 B S D G
** N=5 EP=4 IP=0 FDC=1
M0 D G S B PMOS25 L=2.5e-07 W=1.25e-06 $X=0 $Y=0 $D=2
.ENDS
***************************************
.SUBCKT nmos25x_Auto_2_1 S D B G
** N=4 EP=4 IP=0 FDC=1
M0 D G S B NMOS25 L=2.5e-07 W=7.5e-07 $X=0 $Y=0 $D=1
.ENDS
***************************************
.SUBCKT or_with_inverter Gnd Vdd out_or A B
** N=7 EP=5 IP=22 FDC=6
X0 Vdd Gnd out_or 7 inverter $T=10070 85 0 0 $X=7325 $Y=-1685
X1 Vdd 6 7 A pmos25x_Auto_3_1 $T=4490 425 0 0 $X=2040 $Y=-325
X2 Vdd Vdd 6 B pmos25x_Auto_3_1 $T=4490 4420 0 0 $X=2040 $Y=3670
X3 Gnd 7 Gnd A nmos25x_Auto_2_1 $T=4015 -3510 0 90 $X=2965 $Y=-5460
X4 Gnd 7 Gnd B nmos25x_Auto_2_1 $T=8250 -3510 0 90 $X=7200 $Y=-5460
.ENDS
***************************************
.SUBCKT C3 Gnd A0 A1 Vdd A2 B1 C3 B0 B2 C0
** N=21 EP=10 IP=60 FDC=66
X0 Vdd 5 A0 Gnd B0 TG_hf_AND $T=-2845 49875 0 0 $X=-7290 $Y=46515
X1 Vdd 17 A2 Gnd B2 TG_hf_AND $T=-2530 24485 0 0 $X=-6975 $Y=21125
X2 Vdd 6 A1 Gnd B1 TG_hf_AND $T=-2515 37035 0 0 $X=-6960 $Y=33675
X3 Vdd 11 4 Gnd C0 TG_hf_AND $T=10180 60490 0 0 $X=5735 $Y=57130
X4 Vdd 13 10 Gnd 14 TG_hf_AND $T=22190 45185 0 0 $X=17745 $Y=41825
X5 Vdd 15 12 Gnd 16 TG_hf_AND $T=25110 25970 0 0 $X=20665 $Y=22610
X6 Gnd Vdd 4 A0 B0 or_with_inverter $T=-7515 64365 0 0 $X=-5475 $Y=58905
X7 Gnd Vdd 10 A1 B1 or_with_inverter $T=5165 47385 0 0 $X=7205 $Y=41925
X8 Gnd Vdd 12 A2 B2 or_with_inverter $T=6595 27990 0 0 $X=8635 $Y=22530
X9 Gnd Vdd 14 11 5 or_with_inverter $T=17990 64365 0 0 $X=20030 $Y=58905
X10 Gnd Vdd 16 13 6 or_with_inverter $T=30125 47310 0 0 $X=32165 $Y=41850
X11 Gnd Vdd C3 15 17 or_with_inverter $T=34730 27990 0 0 $X=36770 $Y=22530
.ENDS
***************************************
