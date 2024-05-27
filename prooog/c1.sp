* SPICE export by:      S-Edit 2022.2.3
* Export time:          Fri Dec  8 13:43:49 2023
* Design path:          /eda/Mentor/Tanner/TannerTools_v2022.2/Tutorials/prooog/lib.defs
* Library:              prooog
* Cell:                 c1
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

.subckt or_with_inverter A B out_or Gnd Vdd 
* Library name: prooog
* Cell name: or_with_inverter
* View name: schematic
* PORT=Vdd TYPE=Other
* PORT=A TYPE=In
* PORT=Gnd TYPE=Other
* PORT=B TYPE=In
* PORT=out_or TYPE=Out

Xinverter_1 N_2 out_or Gnd Vdd inverter $ $x=6600 $y=3350 $w=1800 $h=900
MMn1 N_2 A Gnd Gnd NMOS25 w=750n l=250n m=1 ad=487.5f pd=2.8u as=487.5f ps=2.8u nrd=866.66667m nrs=866.66667m mult=1 delvto=0 mulu0=1 $ $x=3800 $y=2800 $w=400 $h=600
MMn2 N_2 B Gnd Gnd NMOS25 w=750n l=250n m=1 ad=487.5f pd=2.8u as=487.5f ps=2.8u nrd=866.66667m nrs=866.66667m mult=1 delvto=0 mulu0=1 $ $x=4800 $y=2800 $w=400 $h=600
MMp1 N_1 B Vdd Vdd PMOS25 w=1.25u l=250n m=1 ad=812.5f pd=3.8u as=812.5f ps=3.8u nrd=520m nrs=520m mult=1 delvto=0 mulu0=1 $ $x=4300 $y=4600 $w=400 $h=600
MMp3 N_2 A N_1 Vdd PMOS25 w=1.25u l=250n m=1 ad=812.5f pd=3.8u as=812.5f ps=3.8u nrd=520m nrs=520m mult=1 delvto=0 mulu0=1 $ $x=4300 $y=3800 $w=400 $h=600
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

.subckt c1 A0 B0 C0 C1 Gnd Vdd 
* Library name: prooog
* Cell name: c1
* View name: schematic
* PORT=A0 TYPE=In
* PORT=B0 TYPE=In
* PORT=C0 TYPE=In
* PORT=Vdd TYPE=Other
* PORT=Gnd TYPE=Other
* PORT=C1 TYPE=Out

Xor_with_inverter_1 A0 B0 N_3 Gnd Vdd or_with_inverter $ $x=2300 $y=4900 $w=1800 $h=1000
Xor_with_inverter_2 N_1 N_2 C1 Gnd Vdd or_with_inverter $ $x=6600 $y=4900 $w=1800 $h=1000
XTG_hf_AND_1 A0 B0 N_2 Gnd Vdd TG_hf_AND $ $x=2300 $y=3700 $w=1800 $h=1000
XTG_hf_AND_2 N_3 C0 N_1 Gnd Vdd TG_hf_AND $ $x=4400 $y=4900 $w=1800 $h=1000
.ends



