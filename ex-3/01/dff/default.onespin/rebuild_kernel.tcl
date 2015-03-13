cd /home/group09/projects/01/jkff
cd /home/group09/projects/01/jkff/ 
get_read_hdl_option -vhdl_version 
::read_vhdl -version 93 -display_errors_only -ignore_pragma_settings -library synopsys /opt/onespin/latest/lib/vhdl/synopsys/orig/*.vhd 
get_read_hdl_option -vhdl_version 
::read_vhdl -display_errors_only -ignore_pragma_settings -library ieee /opt/onespin/latest/lib/vhdl/ieee/orig/std_logic_1164.vhd /opt/onespin/latest/lib/vhdl/ieee/orig/std_logic_arith.vhd /opt/onespin/latest/lib/vhdl/ieee/orig/std_logic_signed.vhd /opt/onespin/latest/lib/vhdl/ieee/orig/std_logic_unsigned.vhd /opt/onespin/latest/lib/vhdl/ieee/orig/std_logic_misc.vhd /opt/onespin/latest/lib/vhdl/ieee/orig/gs_types.vhd /opt/onespin/latest/lib/vhdl/ieee/orig/std_logic_textio.vhd /opt/onespin/latest/lib/vhdl/ieee/orig/std_logic_components.vhd /opt/onespin/latest/lib/vhdl/ieee/orig/std_logic_entities.vhd /opt/onespin/latest/lib/vhdl/ieee/orig/math_real.vhd /opt/onespin/latest/lib/vhdl/ieee/orig/math_complex.vhd /opt/onespin/latest/lib/vhdl/ieee/orig/timing_p.vhd /opt/onespin/latest/lib/vhdl/ieee/orig/timing_b.vhd /opt/onespin/latest/lib/vhdl/ieee/orig/prmtvs_p.vhd /opt/onespin/latest/lib/vhdl/ieee/orig/ulogic_arithmetic.vhd 
::read_vhdl -display_errors_only -ignore_pragma_settings -library ieee -version 87 /opt/onespin/latest/lib/vhdl/ieee/orig/prmtvs_b.vhd 
::read_vhdl -display_errors_only -ignore_pragma_settings -library onespin /opt/onespin/latest/lib/vhdl/onespin/orig/substitute.vhd 
::read_vhdl -display_errors_only -ignore_pragma_settings -noignore_numericstd -library ieee -pragma_ignore {} -version 93 /opt/onespin/latest/lib/vhdl_jaguar/Linux_x86_64/auxi/packages/IEEE/numeric_std.vhd /opt/onespin/latest/lib/vhdl_jaguar/Linux_x86_64/auxi/packages/IEEE/numeric_bit.vhd 
::read_vhdl -display_errors_only -ignore_pragma_settings -library ncutils -version 93 /opt/onespin/latest/lib/vhdl/ncutils/orig/ncutilities.vhdl 
read_vhdl -golden -pragma_ignore {} -version 93 { /home/group09/projects/01/jkff/jkff.vhd } 
elaborate -golden 
compile -golden 
set_mode mv 
read_sva /home/group09/projects/01/jkff/jkff.sva 
onespin::noop 
read_sva /home/group09/projects/01/jkff/jkff.sva 
check sva/inst_jfkk_property_suite/a_behavior1 
check sva/inst_jfkk_property_suite/a_behavior2 
check sva/inst_jfkk_property_suite/a_behavior3 
onespin::noop 
read_sva /home/group09/projects/01/jkff/jkff.sva 
get_checks 
check -all {sva/inst_jfkk_property_suite/a_behavior1 sva/inst_jfkk_property_suite/a_behavior2 sva/inst_jfkk_property_suite/a_behavior3} 
onespin::noop 
onespin::noop 
onespin::noop 
read_sva /home/group09/projects/01/jkff/jkff.sva 
get_checks 
check -all {sva/inst_jfkk_property_suite/a_behavior1 sva/inst_jfkk_property_suite/a_behavior2 sva/inst_jfkk_property_suite/a_behavior3 sva/inst_jfkk_property_suite/a_behavior4} 
check sva/inst_jfkk_property_suite/a_behavior4 
debug sva/inst_jfkk_property_suite/a_behavior4 
onespin::noop 
read_sva /home/group09/projects/01/jkff/jkff.sva 
get_checks 
check -all {sva/inst_jfkk_property_suite/a_behavior1 sva/inst_jfkk_property_suite/a_behavior2 sva/inst_jfkk_property_suite/a_behavior3 sva/inst_jfkk_property_suite/a_behavior4} 
onespin::noop 
onespin::noop 
onespin::noop 
read_sva /home/group09/projects/01/jkff/jkff.sva 
get_checks 
check -all {sva/inst_jfkk_property_suite/a_behavior1 sva/inst_jfkk_property_suite/a_behavior2 sva/inst_jfkk_property_suite/a_behavior3 sva/inst_jfkk_property_suite/a_behavior4} 
