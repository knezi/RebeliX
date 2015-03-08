union() {
difference() {
	cube([24,41,41]);
	translate([5,-1,-1]) cube([24,45,13]);
	translate([5,-1,30]) cube([24,45,22]);
	translate([5,5,-1]) cube([14,31,120]);

	translate([-1,21.5,21.5]) rotate([0,90,0]) cylinder(r=11.5,h=20);
	translate([10,21.5,21.5]) rotate([0,90,0]) cylinder(r=8.2,h=20);

	translate([14,-1,21.5+4]) rotate([-90,0,0]) cylinder(r=1,h=120);

	translate([-1,21.5-15.5,21.5-15.5]) rotate([0,90,0]) cylinder(r=1.6,h=20);
	translate([-1,21.5+15.5,21.5-15.5]) rotate([0,90,0]) cylinder(r=1.6,h=20);
	translate([-1,21.5+15.5,21.5+15.5]) rotate([0,90,0]) cylinder(r=1.6,h=20);
	translate([-1,21.5-15.5,21.5+15.5]) rotate([0,90,0]) cylinder(r=1.6,h=20);

}
difference() {
union() {
		translate([0,-20,-3]) cube([24,81,5]);
		translate([8.5,-20,-4]) cube([7,81,5]);
	}
	translate([12,-10,-10]) cylinder(r=3.1,h=80);
	translate([12,51,-10]) cylinder(r=3.1,h=80);
	

}
}
vyska=20;

translate([5,0,40]) {
difference() {union(){
	translate([0,0,-1.5]) cube([19,47,6.5]);
	//translate([9-7.5-1,20.5-2.5-1,-2]) cube([17,7,2]);

	translate([0,42,-vyska]) cube([19,5,vyska]);
	}
	

translate([9-7.5,20.5-2.5,-17]) cube([15,5,20]);
translate([9-3,20.5-7.5,-17]) cube([6,15,30]);
translate([9,-1,-1.5-4.5]) rotate([-90,0,0]) cylinder(r=1,h=120, $fn=8);
translate([9,-1,-1.5-4.5-5]) rotate([-90,0,0]) cylinder(r=1,h=120, $fn=8)
;
translate([9-1,41,-1.5-4.5-5]) cube([2,10,5]);
}

}