* SPICE export by:      S-Edit 2022.2.3
* Export time:          Mon Dec  4 19:55:49 2023
* Design path:          /eda/Mentor/Tanner/TannerTools_v2022.2/Tutorials/prooog/lib.defs
* Library:              prooog
* Cell:                 or_with_inverter
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



