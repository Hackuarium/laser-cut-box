$fn=40; // defines the resolution for calculation by OpenSCAD

use <../pcbbox/box.scad>;

extend=10;
thickness=5;

height=80;

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
pcbBackHoleY=pcbBackHoleHeight/2+3;

box(
    3d=true, // true: render as 3D, false: render as 2D (for laser cutting)
    width=externalSize, // width of the box
    depth=externalSize, // depth of the box
    height=height, // height of the box
    thickness=thickness, // thickness of the wood
    fingerWidth=22, // if undefine 2 times the thickness
    labelsSize=10, 
    showLabels=true,
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
            [30, 60, "LoadingCell", 90 ],
            [internalSize-30, 60, "LoadingCell", 90 ],
            [internalSize-70, internalSize-30, "LoadingCell", 0 ],
             // stepper
            [internalSize/2, internalSize/2, "Nema23" ],
            // hole for the heating power
            [internalSize/2,15,10],
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
            [40, internalHeight/2, "Peristaltic" ],
        ], // left
        [
             // peristaltic pump
            [40, internalHeight/2, "Peristaltic" ],
            // fan
            [internalSize-35, internalHeight/2, "Fan50" ],
            
        ], // right
        [], // front
        [
            // hole for the PCB connector
            [internalSize-pcbBackHoleX,internalHeight-pcbBackHoleY,pcbBackHoleWidth,pcbBackHoleHeight],

        ] // back
    ]
);
