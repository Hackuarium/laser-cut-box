$fn=40;

use <../../pcbbox/pcb.scad>;

3d=true;

showLabels=false;

topToTop=12;
bottomToBottom=20;
padding=1;

cellInternal=12.6;
cellWall=3.06;
cellFingerWidth=4;
cellX=(34.29+52.975)/2;
cellY=(22.225+2.54)/2;

translation = (3d) ?
    [cellX+padding-cellInternal/2, cellY+padding-cellInternal/2, 0] :
    [-(cellInternal+2*cellWall)*3.5,0];

translate(translation)

pcb(
    length=99.9,         // length of the PCB
    width=73.6,           // width of the PCB
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
         [13.4 + 71.6/2, 40.5 + 25.1/2, 71.6, 25.1],
         [85.05, 12.61, 8]
    ],
    bottomHoles=[          // holes to put on the top of the box
         [38.6 + 20/2, 10.6 + 7/2, 20, 7]
    ],
    leftHolesB=[
      [14.1, 5.3, 8.6]    // power connector
    ],
    showLabels=showLabels,    //should we show the labels
    labelsSize=10,      // size of the labels
    3d=3d,            // 3d rendering or just 2d ?,
    show="all"          // used for 3D printing. Possible values:
                        // all (default), top, bottom, fulltop (5 faces), fullbottom (5 faces)
);




