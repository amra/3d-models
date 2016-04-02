$fn=64;
fixture_height=40;
width=5;
frame_diameter=40;
wing_length=20;
wing_width=20;
wing_radius=10;
hole_diameter=4;

wing_base=20;
wing_shift=(frame_diameter+width/2)/2-(wing_base+2*wing_radius)/sqrt(2)+fixture_height/2;

difference() {
    union() {
        // core
        resize([40+width,55+width]) cylinder(h=fixture_height, d=frame_diameter+width);
        // wing core
        translate([wing_shift,0,fixture_height/2]) minkowski() { 
            rotate([0,45,0]) cube([wing_base, wing_width, wing_base], center = true);
            rotate([90,0,0]) cylinder(r=wing_radius,h=1);
        }
    }
    // remove core middle
    resize([40,55]) translate([0,0,-1]) cylinder(h=fixture_height+2, d=frame_diameter);
    // remove wing middle
    translate([frame_diameter-2*width, 0, fixture_height/2]) cube([wing_length+frame_diameter, wing_width-width, fixture_height+2], center = true);
    // screw hole
    translate([frame_diameter/2+wing_length/2,0,fixture_height/2]) rotate([90,0,0]) cylinder(d=hole_diameter, h=frame_diameter, center = true);
    translate([0,0,frame_diameter+fixture_height]) cube(2*frame_diameter, center=true);  // remove top residue
    translate([0,0,-frame_diameter]) cube(2*frame_diameter, center=true);  // remove bottom residue
}
