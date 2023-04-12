//---------------------------------------------------------------|   Pixel class ( store information of a pixel on the grid )

class Pixel{
xy pos;
int v,t;
Pixel(xy p){
pos = new xy(p.X,p.Y);
v=gridValue(p.X,p.Y);
t=gridType(p.X,p.Y);
}
void setV(int nv){setValue(pos.X,pos.Y,nv);setNValue(pos.X,pos.Y,nv);}
void setT(int nt){setType(pos.X,pos.Y,nt);setNType(pos.X,pos.Y,nt);}
}

//---------------------------------------------------------------|   Updates each square

void updateGrid(){
for(int x=0;x<sWidth;x++){
for(int y=0;y<sHeight;y++){
  int pv = gridValue(x,y);
  int pt = gridType(x,y);
  int pd = 1;
  String[] m = match(special,"(,"+str(pt)+"/d[0-9]{1,2})");
  if(m!=null){
  String m1 = m[0];
  String[] sp = m1.split("d");
  int npd=int(sp[1]);
  pd=npd;
  }
  
  int puv = gridValue(x,y-pd);
  int plv = gridValue(x-pd,y);
  int pdv = gridValue(x,y+pd);
  int prv = gridValue(x+pd,y);
  int put = gridType(x,y-pd);
  int plt = gridType(x-pd,y);
  int pdt = gridType(x,y+pd);
  int prt = gridType(x+pd,y);
  nBD neighborD = new nBD(x,y,pt,pv);
  
  neighborD.addN(put,puv,'u');
  neighborD.addN(pdt,pdv,'d');
  neighborD.addN(plt,plv,'l');
  neighborD.addN(prt,prv,'r');
  
  neighborD.process();
  
  setNValue(x,y,neighborD.NV);
  setNType(x,y,neighborD.NT);
}
}
gridValues=nGridValues.clone();
gridTypes=nGridTypes.clone();
}
