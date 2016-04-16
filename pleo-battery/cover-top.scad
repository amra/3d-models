$fn=64;
corner_radius=5;
height=3;
plate_height=1;
plate_length=44;
plate_width=29.3;
wall_thickness=5;

rotator_mount_diameter=20;

center_x=plate_length/2-corner_radius;
center_y=plate_width/2-corner_radius;

difference() {
    minkowski() {
        cube([plate_length-2 * corner_radius, plate_width-2 * corner_radius, height/2]);
        cylinder(r=corner_radius, h=height/2);
    }
    minkowski() {
        translate([corner_radius/2,corner_radius/2,plate_height]) cube([plate_length-2 * corner_radius - wall_thickness, plate_width-2 * corner_radius - wall_thickness, height/2]);
        cylinder(r=corner_radius, h=height/2);
    }
    translate([center_x,center_y,-1]) cylinder(h=2*height, d=rotator_mount_diameter);
}