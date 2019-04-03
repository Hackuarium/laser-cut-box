use <side.scad>;

module customHole(kind, parameters) {
    if (kind=="Custom") {
        echo("Custom hole was not implemented");
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