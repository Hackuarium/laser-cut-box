$fn=40;

use <../pcbbox/pcb.scad>;

3d=false;

showLabels=false;

cellInternal=12.6;
cellWall=3.06; // currently same as thickness of material of the full box
cellFingerWidth=4;
topToTop=12;
bottomToBottom=20;
padding=1;

translation = (3d) ?
    [(34.29+52.975)/2+cellWall-padding-cellInternal/2,(22.225+2.54)/2+cellWall-padding-cellInternal/2, 0] :
    [-(cellInternal+2*cellWall)*3.5,0];

translate(translation)
pcb(
  length=cellInternal,
  width=cellInternal,
  thickness=cellWall,
  pcbThickness=1.6,
  topToTop=topToTop,
  bottomToBottom=bottomToBottom,
  extend=0,
  padding=0,
  fingerWidth=cellFingerWidth,
  leftHolesB=[
    [cellInternal/2, 2.5, 2.5, 5]
  ],
  rightHolesB=[
    [cellInternal/2, 2.5, 2.5, 5]
  ],
  backHolesB=[
    [cellInternal/2, 2.5, 5, 5]
  ],
  frontHolesB=[
  ],
  3d=3d,
  active=[0,0,1,1,1,1],
  specialFingers=[undef,3] // specify the kind of finger that should be used
);

pcb(
    length=99.1,         // length of the PCB
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
         [
            (34.29+52.975)/2,
            (22.225+2.54)/2,
            "Insert",
            cellInternal+cellWall*2,
            cellInternal+cellWall*2,
            cellWall, // thickness of wood
            cellFingerWidth
         ],
         [13.4 + 71.6/2, 40.5 + 25.1/2, 71.6, 25.1],
         [85.05, 12.61, 8]
      
    ],
    rightHoles=[        // holes on the right of the box, over the PCB
       [43.18, 2.25, 8.4, 4.5]
    ],
    rightHolesB=[],
    showLabels=showLabels,    //should we show the labels
    labelsSize=10,      // size of the labels
    3d=3d,            // 3d rendering or just 2d ?,
    show="all"          // used for 3D printing. Possible values:
                        // all (default), top, bottom, fulltop (5 faces), fullbottom (5 faces)
);




