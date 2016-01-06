PImage Img; 
int gridsize = 20;

void setup(){
   Img = loadImage("stripes.bmp");
   //size(1600,900);
   Img.resize(1600,900);
   createImage(gridsize);
   fullScreen();
} //<>//


void draw(){

}

void keyPressed(){
    if(key == CODED){
       if(keyCode == UP){
           gridsize++;
           createImage(gridsize); 
       }
       else if(keyCode == DOWN){
           gridsize--;
           createImage(gridsize); 
       }
    }
} 

void createImage(int gridsz){
   int offset = gridsz/2;
   background(0);
   strokeWeight(0);
   ellipseMode(CENTER);
   for(int i = 0; i < Img.height-gridsz; i += gridsz){
     for(int j = 0; j < Img.width-gridsz; j += gridsz){
        color temp = getAvgColor(j,i, j+gridsz, i+gridsz);
        draw_tricolordots(j+offset,i+offset,temp, gridsz);
        //draw_discretecolordots(j,i,temp);
     }
   }
}