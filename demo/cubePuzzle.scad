$fn=40;

use <../pcbbox/cubePuzzle.scad>;

seed=48;

size=5;
corners=[for (i=rands(0,3,8,seed)) (floor(i))];
endIndex=size-3;

echo(corners);


edges=  [
            for (i=[0:1:11])
                [for (j=rands(0,2,(size-2),seed+i)) (j<1) ]   
        ];
          
echo(edges[0]);
echo(invert(edges[0]));

    
function invert(values) =
    [for (i=[len(values)-1:-1:0]) ! values[i]];


!cubePuzzle(
    thickness=5,
    fingers=[
        concat(corners[3]==0, edges[0], corners[0]==0), // top
        concat(corners[0]==0, edges[1], corners[1]==0),
        concat(corners[1]==0, edges[2], corners[2]==0),
        concat(corners[2]==0, edges[3], corners[3]==0),
        
        concat(corners[4]==0, edges[4], corners[5]==0), // bottom
        concat(corners[5]==0, edges[5], corners[6]==0),
        concat(corners[6]==0, edges[6], corners[7]==0),
        concat(corners[7]==0, edges[7], corners[4]==0),
        
        concat(corners[7]==1, invert(edges[11]), corners[3]==1), // left
        concat(corners[3]==1, invert(edges[3]),  corners[2]==2),
        concat(corners[2]==2, edges[10],         corners[4]==2),
        concat(corners[4]==2, invert(edges[7]),  corners[7]==1),
    
        concat(corners[0]==2, edges[8],         corners[6]==2), // right
        concat(corners[6]==2, invert(edges[5]), corners[5]==1),
        concat(corners[5]==1, invert(edges[9]), corners[1]==1),
        concat(corners[1]==1, invert(edges[1]), corners[0]==2),
        
        concat(corners[2]==1, invert(edges[2]),  corners[1]==2), // front
        concat(corners[1]==2, edges[9],          corners[5]==2),
        concat(corners[5]==2, invert(edges[4]),  corners[4]==1),
        concat(corners[4]==1, invert(edges[10]), corners[2]==1),
        
        concat(corners[7]==2, invert(edges[6]), corners[6]==1), // back
        concat(corners[6]==1, invert(edges[8]), corners[0]==1),
        concat(corners[0]==1, invert(edges[0]), corners[3]==2),
        concat(corners[3]==2, edges[11],        corners[7]==2),
    ],
    labelsSize=6, 
    showLabels=true,
    3d=false,
    space=2
);





cubePuzzle(
    thickness=5,
    fingers=[
        [1,1,0,1,1],
        [1,0,1,0,0],
        [0,1,0,1,1],
        [1,0,1,0,1],
        
        [0,1,0,1,0],
        [0,0,1,0,1],
        [1,1,0,1,0],
        [0,0,1,0,0],
        
        [0,1,0,1,0],
        [0,0,1,0,1],
        [1,1,0,1,0],
        [0,0,1,0,0],
        
        [0,1,0,1,0],
        [0,0,1,0,1],
        [1,1,0,1,0],
        [0,0,1,0,0],
        
        [0,1,0,1,0],
        [0,0,1,0,1],
        [1,1,0,1,0],
        [0,0,1,0,0],
        
        [0,1,0,1,0],
        [0,0,1,0,1],
        [1,1,0,1,0],
        [0,0,1,0,0],
    ],
    labelsSize=6, 
    showLabels=false,
    3d=false,
    space=2
);


        
