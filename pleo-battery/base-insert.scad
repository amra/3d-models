$fn=64;
corner_radius=5;
height=0.3;
plate_length=44;
plate_width=29.3;

contact_hole_radius=5;
contact_hole_distance=2;

translate([corner_radius,corner_radius,0]) difference() {
    minkowski() {
        cube([plate_length-2 * corner_radius, plate_width-2 * corner_radius, height/2]);
        cylinder(r=corner_radius, h=height/2);
    }
    contact_hole(contact_hole_distance + contact_hole_radius, contact_hole_distance + contact_hole_radius);
    contact_hole(plate_length - contact_hole_distance - contact_hole_radius, plate_width - contact_hole_distance - contact_hole_radius);
    contact_hole(plate_length - contact_hole_distance - contact_hole_radius, contact_hole_distance + contact_hole_radius);
}

module contact_hole(x, y) {
    translate([x - corner_radius, y - corner_radius, -1]) cylinder(h=2, r=contact_hole_radius);
}

locator_width=3;
locator_length=10;
locator_height=5;
locator_rotation=25;
locator_distance=18;
#translate([locator_distance, plate_width/2, 0]) rotate([0,0,locator_rotation]) translate([0,-locator_length/2,0]) cube([locator_width,locator_length,locator_height]);