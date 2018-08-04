use <customHole.scad>;

module side(
    width,
    height,
    thickness,
    fingerWidth,
    male=[0,0,0,0],
    name="",
    sideColor="yellow",
    labelsSize=10,
    showLabels=false,
    holes=[],
    3d=false,
    extend=0
) {
    if (showLabels) {
        textRotation=(width<height) ? 90 : 0;
        color("red")
            translate([0,0,thickness])
                rotate([0,0,textRotation])
                    text(text = name, size = labelsSize, halign = "center", valign="center");
    }
    color(sideColor) 
    translate([-width/2, -height/2])
       conditionalExtrude(thickness=thickness, 3d=3d) {
            difference() {
                // we create the side
                    translate([-extend/2, -extend/2])
                        square([width+extend, height+extend]);

                    if (male[0]==0) {
                        fingers(width, fingerWidth, thickness);
                    } else {
                        invertedFingers(width, fingerWidth, thickness);
                    }
                    
                    translate([thickness, 0, 0]) rotate([0,0,90])
                        if (male[1]==0) {
                            fingers(height, fingerWidth, thickness);
                        } else {
                            invertedFingers(height, fingerWidth, thickness);
                        }
                    
                    translate([0, height-thickness, 0])
                        if (male[2]==0) {
                            fingers(width, fingerWidth, thickness);
                        } else {
                            invertedFingers(width, fingerWidth, thickness);
                        }
                    
                    translate([width, 0, 0]) rotate([0,0,90])
                        if (male[3]==0) {
                            fingers(height, fingerWidth, thickness);
                        } else {
                            invertedFingers(height, fingerWidth, thickness);
                        }
                    
                    for (hole = holes) {
                        translate([hole[0] + thickness, hole[1] + thickness]) 
                        if (hole[2][0]==undef) {// third element is a number
                            if (hole[3]==undef) { // a circle
                                circle(d=hole[2]);
                            } else { // a rectangle
                                square([hole[2], hole[3]], center=true);
                            }
                        } else { // custom module
                            customHole(kind=hole[2], parameters=[ for (i=[3:1:len(hole)-1]) hole[i] ]);
                        }
                    }
                    
                }
       } 

}

module conditionalExtrude(thickness, 3d) {
    if (3d) {
        translate([0,0,-thickness/2])
        linear_extrude(height=thickness) children();
    } else {
        children();
    }
    
}

module invertedFingers(width, fingerWidth, thickness) {
    color("red") difference() {
        square([width, thickness]);
        fingers(width, fingerWidth, thickness);
    }
}

module fingers(width, fingerWidth, thickness) {
    fingerNumber=floor((width-2*thickness-fingerWidth)/(fingerWidth*2));
    fingerStart=(width-(fingerNumber*2-1)*fingerWidth)/2;
    for (i= [0:1:fingerNumber-1]) {
        color("green")
            translate([fingerStart+i*2*fingerWidth,0,0])
                square( [fingerWidth, thickness] );
    }
}