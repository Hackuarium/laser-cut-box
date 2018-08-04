$fn=40;

use <pcbbox/pcb.scad>;

pcb(
    length=100,         // length of the PCB
    width=80,           // width of the PCB
    padding=1,          // space around the pcb (between pcb and box)
    thickness=3,        // thickness of the material to create the box
    pcbThickness=1.6,   // thickness of the box
    topToTop=20,        // distance from the top of the PCB to the external top of the box
    bottomToBottom=40,  // distance from the bottom of the PCB to the external bottom of the box
    extend=10,          // should top and bottom 'extend' in order to assemble the box without glue
    screws=[            // position of holes to fix the PCB
        [5,5],
        [10,70],
        [85,15],
        [80,60]
    ],
    screwDiameter=3,    // diameter of the screws to fix the PCB
    topHoles=[          // holes to put on the top of the box
        [20,20,30,10]   // 0,0 is the bottom left of the PCB
    ],
    bottomHoles=[       // holes to put on the bottom of the box
        [40,40,10],     // array witlh 3 parameters = a circle [x,y,diameter]
        [20,20,5,5]     // array with 4 parameters = a rectangle [x,y,width,depth]
    ],
    frontHoles=[        // holes in front of the box, over the PCB
        [20, 2.5, 5],
        [40,5,10,10]
    ],
    frontHolesB=[       // holes in front of the box, under the PCB
        [20,2.5,5],
        [40,5,10,10]
    ],
    backHoles=[         // holes in the back of the box, over the PCB
        [20,2.5,5],
        [40,5,10,10]
    ],
    backHolesB=[        // holes in front of the box, under the PCB
        [20,2.5,5],
        [40,5,10,10]
    ],
    leftHoles=[         // holes on the left of the box, over the PCB
        [20,2.5,5],
        [40,5,10,10]
    ],
    leftHolesB=[        // holes on the left of the box, under the PCB
        [20,2.5,5],
        [40,5,10,10]
    ],
    rightHoles=[        // holes on the right of the box, over the PCB
        [20,2.5,5],
        [40,5,10,10]
    ],
    rightHolesB=[       // holes on the right of the box, under the PCB
        [20,2.5,5],
        [40,5,10,10]
    ],
    showLabels=true,    //should we show the labels
    labelsSize=10,      // size of the labels
    3d=true             // 3d rendering or just 2d ?
);
