* SPICE export by:      S-Edit 2022.2.3
* Export time:          Mon Dec  4 21:23:08 2023
* Design path:          /eda/Mentor/Tanner/TannerTools_v2022.2/Tutorials/prooog/lib.defs
* Library:              prooog
* Cell:                 halfadder
* Testbench:            Spice
* View:                 schematic
* Export as:            subcircuit definition
* Export mode:          hierarchical
* Exclude empty:        no
* Exclude .model:       no
* Exclude .hdl:         no
* Exclude .end:         no
* Expand paths:         no
* Wrap lines:           no
* Exclude simulator commands:  no
* Exclude global pins:         no
* Exclude instance locations:  no
* Control property name(s):    LVS SPICE

.SUBCKT NMOS25 D G S B
.ENDS
.SUBCKT PMOS25 D G S B
.ENDS
.SUBCKT NMOS33 D G S B
.ENDS
.SUBCKT PMOS33 D G S B
.ENDS

*************** Subcircuits ***************
.subckt inverter In Out Gnd Vdd 
* Library name: prooog
* Cell name: inverter
* View name: schematic
* PORT=Out TYPE=Out
* PORT=In TYPE=In
* PORT=Vdd TYPE=Other
* PORT=Gnd TYPE=Other

MMn1 Out In Gnd Gnd NMOS25 w=1u l=250n m=1 ad=650f pd=3.3u as=650f ps=3.3u nrd=650m nrs=650m mult=1 delvto=0 mulu0=1 $ $x=4300 $y=3300 $w=400 $h=600
MMp1 Out In Vdd Vdd PMOS25 w=2u l=250n m=1 ad=1.3p pd=5.3u as=1.3p ps=5.3u nrd=325m nrs=325m mult=1 delvto=0 mulu0=1 $ $x=4300 $y=4300 $w=400 $h=600
.ends

.subckt DPL_xor A B out_xor Gnd Vdd 
* Library name: prooog
* Cell name: DPL_xor
* View name: schematic
* PORT=out_xor TYPE=Out
* PORT=Vdd TYPE=Other
* PORT=A TYPE=In
* PORT=B TYPE=In
* PORT=Gnd TYPE=Other

Xinverter_1 B N_1 Gnd Vdd inverter $ $x=750 $y=1800 $w=900 $h=1800 $r=270
Xinverter_2 A N_2 Gnd Vdd inverter $ $x=650 $y=5700 $w=900 $h=1800 $r=90
MMn1 out_xor N_2 B Gnd NMOS25 w=500n l=250n m=1 ad=325f pd=2.3u as=325f ps=2.3u nrd=1.3 nrs=1.3 mult=1 delvto=0 mulu0=1 $ $x=3700 $y=3900 $w=600 $h=400 $r=90
MMn2 out_xor A N_1 Gnd NMOS25 w=500n l=250n m=1 ad=325f pd=2.3u as=325f ps=2.3u nrd=1.3 nrs=1.3 mult=1 delvto=0 mulu0=1 $ $x=3700 $y=6400 $w=600 $h=400 $r=90
MMp1 N_2 N_1 out_xor Vdd PMOS25 w=500n l=250n m=1 ad=325f pd=2.3u as=325f ps=2.3u nrd=1.3 nrs=1.3 mult=1 delvto=0 mulu0=1 $ $x=3700 $y=2300 $w=600 $h=400 $r=270 $m
MMp2 A B out_xor Vdd PMOS25 w=500n l=250n m=1 ad=325f pd=2.3u as=325f ps=2.3u nrd=1.3 nrs=1.3 mult=1 delvto=0 mulu0=1 $ $x=3700 $y=4900 $w=600 $h=400 $r=270 $m
.ends

.subckt TG_hf_AND A B out_and Gnd Vdd 
* Library name: prooog
* Cell name: TG_hf_AND
* View name: schematic
* PORT=Vdd TYPE=Other
* PORT=Gnd TYPE=Other
* PORT=out_and TYPE=Out
* PORT=B TYPE=In
* PORT=A TYPE=In

Xinverter_1 B N_1 Gnd Vdd inverter $ $x=2400 $y=3550 $w=1800 $h=900
MMn1 out_and B A Gnd NMOS25 w=1.5u l=250n m=1 ad=975f pd=4.3u as=975f ps=4.3u nrd=433.33333m nrs=433.33333m mult=1 delvto=0 mulu0=1 $ $x=3900 $y=5200 $w=600 $h=400 $r=90
MMn2 out_and N_1 Gnd Gnd NMOS25 w=1.5u l=250n m=1 ad=975f pd=4.3u as=975f ps=4.3u nrd=433.33333m nrs=433.33333m mult=1 delvto=0 mulu0=1 $ $x=3900 $y=3100 $w=600 $h=400 $r=90
MMp1 A N_1 out_and Vdd PMOS25 w=1.5u l=250n m=1 ad=975f pd=4.3u as=975f ps=4.3u nrd=433.33333m nrs=433.33333m mult=1 delvto=0 mulu0=1 $ $x=3900 $y=4100 $w=600 $h=400 $r=270 $m
.ends

.subckt halfadder A B cout sum Gnd Vdd 
* Library name: prooog
* Cell name: halfadder
* View name: schematic
* PORT=sum TYPE=Out
* PORT=cout TYPE=Out
* PORT=Vdd TYPE=Other
* PORT=Gnd TYPE=Other
* PORT=A TYPE=In
* PORT=B TYPE=In

XDPL_xor_1 A B sum Gnd Vdd DPL_xor $ $x=5200 $y=4500 $w=1800 $h=1000
XTG_hf_AND_1 A B cout Gnd Vdd TG_hf_AND $ $x=5200 $y=3300 $w=1800 $h=1000
.ends


