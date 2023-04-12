


color pixelColor(int x, int y){
  color c = color(0);
  if(gridColors[xyi(x,y)]!=color(0)){return gridColors[xyi(x,y)];}
  int pv = gridValue(x,y);
  int pt = gridType(x,y);
  noStroke();strokeWeight(1);
  if(pt==0){//air
  if(pv<=0){c=color(0);stroke(255);}
  else if(pv<=200){c=color(255,255,0);}
  }      
  else if(pt==1){//wire 1
  if(pv<=0){c=color(128);}
  else if(pv<=4){c=color(90);}
  else if(pv<=10){c=color(255,255,0);}
  }
  else if(pt==2){//wire 2
  if(pv<=0){c=color(200);}
  else if(pv<=4){c=color(130);}
  else if(pv<=10){c=color(255,255,0);}
  }
  else if(pt==3){//wire 3
  if(pv<=0){c=color(100);}
  else if(pv<=4){c=color(60);}
  else if(pv<=10){c=color(255,255,0);}
  }
  else if(pt==4){//N sil
  if(pv<=0){c=color(0,0,128);}
  else if(pv<=4){c=color(0,0,255);}
  else if(pv<=10){c=color(255,255,0);}
  }
  else if(pt==5){//P sil
  if(pv<=0){c=color(128,0,0);}
  else if(pv<=4){c=color(255,0,0);}
  else if(pv<=10){c=color(255,255,0);}
  }
  else if(pt==6){//switch off
  c=color(0,128,0);
  }
  else if(pt==7){//toggle off
  c=color(128,0,128);
  }
  else if(pt==8){//switch on
  if(pv<=0){c=color(0,255,0);}
  else if(pv<=4){c=color(0,128,0);}
  else if(pv<=10){c=color(255,255,0);}
  }
  else if(pt==9){//toggle on
  if(pv<=0){c=color(255,0,255);}
  else if(pv<=4){c=color(128,0,128);}
  else if(pv<=10){c=color(255,255,0);}
  }
  else if(pt==10){//d wire
  if(pv<=0){c=color(12,64,128);}
  else if(pv<=4){c=color(25,128,255);}
  else if(pv<=10){c=color(255,255,0);}
  }
  else if(pt==11){//sd wire
  if(pv<=0){c=color(255,128,0);}
  else if(pv<=4){c=color(128,255,0);}
  else if(pv<=10){c=color(255,255,0);}
  }
  else if(pt==12){//all wire
  if(pv<=0){c=color(128,64,0);}
  else if(pv<=4){c=color(255,128,0);}
  else if(pv<=10){c=color(255,255,0);}
  }
  else if(pt==13){//AND
  if(pv<=0){c=color(128,128,0);}
  else if(pv<=4){c=color(64,64,0);}
  else if(pv<=10){c=color(192,192,0);}
  }
  else if(pt==14){//line
  if(pv<=0){c=color(128,0,255);}
  else if(pv<=4){c=color(64,0,128);}
  else if(pv<=10){c=color(255,255,0);}
  }
  else if(pt==15){//except
  if(pv<=0){c=color(0,128,100);}
  else if(pv<=4){c=color(0,255,200);}
  else if(pv<=10){c=color(255,255,0);}
  }
  else if(pt==16){//?
  c=color(255);strokeWeight(10);stroke(255);
  }
  else{print(pt); c=color(255,100,100);}
  return c;
}
