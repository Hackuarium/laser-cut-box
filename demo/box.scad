$fn=40; // defines the resolution for calculation by OpenSCAD

use <../pcbbox/box.scad>;

box(
    width=100, // width of the box
    height=50, // height of the box
    depth=80, // depth of the box
    thickness=2, // thickness of the wood
    fingerWidth=undef, // if undefine 2 times the thickness
    labelsSize=10, 
    showLabels=true,
    labels=["Top","Bottom","Left","Right","Front","Back"],
    3d=true, // true: render as 3D, false: render as 2D (for laser cutting)
    space=2, // space between the parts when rendering as 2D
    active=[1,1,1,1,1,1],  // side that should be displayed
    holes=[ // relative to the inside of the box
        [
            [20,20,2], // circular hole on the Bottom
            [40,40,1,2], // rectangular hole on the bottom
            [7,2,"Custom",10], // custom share hole on the bottom
            [50,30,"Insert",30,30,2,4] // to insert a 'cuvette'
        ], // top
        [], // bottom
        [], // left
        [], // right
        [], // front
        [] // back
    ]
);
