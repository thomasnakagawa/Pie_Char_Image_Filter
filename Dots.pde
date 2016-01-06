PImage Global_Img; 
int    Global_Gridsize = 20;
String Global_FileName = "stripes.bmp";

void setup(){
   Global_Img = loadImage(Global_FileName);
   
   // screen size of 1600 by 900. Processing doesnt let you change the windows size with variables.
   Global_Img.resize(1600,900);
   
   createImage(Global_Gridsize);
   fullScreen();
} //<>//

void keyPressed(){
    if(key == CODED){
       if(keyCode == UP){
           Global_Gridsize++;
           createImage(Global_Gridsize); 
       }
       else if(keyCode == DOWN){
           Global_Gridsize--;
           createImage(Global_Gridsize); 
       }
    }
} 

void createImage(int gridsz){
   int offset = gridsz/2;
   background(0);
   strokeWeight(0);
   ellipseMode(CENTER);
   for(int i = 0; i < Global_Img.height-gridsz; i += gridsz){
     for(int j = 0; j < Global_Img.width-gridsz; j += gridsz){
        color temp = getAvgColor(j,i, j+gridsz, i+gridsz);
        draw_tricolordots(j+offset,i+offset,temp, gridsz);
     }
   }
}