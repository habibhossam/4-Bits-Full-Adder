* SPICE NETLIST
***************************************

.SUBCKT pmos25x_Auto_9_1 B S D G
** N=5 EP=4 IP=0 FDC=1
M0 D G S B PMOS25 L=2.5e-07 W=1.25e-06 $X=0 $Y=0 $D=2
.ENDS
***************************************
.SUBCKT nmos25x_Auto_8_1 S D B G
** N=4 EP=4 IP=0 FDC=1
M0 D G S B NMOS25 L=2.5e-07 W=7.5e-07 $X=0 $Y=0 $D=1
.ENDS
***************************************
.SUBCKT inverter Vdd Gnd Out In
** N=4 EP=4 IP=0 FDC=2
M0 Out In Gnd Gnd NMOS25 L=2.5e-07 W=1e-06 $X=-295 $Y=-1470 $D=1
M1 Out In Vdd Vdd PMOS25 L=2.5e-07 W=2e-06 $X=-295 $Y=1105 $D=2
.ENDS
***************************************
.SUBCKT or_with_inverter Gnd Vdd out_or A B
** N=7 EP=5 IP=22 FDC=6
X0 Vdd 6 7 A pmos25x_Auto_9_1 $T=4490 425 0 0 $X=2040 $Y=-325
X1 Vdd Vdd 6 B pmos25x_Auto_9_1 $T=4490 4420 0 0 $X=2040 $Y=3670
X2 Gnd 7 Gnd A nmos25x_Auto_8_1 $T=4015 -3510 0 90 $X=2965 $Y=-5460
X3 Gnd 7 Gnd B nmos25x_Auto_8_1 $T=8250 -3510 0 90 $X=7200 $Y=-5460
X4 Vdd Gnd out_or 7 inverter $T=10070 85 0 0 $X=7325 $Y=-1685
.ENDS
***************************************
.SUBCKT nmos25x_Auto_10_1 S D B G
** N=4 EP=4 IP=0 FDC=1
M0 D G S B NMOS25 L=2.5e-07 W=1.5e-06 $X=0 $Y=0 $D=1
.ENDS
***************************************
.SUBCKT TG_hf_AND Vdd out_and A Gnd B
** N=6 EP=5 IP=12 FDC=5
M0 A 6 out_and Vdd PMOS25 L=2.5e-07 W=1.5e-06 $X=2875 $Y=2935 $D=2
X1 Vdd Gnd 6 B inverter $T=-1700 435 0 0 $X=-4445 $Y=-1335
X2 A out_and Gnd B nmos25x_Auto_10_1 $T=270 7380 1 90 $X=-30 $Y=5430
X3 Gnd out_and Gnd 6 nmos25x_Auto_10_1 $T=2850 -2210 0 270 $X=2550 $Y=-3360
.ENDS
***************************************
.SUBCKT pmos25x_Auto_13_1 B S D G
** N=5 EP=4 IP=0 FDC=1
M0 D G S B PMOS25 L=2.5e-07 W=5e-07 $X=0 $Y=0 $D=2
.ENDS
***************************************
.SUBCKT nmos25x_Auto_12_1 S D B G
** N=4 EP=4 IP=0 FDC=1
M0 D G S B NMOS25 L=2.5e-07 W=5e-07 $X=0 $Y=0 $D=1
.ENDS
***************************************
.SUBCKT DPL_xor Gnd Vdd A B out_xor
** N=7 EP=5 IP=26 FDC=8
X0 Vdd Gnd 7 A inverter $T=-7575 9840 1 0 $X=-10320 $Y=5985
X1 Vdd Gnd 6 B inverter $T=-7540 70 0 0 $X=-10285 $Y=-1700
X2 Vdd out_xor A B pmos25x_Auto_13_1 $T=-3670 6775 1 180 $X=-5420 $Y=5975
X3 Vdd out_xor 7 6 pmos25x_Auto_13_1 $T=-3635 2680 1 180 $X=-5385 $Y=1880
X4 6 out_xor Gnd A nmos25x_Auto_12_1 $T=-2870 10755 0 0 $X=-4920 $Y=10455
X5 B out_xor Gnd 7 nmos25x_Auto_12_1 $T=-2835 -1340 0 0 $X=-4885 $Y=-1640
.ENDS
***************************************
.SUBCKT c1 Gnd A0 Vdd C1 B0 C0
** N=9 EP=6 IP=20 FDC=22
X0 Gnd Vdd 7 A0 B0 or_with_inverter $T=-1970 16105 0 0 $X=70 $Y=10645
X1 Gnd Vdd C1 8 9 or_with_inverter $T=23535 16105 0 0 $X=25575 $Y=10645
X2 Vdd 9 A0 Gnd B0 TG_hf_AND $T=2700 1615 0 0 $X=-1745 $Y=-1745
X3 Vdd 8 7 Gnd C0 TG_hf_AND $T=15725 12230 0 0 $X=11280 $Y=8870
.ENDS
***************************************
.SUBCKT C2 Gnd A1 Vdd B1 C2 B0 C0 A0
** N=12 EP=8 IP=26 FDC=44
X0 Gnd Vdd 9 A1 B1 or_with_inverter $T=20215 41110 0 0 $X=22255 $Y=35650
X1 Gnd Vdd C2 10 12 or_with_inverter $T=45175 41035 0 0 $X=47215 $Y=35575
X2 Vdd 12 A1 Gnd B1 TG_hf_AND $T=12535 30760 0 0 $X=8090 $Y=27400
X3 Vdd 10 9 Gnd 11 TG_hf_AND $T=37240 38910 0 0 $X=32795 $Y=35550
X4 Gnd A0 Vdd 11 B0 C0 c1 $T=9505 41985 0 0 $X=7760 $Y=40240
.ENDS
***************************************
.SUBCKT C3 Gnd Vdd A2 C3 B1 B2 B0 A1 C0 A0
** N=14 EP=10 IP=28 FDC=66
X0 Gnd Vdd 11 A2 B2 or_with_inverter $T=6595 27990 0 0 $X=8635 $Y=22530
X1 Gnd Vdd C3 12 14 or_with_inverter $T=34730 27990 0 0 $X=36770 $Y=22530
X2 Vdd 14 A2 Gnd B2 TG_hf_AND $T=-2530 24485 0 0 $X=-6975 $Y=21125
X3 Vdd 12 11 Gnd 13 TG_hf_AND $T=25110 25970 0 0 $X=20665 $Y=22610
X4 Gnd A1 Vdd B1 13 B0 C0 A0 C2 $T=-15050 6275 0 0 $X=-7290 $Y=33675
.ENDS
***************************************
.SUBCKT CLA_4bitadderall Gnd A0 B2 B1 B0 A1 Vdd A3 C0 B3 C1 C2 C3 C4 A2 S3 S1 S0 S2
** N=27 EP=19 IP=94 FDC=284
X0 Gnd Vdd 15 A3 B3 or_with_inverter $T=11570 5750 0 0 $X=13610 $Y=290
X1 Gnd Vdd C4 18 19 or_with_inverter $T=35975 5750 0 0 $X=38015 $Y=290
X2 Vdd 19 A3 Gnd B3 TG_hf_AND $T=3090 3680 0 0 $X=-1355 $Y=320
X3 Vdd 18 15 Gnd 16 TG_hf_AND $T=28485 3650 0 0 $X=24040 $Y=290
X4 Gnd Vdd A3 B3 8 DPL_xor $T=10340 120345 0 0 $X=-875 $Y=117090
X5 Gnd Vdd A1 B1 9 DPL_xor $T=11760 218515 0 0 $X=545 $Y=215260
X6 Gnd Vdd A0 B0 10 DPL_xor $T=11760 235380 0 0 $X=545 $Y=232125
X7 Gnd Vdd A2 B2 11 DPL_xor $T=11980 175850 0 0 $X=765 $Y=172595
X8 Gnd Vdd 8 C3 S3 DPL_xor $T=24335 120345 0 0 $X=13120 $Y=117090
X9 Gnd Vdd 9 C1 S1 DPL_xor $T=25095 218515 0 0 $X=13880 $Y=215260
X10 Gnd Vdd 10 C0 S0 DPL_xor $T=25095 235380 0 0 $X=13880 $Y=232125
X11 Gnd Vdd 11 C2 S2 DPL_xor $T=26530 175850 0 0 $X=15315 $Y=172595
X12 Gnd A0 Vdd C1 B0 C0 c1 $T=0 191005 0 0 $X=-1745 $Y=189260
X13 Gnd A1 Vdd B1 C2 B0 C0 A0 C2 $T=-9505 106355 0 0 $X=-1745 $Y=133755
X14 Gnd Vdd A2 16 B1 B2 B0 A1 C0 A0 C3 $T=5545 -6815 0 0 $X=-1745 $Y=14310
X15 Gnd Vdd A2 C3 B1 B2 B0 A1 C0 A0 C3 $T=5545 44575 0 0 $X=-1745 $Y=65700
.ENDS
***************************************
