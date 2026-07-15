# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_control {
result_rank { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 16
	offset_end 23
}
result_suit { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 32
	offset_end 39
}
width { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 48
	offset_end 55
}
height { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 56
	offset_end 63
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
interrupt {
}
}
dict set axilite_register_dict control $port_control


