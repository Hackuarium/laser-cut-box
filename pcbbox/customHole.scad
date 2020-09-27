use <side.scad>;

module customHole(kind, parameters) {
    if (kind=="Custom") {
        echo("Custom hole was not implemented");
    } else if (kind=="Nema17") {
        circle(d=15);
        translate([31/2,31/2]) circle(d=3.3);
        translate([-31/2,31/2]) circle(d=3.3);
        translate([31/2,-31/2]) circle(d=3.3);
        translate([-31/2,-31/2]) circle(d=3.3);
    } else if (kind=="Nema23") {
        circle(d=11);
        translate([47.14/2,47.14/2]) circle(d=3.3);
        translate([-47.14/2,47.14/2]) circle(d=3.3);
        translate([47.14/2,-47.14/2]) circle(d=3.3);
        translate([-47.14/2,-47.14/2]) circle(d=3.3);
    } else if (kind=="SquareHoles") {
        width=25.4;
        translate([width/2,width/2]) circle(d=3.3);
        translate([-width/2,width/2]) circle(d=3.3);
        translate([width/2,-width/2]) circle(d=3.3);
        translate([-width/2,-width/2]) circle(d=3.3);
    } else if (kind=="Grid") {
        width=parameters[0];
        height=parameters[1];
        number=parameters[2];
        wall=parameters[3]; // thickness to keep

        removeWidth=(width-(number-1)*wall)/number;
        removeHeight=(width-(number-1)*wall)/number;

        difference() {
            square([width,height], center=true);
            difference() {
                square([width,height], center=true);
                translate([-width/2, -height/2])
                for (i = [0:number]) {
                        translate([i * (removeWidth + wall), 0, 0])
                        for (i = [0:number]) {
                            translate([0, i * (removeWidth + wall), 0])
                            square([removeWidth,removeHeight]);
                    }
                }
            }
        }
    } else if (kind=="Fan60") {
        diameter=7;
        distance=10;

        difference() {
            circle(d=55);
            difference() {
                circle(d=55);
                for (i = [0:10]) {
                        translate([i * distance, -25, 0])
                        for (i = [0:10]) {
                            translate([-25, i * distance, 0])
                            circle(d=diameter);
                    }
                }
            }
        }
       
        translate([25,25]) circle(d=3.3);
        translate([-25,25]) circle(d=3.3);
        translate([25,-25]) circle(d=3.3);
        translate([-25,-25]) circle(d=3.3);
    } else if (kind=="Fan50") {
        diameter=7;
        distance=10;

        difference() {
            circle(d=45);
            difference() {
                circle(d=46);
                for (i = [0:10]) {
                        translate([i * distance, -20, 0])
                        for (i = [0:10]) {
                            translate([-20, i * distance, 0])
                            circle(d=diameter);
                    }
                }
            }
        }
       
        translate([20,20]) circle(d=3.3);
        translate([-20,20]) circle(d=3.3);
        translate([20,-20]) circle(d=3.3);
        translate([-20,-20]) circle(d=3.3);
    } else if (kind=="Peristaltic") {
        rotation=parameters[0];
        interHole=49;
        rotate(rotation) {
            circle(d=29);
            translate([-interHole/2,0]) circle(d=3.3);
            translate([interHole/2,0]) circle(d=3.3);
        }
    } else if (kind=="LoadingCell") {
        rotation=parameters[0];
        cableHoleSide=parameters[1];
        width=16;
        total=83;
        hole=55;
        rotate(a=rotation) {
            translate([-total/2,-width/2]) {
                square([hole,width]);
                translate([hole+8,width/2]) circle(d=5.4);
                translate([hole+23,width/2]) circle(d=5.4);
                translate([hole+23,width/2+cableHoleSide*15]) circle(d=4);
            }
        }
    } else if (kind=="Insert") {
        side(
            width=parameters[0],
            height=parameters[1],
            thickness=parameters[2],
            fingerWidth=parameters[3],
            color="Cyan"
        );
    } else if (kind=="InsertFilled") {
        difference() {
            side(
                width=parameters[0],
                height=parameters[1],
                thickness=parameters[2],
                fingerWidth=parameters[3],
                color="Cyan"
            );
            square([parameters[0]-2*parameters[2]+0.001, parameters[1]-2*parameters[2]+0.001],true);
        }
        
    }
}