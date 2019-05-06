$fn=40;

use <../pcbbox/pcb.scad>;

pcb(
    3d=true,            // 3d rendering or just 2d ?,
    active=[1,1,1,1,1,1],  // which faces should be rendered
    length=85.090,         // length of the PCB
    width=74.930,           // width of the PCB
    padding=1,          // space around the pcb (between pcb and box)
    thickness=3,        // thickness of the material to create the box
    pcbThickness=1.6,   // thickness of the box
    
    topToTop=16.4,        // distance from the top of the PCB to the external top of the box
    bottomToBottom=10,  // distance from the bottom of the PCB to the external bottom of the box
    extend=5,          // should top and bottom 'extend' in order to assemble the box without glue
    screws=[            // position of holes to fix the PCB
        [3.175,3.175],
        [3.175,71.755],
        [81.915,3.175],
        [81.915,71.755]
    ],
    screwDiameter=3,    // diameter of the screws to fix the PCB
    topHoles=[          // holes to put on the top of the box
        [-0.635+10.16,31.750,20.320,14.605],   // 0,0 is the bottom left of the PCB
        [-0.635+10.16,48.260,20.320,14.605],
        [15.875, 72.390, 16.510, 4.445]
    ],
    bottomHoles=[       // holes to put on the bottom of the box
           // array witlh 3 parameters = a circle [x,y,diameter]
                        // x position of the center
                        // y position of the center
                        // diamseter of the circle
           // array with 4 parameters = a rectangle [x,y,width,height]
                        // x position of the center of the rectangle
                        // y position of the center of the rectangle
                        // width of the rectangle
                        // height of the rectangle
    ],
    frontHoles=[        // holes in front of the box, over the PCB
        [60, 2.5, 4],
        [66, 2.5, 4],
        [72, 2.5, 4],
        [42.5, 5, 15, 5]
    ],
    frontHolesB=[       // holes in front of the box, under the PCB
  
    ],
    backHoles=[         // holes in the back of the box, over the PCB
         [60, 2.5, 4],
        [66, 2.5, 4],
        [72, 2.5, 4]
    ],
    backHolesB=[        // holes in front of the box, under the PCB
       
    ],
    leftHoles=[         // holes on the left of the box, over the PCB
        [17.1,5.9 ,7] 
        
    ],
    leftHolesB=[        // holes on the left of the box, under the PCB

    ],
    rightHoles=[        // holes on the right of the box, over the PCB
      [26.35, 3.65 ,6.5],
      [42.15, 3.65 ,6.5] // temperature 'audio'
    ],
    rightHolesB=[       // holes on the right of the box, under the PCB
  
    ],
    showLabels=true,    //should we show the labels
    labelsSize=10,      // size of the labels
    specialFingers=[undef,undef,undef,undef,undef,undef]
                        // for a normal box you should leave the default. However what is currently
                        // supported is to specify either on 'top' (first element of the array) or the
                        // 'bottom' (second element in the array) that is is fully female (2) or male (3).
);
