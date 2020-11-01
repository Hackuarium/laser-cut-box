$fn=40; // defines the resolution for calculation by OpenSCAD

3d=false;

use <../pcbbox/box.scad>;

extend=10;
thickness=5.2;

height=75 + 2 * thickness;

heatingPlateSize=214;
heatingPlateGap=2 + thickness;
heatingPlateThickness=2.2;

// position of the 4 corner screws that allows to close the box
screwDiameter=4;
screwDistance=5+screwDiameter/2; // distance from internal corner to center of screw

externalSize=heatingPlateSize-2*heatingPlateGap-2*extend;
internalSize=externalSize-2*thickness;
internalHeight=height-2*thickness;

pcbWidth=87.00;
pcbLength=100.15;
pcbHShift=(internalSize-pcbWidth)/2; // based on position of holes
pcbVShift=internalSize-pcbWidth;
pcbHHoles=91.44; // distance between holes
pcbVHoles=78.44;
pcbScrewDiameter=3.3;
pcbBackHoleWidth=pcbHHoles-pcbScrewDiameter*2;
pcbBackHoleHeight=16;
pcbBackHoleX=pcbHShift+pcbWidth/2+pcbScrewDiameter;
pcbBackHoleY=pcbBackHoleHeight/2+9;

translate([heatingPlateSize*2+extend*2+20,0])
box(
    3d=3d, // true: render as 3D, false: render as 2D (for laser cutting)
    width=externalSize, // width of the box
    depth=externalSize, // depth of the box
    height=height, // height of the box
    thickness=thickness, // thickness of the wood
    fingerWidth=22, // if undefine 2 times the thickness
    labelsSize=10, 
    showLabels=false,
    extends=[extend,extend,0,0,0,0],
    labels=["Top","Bottom","Left","Right","Front","Back"],
    space=2, // space between the parts when rendering as 2D
    active=[1,1,1,1,1,1],  // side that should be displayed
    specialFingers=[1,1,1,1,1,1],
                        // for a normal box you should leave the default. However what is currently
                        // supported is to specify either on 'top' (first element of the array) or the
                        // 'bottom' (second element in the array) that is is fully female (2) or male (3).
    holes=[ // relative to the inside of the box
        [
            // the screws
             [screwDistance,screwDistance,screwDiameter],
             [internalSize-screwDistance,screwDistance,screwDiameter],
             [internalSize-screwDistance,internalSize-screwDistance,screwDiameter],
             [screwDistance,internalSize-screwDistance,screwDiameter],
             // Loading cells
            [20, internalSize/2, "LoadingCell", 90 ],
            [20, internalSize/2, "LoadingCell", -90 ],
            [internalSize-20, internalSize/2, "LoadingCell", 90 ],
            [internalSize-20, internalSize/2, "LoadingCell", -90 ],
             // stepper
            [internalSize/2, internalSize/2, "Nema17" ],
            // hole for the heating power
            [internalSize/2,15,30,15],
            // holes for loading cell PCB
            [internalSize/2, internalSize/5*4, "RectangularHoles",29.21,18.41,3.3 ],
            // some air circulation
          
        ], // top
        [
            // the screws
             [screwDistance,screwDistance,screwDiameter],
             [internalSize-screwDistance,screwDistance,screwDiameter],
             [internalSize-screwDistance,internalSize-screwDistance,screwDiameter],
             [screwDistance,internalSize-screwDistance,screwDiameter],
             // PCB screws
             [pcbHShift,pcbVShift,pcbScrewDiameter],
             [pcbHShift+pcbHHoles,pcbVShift,pcbScrewDiameter],
             [pcbHShift,pcbVShift+pcbVHoles,pcbScrewDiameter],
             [pcbHShift+pcbHHoles,pcbVShift+pcbVHoles,pcbScrewDiameter],
        ], // bottom
        [
            // peristaltic pump
            [40, 30, "Peristaltic", -60 ],
            // fan
            [internalSize-50, internalHeight/2, "Fan50" ],
            
        ], // left
        [
            // peristaltic pump
            [40, 30, "Peristaltic", 60 ],
            
        ], // right
        [], // front
        [
            // hole for the PCB connector
            [internalSize-pcbBackHoleX,internalHeight-pcbBackHoleY,pcbBackHoleWidth,pcbBackHoleHeight],

        ] // back
    ]
);


// translate([extend,extend,20]) square([heatingPlateSize,heatingPlateSize]);

//translate([heatingPlateSize-10-thickness-2,-10-thickness-2,height+30+20])
//rotate([0,180,0])

box(
    3d=3d, // true: render as 3D, false: render as 2D (for laser cutting)
    width=heatingPlateSize, // width of the box
    depth=heatingPlateSize, // depth of the box
    height=30, // height of the box
    thickness=thickness, // thickness of the wood
    fingerWidth=5, // if undefine 2 times the thickness
    labelsSize=10, 
    showLabels=false,
    extends=[extend,extend,0,0,0,0],
    labels=["Top","Bottom","Left","Right","Front","Back"],
    space=2, // space between the parts when rendering as 2D
    active=[0,1,1,1,1,1],  // side that should be displayed
    specialFingers=[2,1,1,1,1,1],
                        // for a normal box you should leave the default. However what is currently
                        // supported is to specify either on 'top' (first element of the array) or the
                        // 'bottom' (second element in the array) that is is fully female (2) or male (3).
    holes=[ // relative to the inside of the box
        [
        ], // top
        [
          [heatingPlateSize/2-thickness,heatingPlateSize/2-thickness,heatingPlateSize-40,heatingPlateSize-40],
         //  [heatingPlateSize/2-thickness,heatingPlateSize/2-thickness,"Grid",heatingPlateSize-30,heatingPlateSize-30,10,10]
        // hole for the heating power
           [heatingPlateSize/2-thickness,12,60,15],
        ], // bottom
        [], // left
        [], // right
        [], // front
        [] // back
    ]
);
