

void setupToolbar(){
  toolbar = getToolbar(toolbarData,conditionalReference);
}

class Toolbar{
String[] buttons;
color[] cols;
int index, bSize, index2;
Toolbar(String[] b,int s,color[] cl){
  buttons=b.clone();
  cols=cl.clone();
  index2=0; index=1; bSize=s;
  
}
void select(int i){
  if(mouseButton==LEFT){
  index=i;
  }else{
  index2=i;
  }
  
}
String current(){
  
  if(mouseButton==LEFT){
  return buttons[index];
  }else{
  return buttons[index2];
  }
}

void display(){
  rectMode(CORNER);
  
  fill(145,131,64);
  rect(0,0,bSize,width);
  
  for(int i=0;i<cols.length;i++){
  fill(color(cols[i]));
  if(i==index){stroke(255,0,0);}
else if(i==index2){stroke(0,0,255);}
else{noStroke();}
  rect(i*bSize,0,bSize-1,bSize-1);
  }
}
}

void tool(int x,int y,Toolbar t){
  int i=xyi(int((x-dOffX)/pSize),int((y-dOffY)/pSize));
  int gv=gridValues[i];
  int gt=gridTypes[i];
  if(t.current().endsWith("power")){
  if(gt!=0&&gv==0){gridValues[i]=10;}
  }
  else{
  String[] s = split(t.current(),'>');
  int nType = int(s[1]);
  
  if(s[0].contains(","+str(gt)+",")){gridTypes[i]=nType;}
  }
}

//int tv(int
