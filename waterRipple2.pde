int cols; // =600;
int rows; // =400;
float [][] current; //= new float[cols][rows];
float [][] previous;// = new float[cols][rows];
int sz;
float dampening = 0.8;
void setup(){
 
  size(800,800);
  sz = width/100;
  cols = width/sz;
  rows = width/sz;
  current = new float[cols][rows];
  previous = new float[cols][rows];
 
  /*
  for(int i =1; i <cols-1; i++){
    for(int j =1; j <rows-1; j++){
      current[i][j]= int(random(100));
      previous[i][j]= int(random(100));
    }
  }
  */
  //current[100][100]=255;
  //previous[300][200]=255;
 
}

void mousePressed(){
  int x = int(map(mouseX,0,width,0,99));
  int y = int(map(mouseY,0,height,0,99));
  current[x][y] =  255;//random(20,255); // 255 can make this smaller to make it less white
  dampening = random(0.9,0.999);
 
}



void draw(){
 background(20,170,242);
  //loadPixels();
  for(int i =1; i <cols-1; i++){
    for(int j =1; j <rows-1; j++){
      current[i][j] = (
        previous[i-1][j]+
        previous[i+1][j]+
        previous[i][j-1]+
        previous[i][j+1]) / 2 -
        current[i][j];
      current[i][j] = current[i][j] * dampening;
        
        
      //int index = i+j*cols;
      //pixels[index] = color(current[i][j]*255);
      noStroke();
      fill(current[i][j]*20,current[i][j]*150,200);
      rect(i*sz,j*sz,sz,sz);
     }
    
  }
  //updatePixels();
 
  float[][] temp = previous;
  previous = current;
  current = temp;
}
