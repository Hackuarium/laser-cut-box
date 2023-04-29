$fn=40; // defines the resolution for calculation by OpenSCAD

use <../../pcbbox/box.scad>;

width=340;
height=500;
depth=250;
fingerWidth=30;
thickness=5.2;
hole=85;

distanceHole = 40;
diameterHole = 4;

// FRONT DOOR
// translate([0,thickness,0]) square([width,height-2*thickness]);


// FOR THE LIGHT
gap=1;

difference() {
  translate([gap, gap]) square([width-2*gap,depth-2*gap]);
  translate([distanceHole,distanceHole]) circle( d=diameterHole);
  translate([width-distanceHole-thickness,distanceHole]) circle( d=diameterHole);
  translate([distanceHole,depth-distanceHole-thickness]) circle( d=diameterHole);
  translate([width-distanceHole-thickness,depth-distanceHole-thickness]) circle( d=diameterHole);
  translate([width/2,depth/2]) circle( d=hole);
}

box(
    3d=false, // true: render as 3D, false: render as 2D (for laser cutting)
    width=width, // width of the box
    height=depth, // height of the box
    depth=height, // depth of the box
    thickness=thickness, //thickness of the wood
    fingerWidth=fingerWidth, // if undefine 2 times the thickness
    labelsSize=50, 
    showLabels=true,
    labels=["Top","Bottom","Left","Right","Front","Back"],
    space=30, // space between the parts when rendering as 2D
    active=[1,0,1,1,1,1],  // side that should be displayed
    extends=[0,0,0,0,10,10], 
    faceInsets=[0,0,0,0,0,0], 
    specialFingers=[1,2,1,1,1,1],
                        // for a normal box you should leave the default. However what is currently
                        // supported is to specify either on 'top' (first element of the array) or the
                        // 'bottom' (second element in the array) that is is fully female (2) or male (3).
    holes=[ // relative to the inside of the box
        [
                            // you have 3 parameters
                            // x position of the center
                            // y position of the center
                            // diamseter of the circle
        ], // top
        [], // bottom
        [], // left
        [], // right
        [], // front
        [
            [distanceHole,distanceHole,diameterHole],
            [width-distanceHole-thickness,distanceHole,diameterHole],
            [distanceHole,depth-distanceHole-thickness,diameterHole],
            [width-distanceHole-thickness,depth-distanceHole-thickness,diameterHole],
            [width/2,depth/2,hole]     // circular hole on the top

        ] // back
    ]
);
