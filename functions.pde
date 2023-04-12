
boolean[][] conductition;







boolean validTransfer(int myValue,int otherValue,int myType, int otherType){
  if(conductition[myType][otherType]){
    if(myValue==0&&otherValue==10){
      return true;
    }
  }
return false;
}

int gridValue(int x,int y){
return gridValues[constrainIndex(x,y)];
}
int gridType(int x,int y){
return gridTypes[constrainIndex(x,y)];
}
void setValue(int x,int y, int v){
gridValues[constrainIndex(x,y)]=v;
}
void setNValue(int x,int y, int v){
nGridValues[constrainIndex(x,y)]=v;
}
void setType(int x,int y, int v){
gridTypes[constrainIndex(x,y)]=v;
}
void setNType(int x,int y, int v){
nGridTypes[constrainIndex(x,y)]=v;
}

int constrainIndex(int x,int y){
while(x<0){x+=sWidth;}
while(x>sWidth-1){x-=sWidth;}
while(y<0){y+=sHeight;}
while(y>sHeight-1){y-=sHeight;}
return xyi(x,y);
}



void lightning(int x, int y, float power){

}
