* SPICE NETLIST
***************************************

.SUBCKT inverter Vdd Gnd Out In
** N=4 EP=4 IP=0 FDC=2
M0 Out In Gnd Gnd NMOS25 L=2.5e-07 W=1e-06 AD=6.5e-13 AS=6.5e-13 PD=3.3e-06 PS=3.3e-06 $X=-295 $Y=-1470 $D=1
M1 Out In Vdd Vdd PMOS25 L=2.5e-07 W=2e-06 AD=1.3e-12 AS=1.3e-12 PD=5.3e-06 PS=5.3e-06 $X=-295 $Y=1105 $D=2
.ENDS
***************************************
.SUBCKT nmos25x_Auto_6_1 S D B G
** N=4 EP=4 IP=0 FDC=1
M0 D G S B NMOS25 L=2.5e-07 W=1.5e-06 AD=9.75e-13 AS=9.75e-13 PD=4.3e-06 PS=4.3e-06 $X=0 $Y=0 $D=1
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
.SUBCKT halfadder Vdd cout A Gnd B sum
** N=9 EP=6 IP=38 FDC=13
M0 A 6 cout Vdd PMOS25 L=2.5e-07 W=1.5e-06 AD=9.75e-13 AS=9.75e-13 PD=4.3e-06 PS=4.3e-06 $X=5575 $Y=4550 $D=2
X1 Vdd Gnd 6 B inverter $T=1000 2050 0 0 $X=-1745 $Y=280
X2 Vdd Gnd 7 A inverter $T=1895 23740 1 0 $X=-850 $Y=19885
X3 Vdd Gnd 5 B inverter $T=1930 13970 0 0 $X=-815 $Y=12200
X4 A cout Gnd B nmos25x_Auto_6_1 $T=2970 8995 1 90 $X=2670 $Y=7045
X5 Gnd cout Gnd 6 nmos25x_Auto_6_1 $T=5550 -595 0 270 $X=5250 $Y=-1745
X6 Vdd sum A B pmos25x_Auto_4_1 $T=5800 20675 1 180 $X=4050 $Y=19875
X7 Vdd sum 7 5 pmos25x_Auto_4_1 $T=5835 16580 1 180 $X=4085 $Y=15780
X8 5 sum Gnd A nmos25x_Auto_5_1 $T=6600 24655 0 0 $X=4550 $Y=24355
X9 B sum Gnd 7 nmos25x_Auto_5_1 $T=6635 12560 0 0 $X=4585 $Y=12260
.ENDS
***************************************
