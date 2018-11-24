translate([0,0,-1.8]) difference() {
    import("../seahorse.stl");
    translate([-50,-50,2]) cube(100);
    translate([-50,-50,-98.2]) cube(100);
}