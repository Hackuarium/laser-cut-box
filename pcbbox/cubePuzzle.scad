

use <side.scad>;

module cubePuzzle(
    fingers=[],
    thickness=1,
    labelsSize=10, 
    showLabels=true,
    labels=["Top","Bottom","Left","Right","Front","Back"],
    active=[1,1,1,1,1,1],
    3d=true,
    space=2,
    ) {

        length=thickness*len(fingers[0]);
        width=length;
        depth=length;
        height=length;
        fingerWidth =thickness;
    
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
                [270,0,90]
            ],
            [
                [width-thickness/2, depth/2, height/2], // right
                [90,0,90]
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
        
        assemble2d =
            [
                [
                    [width/2, depth*3/2+space , 0] // top
                ],
                [
                    [width/2, depth/2, 0] // bottom
                ],
                [
                    [width * 2 + depth / 2 + space * 2, height/2, 0] // left
                ],
                [
                    [width * 2 + depth / 2 + space * 2, height*3/2 + space, 0] // right
                ],
                [
                    [width*3/2 + space, height/2, 0] // front
                ],
                [
                    [width*3/2 + space, height*3/2 + space, 0] // back
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
                    3d=3d,
                    male=[1,1,1,1],
                    fingers=[
                        fingers[0],
                        fingers[1],
                        fingers[2],
                        fingers[3],
                    ]
                );

        // bottom
        if (active[1])
        translate(assemble[1][0])
            rotate(assemble[1][1])
                side(
                    width, depth, thickness, fingerWidth,
                    name="bottom", sideColor="green", labelsSize=labelsSize, showLabels=showLabels,
                    3d=3d,
                    male=[1,1,1,1],
                    fingers=[
                        fingers[4],
                        fingers[5],
                        fingers[6],
                        fingers[7],
                    ]
                );
        
        // left
        if (active[2])
        translate(assemble[2][0])
            rotate(assemble[2][1])
                side(
                    depth, height, thickness, fingerWidth,
                    name="left", sideColor="magenta", labelsSize=labelsSize, showLabels=showLabels,
                    3d=3d, textRotation=180,
                    male=[1,1,1,1],
                    fingers=[
                        fingers[8],
                        fingers[9],
                        fingers[10],
                        fingers[11],
                    ]
                );

        // right
        if (active[3])
        translate(assemble[3][0])
            rotate(assemble[3][1])
                side(
                    depth, height, thickness, fingerWidth,
                    name="right", sideColor="cyan", labelsSize=labelsSize, showLabels=showLabels,
                    3d=3d,
                    male=[1,1,1,1],
                    fingers=[
                        fingers[12],
                        fingers[13],
                        fingers[14],
                        fingers[15],
                    ]
                );

        // front
        if (active[4])
        translate(assemble[4][0])
            rotate(assemble[4][1])
                side(
                    width, height, thickness, fingerWidth,
                    name="front", sideColor="orange", labelsSize=labelsSize, showLabels=showLabels,
                    3d=3d,
                    male=[1,1,1,1],
                    fingers=[
                        fingers[16],
                        fingers[17],
                        fingers[18],
                        fingers[19],
                    ]
                );
        
        // back
        if (active[5])
        translate(assemble[5][0])
            rotate(assemble[5][1])
                side(
                    width, height, thickness, fingerWidth,  
                    name="back", sideColor="indigo", labelsSize=labelsSize, showLabels=showLabels,
                    3d=3d, textRotation=180,
                    male=[1,1,1,1],
                    fingers=[
                        fingers[20],
                        fingers[21],
                        fingers[22],
                        fingers[23],
                    ]
                );
};


function invertSpecialFinger(value) = (value==1) ? 0 : (value==0) ? 1 : (value==2) ? 3 : (value==3) ? 2 : undef;