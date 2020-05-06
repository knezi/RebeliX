difference() {
	union() {
		cube([27, 27, 5]);
		intersection() {
			translate([20, 20, 0]) cylinder(40, 13, 13);
			cube([27, 27, 500]);
		}
	}
	translate([4, 4, 0]) cylinder(500, 2, 2);
	translate([20, 20, 0]) cylinder(500, 10, 10);
}
