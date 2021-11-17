$fn=40; // defines the resolution for calculation by OpenSCAD

use <../../pcbbox/box.scad>;

box(
    3d=false, // true: render as 3D, false: render as 2D (for laser cutting)
    width=100, // width of the box
    height=50, // height of the box
    depth=80, // depth of the box
    thickness=2, // thickness of the wood
    fingerWidth=undef, // if undefine 2 times the thickness
    labelsSize=10, 
    showLabels=true,
    labels=["Top","Bottom","Left","Right","Front","Back"],
    space=2, // space between the parts when rendering as 2D
    active=[1,1,1,1,1,1],  // side that should be displayed
    specialFingers=[1,1,1,1,1,1],
                        // for a normal box you should leave the default. However what is currently
                        // supported is to specify either on 'top' (first element of the array) or the
                        // 'bottom' (second element in the array) that is is fully female (2) or male (3).
    holes=[ // relative to the inside of the box
        [
            [20,20,10],     // circular hole on the top
                            // you have 3 parameters
                            // x position of the center
                            // y position of the center
                            // diamseter of the circle
            [40,20,10,20],    // rectangular hole on the top
                            // you have 4 parameters
                            // x position of the center of the rectangle
                            // y position of the center of the rectangle
                            // width of the rectangle
                            // height of the rectangle
                            
            [7,2,"Custom",10], // custom share hole on the top
            [70,30,"Insert",30,30,2,4] // to insert a 'cuvette'
        ], // top
        [], // bottom
        [], // left
        [], // right
        [], // front
        [] // back
    ]
);
