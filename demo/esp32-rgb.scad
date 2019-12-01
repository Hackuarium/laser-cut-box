$fn=40;

use <../pcbbox/pcb.scad>;

pcb(
    3d=false,            // 3d rendering or just 2d ?,
    active=[1,1,1,1,1,1],  // which faces should be rendered
    length=90.170,         // length of the PCB
    width=49.600,           // width of the PCB
    padding=1,          // space around the pcb (between pcb and box)
    thickness=3,        // thickness of the material to create the box
    pcbThickness=1.6,   // thickness of the box
    topToTop=15,        // distance from the top of the PCB to the external top of the box
    bottomToBottom=10,  // distance from the bottom of the PCB to the external bottom of the box
    extend=5,          // should top and bottom 'extend' in order to assemble the box without glue
    screws=[            // position of holes to fix the PCB
        [3.3,3.1],
        [3.3,46.5],
        [87.1,.1],
        [87.1,46.5]
    ],
    screwDiameter=3,    // diameter of the screws to fix the PCB
    topHoles=[],
    bottomHoles=[],
    frontHoles=[
        [16.5, 7, 4],
        [35.5, 7, 4],
        [54.5, 7, 4],
        [73.5, 7, 4]
    ],
    frontHolesB=[],
    backHoles=[],
    backHolesB=[],
    leftHoles=[         // holes on the left of the box, over the PCB
        [24.130,4.8,6.7],
    ],
    leftHolesB=[],
    rightHoles=[],
    rightHolesB=[],
    showLabels=true,    //should we show the labels
    labelsSize=10,      // size of the labels
    specialFingers=[undef,undef,undef,undef,undef,undef]
                        // for a normal box you should leave the default. However what is currently
                        // supported is to specify either on 'top' (first element of the array) or the
                        // 'bottom' (second element in the array) that is is fully female (2) or male (3).
);
