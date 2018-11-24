translate([-1,-1,0]) minkowski()
{
  cube([2,2,0.05]);
  cylinder(r=0.5,h=0.05, $fn=16);
}


translate([0,0,0.1]) union() {
translate([-2.5,0,0]) rotate([90,0,0]) scale([0.1,0.1,0.1]) difference() {
    import("../shell.stl");
    union() {
        difference() {
            translate([0,1.5,-2.5]) scale([1,1,1]) import("../shell.stl");
            translate([15,-5,-2]) cube([20,10,10]);
        }
        translate([25,35,0]) cylinder(r=2, h=30, $fn=16);
        translate([15,25,0]) cylinder(r=2, h=30, $fn=16);
        translate([25,25,0]) cylinder(r=2, h=30, $fn=16);
        translate([35,25,0]) cylinder(r=2, h=30, $fn=16);
        translate([25,15,0]) cylinder(r=2, h=30, $fn=16);
    }
}

translate([-0.24,-0.5,0.5]) rotate([0,90,0]) difference() {
    cube([0.55,1.2,0.5]);
    translate([0,0.7,-0.5]) rotate([0,0,45]) cube([1,1,1.5]);
}
}