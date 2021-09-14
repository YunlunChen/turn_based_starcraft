/**
 * Yellowtail
 * by Golan Levin (www.flong.com). 
 * 
 * Click, drag, and release to create a kinetic gesture.
 * 
 * Yellowtail (1998-2000) is an interactive software system for the gestural 
 * creation and performance of real-time abstract animation. Yellowtail repeats 
 * a user's strokes end-over-end, enabling simultaneous specification of a 
 * line's shape and quality of movement. Each line repeats according to its 
 * own period, producing an ever-changing and responsive display of lively, 
 * worm-like textures.
 */
int unit_temp[]=new int [2];

String units []=new String [20];

void setup() {
  //size(1024, 768, P2D);
  //background(0, 0, 0);
  //noStroke();
  add_units();
  int map[][][]=new int [10][20][2];
  set_unit(0,1);
  map[0][10]=unit_temp;
  set_unit(1,1);
  map[9][9]=unit_temp;


}
void set_unit(int x, int y){
  unit_temp[0]=x;
  unit_temp[1]=y;  
}

void add_units(){
  units[1]="king";
  units[2]="worker";
  units[3]="knight";
  units[4]="archer";
  units[5]="soldier";
  units[6]="shilder";
  units[7]="archer_towers";
  units[8]="walls";
  units[9]="camp";
  units[10]="mines";
}

void king (){
  int health=10;
  int range=1;
  int move[][]={{-1,-1},{-1,1},{0,-2},{0,2},{1,-1},{1,1}};
  int damage=1;
  int cost=1000;
}

void worker (){  //can create archer towers:3hp, walls:8hp, camp:5hp, mines:5hp.
  int health=10;
  int move[][]={{-1,-1},{-1,1},{0,-2},{0,2},{1,-1},{1,1}};
  int resources=10;
  int cost=10;
}

void knight (){  //fast moving, hard to change move direction, higher damage facing moving direction
  int health=4;
  int range=1;
  int move[][]={{-2,-2},{2,2},{-1,-1},{-1,1},{0,-4},{0,-2},{0,2},{0,4},{1,-1},{1,1},{2,-2},{2,2}};
  int damage=2;
  int direction=0; //0: no direction,  1:left up,  2:right up,  3:left,  4:right,  5:left down,  6:right down
  int cost=50;
}

void archer (){  //long range character, deals 1 damage to shild and structures, deals less damage to enemies besides it, attack range increases by staying in one place, range increases when standing on tower, can shoot past anything except enemy walls.
  int health=2;
  int range=2;
  int move[][]={{-1,-1},{-1,1},{0,-2},{0,2},{1,-1},{1,1}};
  int damage=2;
  int moving=0;
  int cost=30;
}

void soldier (){  //basic infentary, cost less
  int health=4;
  int range=1;
  int move[][]={{-1,-1},{-1,1},{0,-2},{0,2},{1,-1},{1,1}};
  int damage=1;
  int cost=20;
}

void shilder (){  //has a shield, shield takes 1 less damage while not moving
  int health=4;
  int shield=4;
  int range=1;
  int move[][]={{-1,-1},{-1,1},{0,-2},{0,2},{1,-1},{1,1}};
  int damage=1;
  int moving=0;
  int cost=30;
}

void archer_towers (){  //increases the abilities of archers
  int health=3;
  int move[][]={{0,0}};
  int moving=0;
  int cost=4;
  int time=4;
}

void walls (){  //blocks enemies and protetct allies
  int health=8;
  int move[][]={{0,0}};
  int moving=0;
  int cost=2;
  int time=2;
}

void camp (){  //can spawn allies in camp and increases the maximum amount of allies avalible
  int health=5;
  int move[][]={{0,0}};
  int moving=0;
  int cost=5;
  int time=5;
}

void mines (){  //increases the production of minnerals
  int health=5;
  int move[][]={{0,0}};
  int moving=0;
  int cost=5;
  int production=5;
  int time=5;
}



void draw() {
  background(0);

  updateGeometry();
  fill(255, 255, 245);
  for (int i = 0; i < nGestures; i++) {
    renderGesture(gestureArray[i], width, height);
  }
}
