//rotate([0,180,0]) 
difference() {
    union() {
        import("../shell.stl");
        translate ([17.5,0,0]) cube([15,5,5]);
        translate ([20,-5,-7.5]) cube([10,5,15]);
    }
    translate([0,0,-2.5]) import("../shell.stl");
}