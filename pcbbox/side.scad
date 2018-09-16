use <customHole.scad>;

module side(
    width,
    height,
    thickness,
    fingerWidth,
    male=[0,0,0,0],  // 0 female, 1 male, 2 full female, 3 full male
    name="",
    sideColor="yellow",
    labelsSize=10,
    showLabels=false,
    holes=[],
    3d=false,
    extend=0,
    textRotation=0,
) {
    if (showLabels) {
        textRotation=((width<height) ? 90 : 0) + textRotation;
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
                    translate([-extend, -extend])
                        square([width+extend*2, height+extend*2]);

                    translate([0, 0, 0]) rotate([0,0,0])
                        anyFingers(width, fingerWidth, thickness, male[0]);
                    
                    translate([thickness, 0, 0]) rotate([0,0,90])
                        anyFingers(height, fingerWidth, thickness, male[1]);
                    
                    translate([0, height-thickness, 0])
                        anyFingers(width, fingerWidth, thickness, male[2]);
                    
                    translate([width, 0, 0]) rotate([0,0,90])
                        anyFingers(height, fingerWidth, thickness, male[3]);
                    
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

module anyFingers(length, fingerWidth, thickness, kind) {
    if (kind==0) {
        fingers(length, fingerWidth, thickness);
    } else if (kind==1) {
        invertedFingers(length, fingerWidth, thickness);
    } else if (kind==2) {
        square( [length, thickness] );
    } else if (kind==3) {

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