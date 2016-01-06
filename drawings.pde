int saturation = 255;// [0-256)
int brigthness = 0;  // [0-256)

void draw_tricolordots(int j, int i, color col, int maxsize){
      //generate a radian to spin the pie chart randomly. This keeps the final result from looking too systematic
      float spin = radians(random(0,360));//radians(((j*7) * (i*13)) % 360);
      //this gets the greyscale [0-256) value of the paramter colour. This will determine how large the circle will be.
      float bnw = (red(col) + green(col) + blue(col))/3;
      int sz = round(map(bnw, 0, 255, 1, maxsize));
      //the following give decimal [0.0-1.0] of how much red, green and blue are in the color
      float totalcol = red(col) + green(col) + blue(col);
      float redamount = red(col)/totalcol;
      float greenamount = green(col)/totalcol;
      float blueamount = blue(col)/totalcol;
      
      // draws circles
      //red segment
      fill(saturation,brigthness,brigthness);
      arc(j,i,sz,sz,spin + 0,spin + (2*PI)*redamount);
      //green segment
      fill(brigthness,saturation,brigthness);
      arc(j,i,sz,sz,spin + (2*PI)*redamount,spin + (2*PI)*redamount + (2*PI)*greenamount);
      //blue segment
      fill(brigthness,brigthness,saturation);
      arc(j,i,sz,sz,spin + (2*PI)*redamount + (2*PI)*greenamount, spin + (2*PI)*redamount + (2*PI)*greenamount + (2*PI)*blueamount);
}


//get average color of area
color getAvgColor(int x, int y, int x2, int y2){
  int r = 0;
  int g = 0;
  int b = 0;
  
  //get the sum of the red, green and blue values of all pixels in the box (x,y,x2,y2)
  for(int i = y; i < y2;i++){
   for(int j = x; j < x2; j++){
      color col = getColAt(j,i);
      r += red(col);
      g += green(col);
      b += blue(col);
   }
  }
  //get the average of the red, green and blue values by deviding the sum of each by the number of pixels in the box
  int areaOfBox = (x2-x)*(y2-y);
  r = r/(areaOfBox);
  g = g/(areaOfBox);
  b = b/(areaOfBox);
  return color(r,g,b);
}
 
color getColAt(int x, int y){
    int pos = x + (y*Global_Img.width);
    return Global_Img.pixels[pos];
}