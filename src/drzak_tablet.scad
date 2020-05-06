h=15;
rotate([0, 0, -30]) {cube([140, 5, h]);
	translate([135, 0, 0]) cube([5, 20, h]);
	translate([128, 20, 0]) cube([12, 5, h]);
}

difference(){
translate([0, -18, 0]) cube([30, 18, h]);
rotate([0, 0, -30]) cube([140, 50, h]);

}


// RebeliX
//
// RAMPS mini drzak
// GNU GPL v3
// Martin Neruda <neruda@reprap4u.cz>
// http://www.reprap4u.cz

include <../configuration.scad>

module bottom_holder_base(vyska,sirka,delka){
	// Pridelani do profilu
	translate([0,delka-6,-30]) cube([30,6,85]);
	// Vodici lista
	translate([15-4,delka,-30]) cube([8,2,85]);
}

module bottom_holder_cuts(vyska,delka,vyrez_sirka){
	// Otvor pro M6 sroub
	translate([15,delka-6+M6_head_height,vyska+M6_head_diameter/2]) rotate([90,0,0]) cylinder(r=M6_head_diameter/2,h=10,$fn=30);
	translate([15,0,vyska+M6_head_diameter/2]) rotate([-90,0,0]) cylinder(r=3.1,h=20,$fn=30);
}

difference(){
	bottom_holder_base(6,19,15);
	bottom_holder_cuts(6,15,40);
}

translate([0, 50, 0]) {
	cube([140, 10, 3]);
	cube([3, 10, 25]);
	translate([137, 0, 0]) cube([3, 10, 25]);
}
