height = 2.3;
width = 0.1;
shiftX = 0.03;
shiftZ = 0.5;
step = 4;
step_max=720;
e = 0.5;


translate([0,0,shiftZ]) rotate([-90,0,0]) difference() {
    union() {
        wave(height, e);
        translate([0,-0.15,0.3]) wave(0.1, 0.35);
        translate([0,-0.15,0.8]) wave(0.1, 0.35);
        translate([0,-0.15,1.3]) wave(0.1, 0.35);
        translate([0,-0.15,1.8]) wave(0.1, 0.35);
        //translate([0,-0.15,2.3]) wave(0.1, 0.35);
    }
    // Holes.
    translate([8,1,1.5]) union() {
        translate([4,-0.75,0]) rotate([90,0,0]) cylinder(d=1,h=2, $fn=16);
        translate([-4,-0.75,0]) rotate([90,0,0]) cylinder(d=1,h=2, $fn=16);
        translate([4,0,0]) rotate([90,0,0]) cylinder(d=0.5,h=2, $fn=16);
        translate([-4,0,0]) rotate([90,0,0]) cylinder(d=0.5,h=2, $fn=16);
    }
    // Hang mounts.
    translate([0.5,-1,-1]) cube([1,1,2*height]);
    translate([7,-1,-1]) cube([1,1,2*height]);
    translate([13.5,-1,-1]) cube([1,1,2*height]);
    translate([20,-1,-1]) cube([1,1,2*height]);
}

module wave(h, thinkness) {
    for(a=[0:step:step_max]){
        hull(){
            translate([a*shiftX,0,sin(a)*shiftZ]) cube([width,thinkness,h]);
            translate([(a+step)*shiftX,0,sin(a+step)*shiftZ]) cube([width,thinkness,h]);
        }
    }
}
