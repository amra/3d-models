$fn=64;
corner_radius=5;
plate_height=3;
plate_length=44;
plate_width=29.3;
wall_thickness=5;

difference() {
    minkowski() {
        cube([plate_length-2 * corner_radius, plate_width-2 * corner_radius, plate_height]);
        cylinder(r=corner_radius, h=plate_height);
    }
    minkowski() {
        translate([corner_radius/2,corner_radius/2,1]) cube([plate_length-2 * corner_radius - wall_thickness, plate_width-2 * corner_radius - wall_thickness, plate_height]);
        cylinder(r=corner_radius, h=plate_height);
    }    
}


// add screw holes
// add centre rotation cylinder
// add side holes for rotating wings