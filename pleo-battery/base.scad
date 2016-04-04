$fn=64;
radius=8;
height=0.3;
translate([radius,radius,0]) minkowski()
{
  cube([44-2*radius,29.3-2*radius,height/2]);
  cylinder(r=radius,h=height/2);
}
