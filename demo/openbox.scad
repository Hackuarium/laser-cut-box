$fn=40; // defines the resolution for calculation by OpenSCAD

use <../pcbbox/box.scad>;

box(
    3d=false, // true: render as 3D, false: render as 2D (for laser cutting)
    width=45, // width of the box
    height=35, // height of the box
    depth=45, // depth of the box
    thickness=3.05, // thickness of the wood
    fingerWidth=5, // if undefine 2 times the thickness
    showLabels=false,
    space=2, // space between the parts when rendering as 2D
    active=[0,1,1,1,1,1],  // side that should be displayed
    specialFingers=[3,1,1,1,1,1],
                        // for a normal box you should leave the default. However what is currently
                        // supported is to specify either on 'top' (first element of the array) or the
                        // 'bottom' (second element in the array) that is is fully female (2) or male (3).
    holes=[ // relative to the inside of the box
        [], // top
        [], // bottom
        [], // left
        [], // right
        [], // front
        [] // back
    ]
);
