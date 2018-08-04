

use <side.scad>;

module box(
    width=5,
    depth=5,
    height=5,
    thickness=1,
    fingerWidth=undef,
    labelsSize=10, 
    showLabels=true,
    labels=["Top","Bottom","Left","Right","Front","Back"],
    active=[1,1,1,1,1,1],
    3d=true,
    space=2,
    extends=[0,0,0,0,0,0],
    holes=[[],[],[],[],[],[]]
    ) {
    fingerWidth = (fingerWidth==undef) ? thickness*2 : fingerWidth;
    
    assemble3d=[
        [
            [width/2, depth/2, height-thickness/2], // top
            [0,0,0]
        ],[
            [width/2, depth/2, thickness/2], // bottom
            [0,180,0]
        ],
        [
            [thickness/2, depth/2, height/2], // left
            [0,270,0]
        ],
        [
            [width-thickness/2, depth/2, height/2], // right
            [0,90,0]
        ],
        [
            [width/2, thickness/2, height/2], // front
            [90,0,0]
        ],
        [
            [width/2, depth-thickness/2, height/2], // back
            [270,0,0]
        ]
    ];
    
    assemble2d=[
        [
            [width/2 + extends[0]/2, depth*3/2+space + extends[0] + extends[1]/2, 0] // top
        ],
        [
            [width/2 + extends[0]/2, depth/2 + extends[0]/2, 0] // bottom
        ],
        [
            [width*2 + extends[0] + height / 2 + space * 2, depth/2, 0] // left
        ],
        [
            [width*2 + extends[0] + height / 2 + space * 2, depth*3/2 + space, 0] // right
        ],
        [
            [width*3/2 + extends[0] + space, height/2, 0] // front
        ],
        [
            [width*3/2 + extends[0] + space, height*3/2 + space, 0] // back
        ]
    ];
    assemble=(3d) ? assemble3d : assemble2d;
    
    // top
    if (active[0])
    translate(assemble[0][0])
        rotate(assemble[0][1])
            side(width, depth, thickness, fingerWidth, male=[1,1,1,1],
            name="top", sideColor="blue", labelsSize=labelsSize, showLabels=showLabels,
            holes=holes[0], 3d=3d, extend=extends[0]);

    // bottom
    if (active[1])
    translate(assemble[1][0])
        rotate(assemble[1][1])
            side(width, depth, thickness, fingerWidth, male=[1,1,1,1],
            name="bottom", sideColor="green", labelsSize=labelsSize, showLabels=showLabels,
            holes=holes[1], 3d=3d, extend=extends[1]);
    
    // left
    if (active[2])
    translate(assemble[2][0])
        rotate(assemble[2][1])
            side(height, depth, thickness, fingerWidth, male=[0,0,0,0],
            name="left", sideColor="magenta", labelsSize=labelsSize, showLabels=showLabels,
            holes=holes[2], 3d=3d, extend=extends[2]);

    // right
    if (active[3])
    translate(assemble[3][0])
        rotate(assemble[3][1])
            side(height, depth, thickness, fingerWidth, male=[0,0,0,0],
            name="right", sideColor="cyan", labelsSize=labelsSize, showLabels=showLabels,
            holes=holes[3], 3d=3d, extend=extends[3]);

    // front
    if (active[4])
    translate(assemble[4][0])
        rotate(assemble[4][1])
            side(width, height, thickness, fingerWidth, male=[0,1,0,1],
            name="front", sideColor="orange", labelsSize=labelsSize, showLabels=showLabels,
            holes=holes[4], 3d=3d, extend=extends[4]);
    
    // back
    if (active[5])
    translate(assemble[5][0])
        rotate(assemble[5][1])
            side(width, height, thickness, fingerWidth, male=[0,1,0,1],
            name="back", sideColor="indigo", labelsSize=labelsSize, showLabels=showLabels,
            holes=holes[5], 3d=3d, extend=extends[5]);
            

};


