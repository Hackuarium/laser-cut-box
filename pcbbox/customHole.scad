use <side.scad>;

module customHole(kind, parameters) {
    if (kind=="Custom") {
        echo("Custom hole was not implemented");
    } else if (kind=="Nema23") {
        circle(d=11);
        translate([47.14/2,47.14/2]) circle(d=3.3);
        translate([-47.14/2,47.14/2]) circle(d=3.3);
        translate([47.14/2,-47.14/2]) circle(d=3.3);
        translate([-47.14/2,-47.14/2]) circle(d=3.3);
    } else if (kind=="Fan50") {
        circle(d=40);
        translate([20,20]) circle(d=3.3);
        translate([-20,20]) circle(d=3.3);
        translate([20,-20]) circle(d=3.3);
        translate([-20,-20]) circle(d=3.3);
    } else if (kind=="Peristaltic") {
        interHole=49;
        rotate(45) {
            circle(d=29);
            translate([-interHole/2,0]) circle(d=3.3);
            translate([interHole/2,0]) circle(d=3.3);
        }
    } else if (kind=="LoadingCell") {
        rotation=parameters[0];
        width=16;
        total=80;
        hole=52;
        rotate(a=rotation) {
            translate([-total/2,-width/2]) {
                square([hole,width]);
                translate([hole+8,width/2]) circle(d=4.4);
                translate([hole+23,width/2]) circle(d=4.4);
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
            square([parameters[0]-2*parameters[2], parameters[1]-2*parameters[2]],true);
        }
        
    }
}