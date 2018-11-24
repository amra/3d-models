$fn=128;
cube([20,5,3]);
translate([10,0,0]) {
    difference() {
        cylinder(h=3,r=10);
        translate([0,0,-0.5]) union() {
            translate([-10,0,0]) cube([20,11,4]);
            cylinder(h=4,r=8);
        }
    }
}

