// RebeliX
//
// RAMPS mini drzak
// GNU GPL v3
// Martin Neruda <neruda@reprap4u.cz>
// http://www.reprap4u.cz

include <../configuration.scad>

module bottom_holder_base(vyska,sirka,delka){
	// Pridelani do profilu
	translate([-10,delka-6,-10]) cube([50,6,30]);
	// Vodici lista
	translate([15-4,delka,-10]) cube([8,2,30]);
}

module bottom_holder_cuts(vyska,delka,vyrez_sirka){
	translate([-3.5,3,vyska-3]) cube([vyrez_sirka,1.9,5]);

	translate([30,delka-7,6]) cube([50,8,30]);
	translate([-50,delka-7,6]) cube([50,8,30]);
	// Otvor pro M6 sroub
	translate([15,delka-6+M6_head_height,vyska+M6_head_diameter/2]) rotate([90,0,0]) cylinder(r=M6_head_diameter/2,h=10,$fn=30);
	translate([15,0,vyska+M6_head_diameter/2]) rotate([-90,0,0]) cylinder(r=3.1,h=20,$fn=30);
	// Uspora plastu
	translate([0,0,vyska]) rotate([0,-55,0]) cube([30,30,30]);
	translate([30,0,vyska]) rotate([0,-35,0]) cube([30,30,30]);	
}

difference(){
	bottom_holder_base(6,19,15);
	bottom_holder_cuts(6,15,40);
}
