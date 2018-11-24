$fn=64;
difference() {
    union() {
        cylinder(h=10, d=6);
        cylinder(h=2, d=12);
    }
    translate([0,0,-1]) cylinder(h=12, d=4);
}
