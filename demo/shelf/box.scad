$fn=40; // defines the resolution for calculation by OpenSCAD

use <../../pcbbox/box.scad>;

widthUnit = 1;
heightUnit = 1;

unitSize = 75;

width=widthUnit * unitSize;
height=heightUnit * unitSize;
depth=400;
drawerThickness=5;
wallThickness=3;
gap=1.5;
3d=true;

// the box

translate([3d?0:-10,-wallThickness-gap/2,3d ? -50 : 0]) rotate([0, 3d ? 90 : 0, 3d ? 0 :90]) box(
    3d=3d, // true: render as 3D, false: render as 2D (for laser cutting)
    width=height, // width of the box
    height=depth, // height of the box
    depth=width, // depth of the box
    thickness=wallThickness, // thickness of the wood
    fingerWidth=10, // if undefine 2 times the thickness
    labelsSize=10, 
    showLabels=true,
    labels=["Top","Bottom","Left","Right","Front","Back"],
    space=2, // space between the parts when rendering as 2D
    active=[0,1,1,1,1,1],  // side that should be displayed
    specialFingers=[2,1,1,1,1,1],
                        // for a normal box you should leave the default. However what is currently
                        // supported is to specify either on 'top' (first element of the array) or the
                        // 'bottom' (second element in the array) that is is fully female (2) or male (3).
    holes=[ // relative to the inside of the box
        [
        ], // top
        [], // bottom
        [], // left
        [], // right
        [], // front
        [] // back
    ]
);

// the drawer

drawerDepth=depth - wallThickness;
drawerHeight=height-wallThickness*2 - gap;
drawerWidth=width-wallThickness*2 - gap;

box(
    3d=3d, // true: render as 3D, false: render as 2D (for laser cutting)
    width=drawerDepth,
    height=drawerHeight,
    depth=drawerWidth,
    thickness=drawerThickness, // thickness of the wood
    fingerWidth=10, // if undefine 2 times the thickness
    labelsSize=20, 
    showLabels=true,
    extends=[0,0,0,0,0,0],
    faceInsets=[0,0,10,10,0,0],
    labels=["Top","Bottom","Left","Right","Front","Back"],
    space=2, // space between the parts when rendering as 2D
    active=[0,1,1,1,1,1],  // side that should be displayed
    specialFingers=[2,1,1,1,1,1],
                        // for a normal box you should leave the default. However what is currently
                        // supported is to specify either on 'top' (first element of the array) or the
                        // 'bottom' (second element in the array) that is is fully female (2) or male (3).
    holes=[ // relative to the inside of the box
        [], // top
        [], // bottom
        [], // left
        [
            [drawerWidth/2-drawerThickness,drawerHeight-drawerThickness-7.5, 25],     // circular hole on the top
            [drawerWidth/2-drawerThickness,drawerHeight-drawerThickness, 25, 15],     // circular hole on the top
                            // you have 3 parameters
                            // x position of the center
                            // y position of the center
                            // diamseter of the circle
        ], // right
        [], // front
        [] // back
    ]
);
