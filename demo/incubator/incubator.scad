$fn=40;

use <../../pcbbox/pcb.scad>;

3d=false;

showLabels=false;

topToTop=16;
bottomToBottom=24;
padding=1;

cellInternal=12.6;
cellWall=3.06;
cellFingerWidth=4;
cellX=(34.29+52.975)/2;
cellY=(22.225+2.54)/2;


length=99.9;
width=73.6;

pcb(
    length=length,         // length of the PCB
    width=width,           // width of the PCB
    padding=padding,          // space around the pcb (between pcb and box)
    thickness=cellWall,        // thickness of the material to create the box
    pcbThickness=1.6,   // thickness of the box
    topToTop=topToTop,        // distance from the top of the PCB to the external top of the box
    bottomToBottom=bottomToBottom,  // distance from the bottom of the PCB to the external bottom of the box
    extend=3,          // should top and bottom 'extend' in order to assemble the box without glue
    screws=[            // position of holes to fix the PCB
        [3.81,3.81],
        [95.25,3.81],
        [3.81,69.85],
        [95.25,69.85]
    ],
    screwDiameter=3.2,    // diameter of the screws to fix the PCB
    topHoles=[          // holes to put on the top of the box
         [38.6 + 20/2, 10.6 + 7/2, 20, 7],
	 // fan
         [27.1 + 50/2, 21.1 + 50/2, "Fan50" ]
    ],
    bottomHoles=[          // holes to put on the top of the box
         [length/2, width/2, "hexagon" ]
    ],
    leftHoles=[
      [43.8, 5.3, 7.6],    // temperature connector
      [58.4, 5.3, 7.6]    // temperature connector
    ],
    showLabels=showLabels,    //should we show the labels
    labelsSize=10,      // size of the labels
    3d=3d,            // 3d rendering or just 2d ?,
    show="all"          // used for 3D printing. Possible values:
                        // all (default), top, bottom, fulltop (5 faces), fullbottom (5 faces)
);




