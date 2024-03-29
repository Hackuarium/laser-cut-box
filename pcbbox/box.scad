

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
    faceInsets=[0,0,0,0,0,0],
    holes=[[],[],[],[],[],[]]
    ) {
    fingerWidth = (fingerWidth==undef) ? thickness*2 : fingerWidth;
    
    assemble3d=[
        [
            [width/2, depth/2, height-thickness/2-faceInsets[0]], // top
            [0,0,0]
        ],[
            [width/2, depth/2, thickness/2+faceInsets[1]], // bottom
            [0,180,0]
        ],
        [
            [thickness/2+faceInsets[2], depth/2, height/2], // left
            [270,0,90]
        ],
        [
            [width-thickness/2-faceInsets[3], depth/2, height/2], // right
            [90,0,90]
        ],
        [
            [width/2, thickness/2+faceInsets[4], height/2], // front
            [90,0,0]
        ],
        [
            [width/2, depth-thickness/2-faceInsets[5], height/2], // back
            [270,0,0]
        ]
    ];
    
    extendsX=max(extends[0], extends[1]);

    assemble2d = (depth > (height * 2)) ?
        [
            [
                [width/2 + extendsX, depth*3/2+space + extends[0]*2 + extends[1], 0] // top
            ],
            [
                [width/2 + extendsX, depth/2 + extends[0], 0] // bottom
            ],
            [
                [width + depth/2 + extendsX*2 + space, height*5/2 + space*2, 0] // left
            ],
            [
                [width + depth/2 + extendsX*2 + space, height*7/2 + space*3, 0] // right
            ],
            [
                [width*3/2 + extendsX*2 + space, height/2, 0] // front
            ],
            [
                [width*3/2 + extendsX*2 + space, height*3/2 + space, 0] // back
            ]
        ] : 
        [
            [
                [width/2 + extends[0], depth*3/2+space + extends[0]*2 + extends[1], 0] // top
            ],
            [
                [width/2 + extends[0], depth/2 + extends[0], 0] // bottom
            ],
            [
                [width * 2 + depth / 2 + extends[0]*2 + space * 2, height/2, 0] // left
            ],
            [
                [width * 2 + depth / 2 + extends[0]*2 + space * 2, height*3/2 + space, 0] // right
            ],
            [
                [width*3/2 + extends[0]*2 + space, height/2, 0] // front
            ],
            [
                [width*3/2 + extends[0]*2 + space, height*3/2 + space, 0] // back
            ]
        ];

    


    assemble=(3d) ? assemble3d : assemble2d;
    
    // top
    if (active[0])
    translate(assemble[0][0])
        rotate(assemble[0][1])
            side(
                width, depth, thickness, fingerWidth,
                name="top", sideColor="blue", labelsSize=labelsSize, showLabels=showLabels,
                holes=holes[0], 3d=3d, extend=extends[0],
                holeShifts=[faceInsets[4],faceInsets[2],faceInsets[5],faceInsets[3]],
                male=[
                    specialFingers[0] ? specialFingers[0] : 1,
                    specialFingers[0] ? specialFingers[0] : 1,
                    specialFingers[0] ? specialFingers[0] : 1,
                    specialFingers[0] ? specialFingers[0] : 1,
                ]
            );

    // bottom
    if (active[1])
    translate(assemble[1][0])
        rotate(assemble[1][1])
            side(
                width, depth, thickness, fingerWidth,
                name="bottom", sideColor="green", labelsSize=labelsSize, showLabels=showLabels,
                holes=holes[1], 3d=3d, extend=extends[1],
                holeShifts=[faceInsets[4],faceInsets[3],faceInsets[5],faceInsets[2]],
                male=[
                    specialFingers[1] ? specialFingers[1] : 1,
                    specialFingers[1] ? specialFingers[1] : 1,
                    specialFingers[1] ? specialFingers[1] : 1,
                    specialFingers[1] ? specialFingers[1] : 1,
                ]
            );
    
    // left
    if (active[2])
    translate(assemble[2][0])
        rotate(assemble[2][1])
            side(
                depth, height, thickness, fingerWidth,
                name="left", sideColor="magenta", labelsSize=labelsSize, showLabels=showLabels,
                holes=holes[2], 3d=3d, extend=extends[2], textRotation=180,
                holeShifts=[faceInsets[0],faceInsets[4],faceInsets[1],faceInsets[5]],
                male=[
                    specialFingers[0] ? invertSpecialFinger(specialFingers[0]) : 0,
                    0,
                    specialFingers[1] ? invertSpecialFinger(specialFingers[1]) : 0,
                    0
                ]
            );

    // right
    if (active[3])
    translate(assemble[3][0])
        rotate(assemble[3][1])
            side(
                depth, height, thickness, fingerWidth,
                name="right", sideColor="cyan", labelsSize=labelsSize, showLabels=showLabels,
                holes=holes[3], 3d=3d, extend=extends[3],
                holeShifts=[faceInsets[1],faceInsets[4],faceInsets[0],faceInsets[5]],
                male=[
                    specialFingers[1] ? invertSpecialFinger(specialFingers[1]) : 0,
                    0,
                    specialFingers[0] ? invertSpecialFinger(specialFingers[0]) : 0,
                    0
                ]
            );

    // front
    if (active[4])
    translate(assemble[4][0])
        rotate(assemble[4][1])
            side(
                width, height, thickness, fingerWidth,
                name="front", sideColor="orange", labelsSize=labelsSize, showLabels=showLabels,
                holes=holes[4], 3d=3d, extend=extends[4],
                holeShifts=[faceInsets[1],faceInsets[2],faceInsets[0],faceInsets[3]],
                male=[
                    specialFingers[1] ? invertSpecialFinger(specialFingers[1]) : 0,
                    1,
                    specialFingers[0] ? invertSpecialFinger(specialFingers[0]) : 0,
                    1
                ]
            );
    
    // back
    if (active[5])
    translate(assemble[5][0])
        rotate(assemble[5][1])
            side(
                width, height, thickness, fingerWidth,  
                name="back", sideColor="indigo", labelsSize=labelsSize, showLabels=showLabels,
                holes=holes[5], 3d=3d, extend=extends[5], textRotation=180,
                holeShifts=[faceInsets[0],faceInsets[2],faceInsets[1],faceInsets[3]],
                male=[
                    specialFingers[0] ? invertSpecialFinger(specialFingers[0]) : 0,
                    1,
                    specialFingers[1] ? invertSpecialFinger(specialFingers[1]) : 0,
                    1
                ]
            );
};


function invertSpecialFinger(value) = (value==1) ? 0 : (value==0) ? 1 : (value==2) ? 3 : (value==3) ? 2 : undef;