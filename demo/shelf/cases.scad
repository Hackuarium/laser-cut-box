use <../../pcbbox/box.scad>;

width=200;
height=200;
depth=200;
thickness=5;
3d=true;

// the box

box(
    3d=3d, // true: render as 3D, false: render as 2D (for laser cutting)
    width=height, // width of the box
    height=depth, // height of the box
    depth=width, // depth of the box
    thickness=thickness, // thickness of the wood
    fingerWidth=10, // if undefine 2 times the thickness
    labelsSize=10, 
    showLabels=true,
    labels=["Top","Bottom","Left","Right","Front","Back"],
    space=2, // space between the parts when rendering as 2D
    extends=[20,20,0,0,0,0],
    active=[1,1,1,1,0,1],  // side that should be displayed
    specialFingers=[1,1,1,1,1,1],
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
