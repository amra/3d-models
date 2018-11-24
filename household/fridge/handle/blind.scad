$fn=64;
difference() {
    cylinder(d=9, h=1);
    translate([0,0,0.5]) cylinder(d=7.5, h=0.55);
}


translate ([0,0,1]) intersection() {
    union() {
        cube([1.1,4.5,3.5], center=true);
        cube([4.5,1.1,3.5], center=true);
    }
    translate([0,0,-1]) cylinder(d1=7, d2=1.5, h=3);
}