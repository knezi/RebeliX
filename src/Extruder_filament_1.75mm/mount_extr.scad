// RebeliX
//
// j-head mount + fan 40mm
// GNU GPL v3
// Martin Neruda
// http://www.reprap4u.cz

fan_width = 40;
fan_diameter = 38;
fan_mount = 33;

mount_height = 8;

filament_diameter=2;
filament_feed_hole_d=(filament_diameter*1.1)/cos(180/8);

difference(){
	union(){
	  cube([60,20,mount_height]);
	  translate([10,0,8]) cube([10,3,15]);
	  translate([40,0,8]) cube([10,3,15]);
	}	
	
	translate([30,10,4]) cylinder(r=8.5,h=6,$fn=30);
	translate([30,10,-2]) cylinder(r=filament_feed_hole_d/2,h=20,$fn=30);


	// Otvory pro prisroubovani
	translate([30-24,10,-0.1]) cylinder(r=2.5,h=10,$fn=30);
	translate([30+24,10,-0.1]) cylinder(r=2.5,h=10,$fn=30);

  translate([30+15,24,4]) rotate([90,0,0]) cylinder(r=1.7, h=30, $fn=32);
  translate([30-15,24,4]) rotate([90,0,0]) cylinder(r=1.7, h=30, $fn=32);
	
}	



translate([0,40,0])
difference(){
	union(){
	  cube([60,20,mount_height]);
	}	
	
	//translate([30,10,4]) cylinder(r=8.5,h=6,$fn=30);
	//translate([30,10,-2]) cylinder(r=filament_feed_hole_d/2,h=20,$fn=30);


	// Otvory pro prisroubovani
	translate([30-24,10,-0.1]) cylinder(r=2.5,h=10,$fn=30);
	translate([30+24,10,-0.1]) cylinder(r=2.5,h=10,$fn=30);
	
}	
