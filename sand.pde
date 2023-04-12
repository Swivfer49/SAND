int pSize, hPSize,  sWidth, sHeight, dHeight, dWidth, indexLength, dOffX, dOffY;
int pen;
int[] gridTypes, nGridTypes, gridValues, nGridValues;
color[] gridColors;

//try to replace with primitive data types
String[] conditions;
String special;
xy arrows;
Toolbar toolbar;

XML xml, conditionsData, colorsData, toolbarData, filesData, referenceData;
reference conditionalReference;


void setup(){
  size(900,960);
  frameRate(60);
  
  //get the xml
  xml = loadXML("save.xml");
  
  //split the xml into its' parts
  conditionsData = xml.getChild("conditions");
  colorsData = xml.getChild("colors");
  toolbarData = xml.getChild("toolbar");
  filesData = xml.getChild("save-files");
  referenceData = xml.getChild("nicknames");
  
  conditionalReference = new reference(referenceData);
  setupToolbar();
  conditions = getConditions(conditionsData,conditionalReference);
  conductition = getConductitions(conditions);
  special = ",10/d5,11/d2,0/d6,";
  conditions = null;
  conditionsData = null;
  colorsData = null;
  toolbarData = null;
  referenceData = null;
  
  
  dOffX=0;
  dOffY=60;
  dWidth=width-dOffX;
  dHeight=height-dOffY;
  
  
  
  pSize = 20;
  pen = 2;
  hPSize = pSize/2;
  sWidth = (int)dWidth/pSize;
  sHeight = (int)dHeight/pSize;
  indexLength = sHeight * sWidth;
  gridValues = new int[indexLength];
  nGridValues = new int[indexLength];
  gridTypes = new int[indexLength];
  nGridTypes = new int[indexLength];
  gridColors = new color[indexLength];
  for(int i = 0;i<indexLength;i++){
  gridValues[i]=0;
  nGridValues[i]=0;
  gridTypes[i]=0;
  nGridTypes[i]=0;
  gridColors[i]=color(0);
  }
  
}

void draw(){
   
 if(mousePressed){
 if(mouseY < dOffY){
int n=int(mouseX/toolbar.bSize);
if( n<toolbar.cols.length){toolbar.select(n);}
}
else if(mouseY<height&& mouseX>0&&mouseX<width){
tool(mouseX,mouseY,toolbar);
}
 }
 
 updateGrid();
  background(0);
  toolbar.display();
  drawGrid();


}

void drawGrid(){
rectMode(CORNERS);
noStroke();
  
pushMatrix();
int i=0;
translate(dOffX,dOffY);
 for(int x=0;x<sWidth;x++){
   for(int y=0;y<sHeight;y++){
     fill(pixelColor(x,y));
     rect(x*pSize,y*pSize,x*pSize+pSize,y*pSize+pSize);
     i++;
   }
 }
 popMatrix();
}
