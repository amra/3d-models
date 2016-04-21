$fn=64;
corner_radius=5;
height=2;
plate_height=1;
plate_length=44;
plate_width=29.3;
wall_thickness=5;

rotator_mount_diameter=26;

center_x=plate_length/2-corner_radius;
center_y=plate_width/2-corner_radius;

rotator_base_height=1;
rotator_top_diameter=11;

diff=0.1;

difference() {
    hull() {
        cylinder(h=2*height, d=rotator_mount_diameter);
        translate([4,0,0]) cylinder(h=2*height, d=rotator_mount_diameter);
    }
    translate([-30,-15,-1]) cube([30,30,30]);
    translate([15,0,-12]) rotate([0,45,0]) cylinder(h=20,d=20);
    translate([0,0,-diff]) hull() {
        cylinder(h=2*height+2*diff,d=rotator_top_diameter);
        translate([2,0,0]) cylinder(h=2*height+2*diff,d=rotator_top_diameter);
    }
    translate([height,0,height]) rotate([90,0,0]) cylinder(h=50, d=1, center=true);
}