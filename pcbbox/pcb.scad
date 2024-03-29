use <box.scad>;

module pcb(
    length=100,
    width=80,
    padding=1, // space around the pcb
    thickness=3, // thickness of the material
    pcbThickness=1.6,
    topToTop=20, // distance from the top of the PCB to the top of the box
    bottomToBottom=20, // distance from the bottom of the PCB to the bottom of the box,
    screws=[],
    screwDiameter=3,
    frontHoles=[],
    frontHolesB=[],
    backHoles=[],
    backHolesB=[],
    leftHoles=[],
    leftHolesB=[],
    rightHoles=[],
    rightHolesB=[],
    topHoles=[],
    bottomHoles=[],
    labelsSize=10,
    extend=0,
    showLabels=false,
    show="",
    3d=false,
    fingerWidth=undef,
    specialFingers=[],
    active=[1,1,1,1,1,1]
) {

    box(
        width=length+padding*2+thickness*2,
        depth=width+padding*2+thickness*2,
        height=pcbThickness+topToTop+bottomToBottom,
        thickness=thickness,
        fingerWidth=fingerWidth,
        labelsSize=labelsSize, 
        showLabels=showLabels,
        labels=["Top","Bottom","Left","Right","Front","Back"],
        active=active,
        specialFingers=specialFingers,
        3d=3d,
        space=2,
        extends=[extend,extend,0,0,0,0],
        holes=[
            concat ( // top
                [for(hole = topHoles)
                    concat([hole.x+padding, hole.y+padding],[for (i=[2:1:len(hole)-1]) hole[i]])
                ],
                [for(screw = screws)
                    [screw.x+padding, screw.y+padding, screwDiameter]
                ]
            ),
            concat ( // bottom
                [for(hole = bottomHoles)
                    concat([length-hole.x+padding, hole.y+padding],[for (i=[2:1:len(hole)-1]) hole[i]])
                ],
                [for(screw = screws)
                    [length-screw.x+padding, screw.y+padding, screwDiameter]
                ]
            ),
            concat ( // left
                [for(hole = leftHoles)
                    concat([hole.x+padding, topToTop-hole.y-thickness],[for (i=[2:1:len(hole)-1]) hole[i]])
                ],
                [for(hole = leftHolesB)
                    concat([hole.x+padding, pcbThickness+topToTop+hole.y-thickness],[for (i=[2:1:len(hole)-1]) hole[i]])
                ]
            ),
            concat ( // right
                [for(hole = rightHoles)
                    concat([hole.x+padding, pcbThickness+bottomToBottom+hole.y-thickness],[for (i=[2:1:len(hole)-1]) hole[i]])
                ],
                [for(hole = rightHolesB)
                    concat([hole.x+padding, bottomToBottom-hole.y-thickness],[for (i=[2:1:len(hole)-1]) hole[i]])
                ]
            ),
            concat ( // front
                [for(hole = frontHoles)
                    concat([hole.x+padding, pcbThickness+bottomToBottom+hole.y-thickness],[for (i=[2:1:len(hole)-1]) hole[i]])
                ],
                [for(hole = frontHolesB)
                    concat([hole.x+padding, bottomToBottom-hole.y-thickness],[for (i=[2:1:len(hole)-1]) hole[i]])
                ]
            ),
            concat ( // back
                [for(hole = backHoles)
                    concat([hole.x+padding, topToTop-hole.y-thickness],[for (i=[2:1:len(hole)-1]) hole[i]])
                ],
                [for(hole = backHolesB)
                    concat([hole.x+padding, pcbThickness+topToTop+hole.y-thickness],[for (i=[2:1:len(hole)-1]) hole[i]])
                ]
            )
        ]
    );
}


