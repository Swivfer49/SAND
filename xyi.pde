
//---------------------------------------------------------------|   X and Y storage variable
class xy{
  int X,Y,I; float x,y;
  xy(float xf,float yf){X=int(xf);Y=int(yf);constrainIndex(this);}
  xy(int xf,int yf){X=xf;Y=yf;x=xf;y=yf;constrainIndex(this);}
  xy(xy XY){X=XY.X;Y=XY.Y;x=XY.x;y=XY.y;constrainIndex(this);}
  xy(){}
  void move(int xm,int ym){X+=xm;Y+=ym;x+=xm;y+=ym;constrainIndex(this);};
  void move(float xm,float ym){X+=xm;Y+=ym;x+=xm;y+=ym;constrainIndex(this);};
  void move(){}
}

class xyd extends xy{
  xyd(float xf,float yf){super();X=int(xf);Y=int(yf);I=xyi(X,Y);}
  xyd(int xf,int yf){super();X=xf;Y=yf;x=xf;y=yf;I=xyi(X,Y);}
  xyd(xyd XY){super();X=XY.X;Y=XY.Y;x=XY.x;y=XY.y;I=xyi(X,Y);}
  void move(){super.move();}
}


//---------------------------------------------------------------|   Sets the index of a XY variable
void constrainIndex(xy o){
while(o.X<0){o.X+=sWidth;o.x+=sWidth;}
while(o.X>sWidth-1){o.X-=sWidth;o.x-=sWidth;}
while(o.Y<0){o.Y+=sHeight;o.y+=sHeight;}
while(o.Y>sHeight-1){o.Y-=sHeight;o.y-=sHeight;}
o.I = xyi(o.X,o.Y);
}


//---------------------------------------------------------------|   Gets the index of x and y on the grid
int xyi(int x,int y){
  int i = 0;

  int w =sWidth;
  i = x + w*y;
  return i;
}


//---------------------------------------------------------------|   Creates a line on the grid between two points
xy[] gridLine(int x1,int y1, int x2,int y2){
  
  ArrayList<xy> points = new ArrayList<xy>();
    float N = dist(x1,y1,x2,y2);
    for (int step = 0; step <= N; step++) {
        float t = N == 0? 0.0 : step / N;
        points.add(lerp_point(x1,y1,x2,y2, t));
    }
    return(suftirdtsbn(points));
  
}

//---------------------------------------------------------------|   Lerp XY
xy lerp_point(int x1, int y1, int x2, int y2, float b){
return new xy(lerp(x1,x2,b),lerp(y1,y2,b));
}

xy[] suftirdtsbn(ArrayList<xy> s){
xy[] ls = new xy[s.size()];
for(int i = 0;i<s.size();i++){
ls[i]=s.get(i);
}
return ls;
}
Pixel[] afihtmbtlis( ArrayList<Pixel> s){
Pixel[] ls = new Pixel[s.size()];
for(int i = 0;i<s.size();i++){
ls[i]=s.get(i);
}
return ls;
}


//---------------------------------------------------------------|   Pixel neighbor processing class
class nBD{
int nuv, ndv, nlv, nrv, nut, ndt, nlt, nrt;
int X, Y, T, V, N, P, NV, NT;
nBD(int x,int y, int t, int v){
X=x;Y=y;T=t;V=v;N=0;P=0;NT=t;NV=v;
}

//add a neighbor. 
//sets the selected neighbor (char c) with the values t and v. 
//The neighbor grid value in not changed
void addN(int t, int v, char c){switch(c){case 'u': nuv=v;nut=t; break;case 'd': ndv=v;ndt=t; break;case 'l': nlv=v;nlt=t; break;case 'r': nrv=v;nrt=t; break;}if(t==4&&v==10){N++;}if(t==5&&v==10){P++;}
}

//change the next grid value based on the neighbors
//some cases can force change other pixels
void process(){
if(V==0&&T!=16){
  if(T>=6&&T<=7){//switch and toggle pixel off
    if(T==7&&N+P>0){NT=T+2;}
    else if(T==6&&P>N){NT=T+2;}
  }
  else if(T>=8&&T<=9){//switch and toggle pixel on
    if(T==9&&N+P>0){NT=T-2;}
    else if(T==8&&N>P){NT=T-2;}
  }
  
  if(this.validT()){
  NV=10;//power
  if(T==14){ //line pixel
  xy O = new xy(X,Y);
  int ox=0,oy=0;
  if(validTransfer(V,nuv,T,nut)){oy+=1;}//line down
  if(validTransfer(V,ndv,T,ndt)){oy-=1;}//line up
  if(validTransfer(V,nrv,T,nrt)){ox-=1;}//line left
  if(validTransfer(V,nlv,T,nlt)){ox+=1;}//line right
  rayHit ray = rayCast(O,new xyd(ox,oy));
  ray.update();
}
  }
}
else{
  
NV=V-1;

}
if(T==13){
  if(N==1&&P==1){NV=10;}
  }

}
boolean validT(){return (validTransfer(V,nuv,T,nut)||validTransfer(V,ndv,T,ndt)||validTransfer(V,nlv,T,nlt)||validTransfer(V,nrv,T,nrt));}
}


//---------------------------------------------------------------|   raycast

rayHit rayCast(xy p,xyd d){
if(d.X>=-1&&d.X<=1&&d.Y>=-1&&d.Y<=1){
  xy[] r = new xy[20];
  xy O = new xy(p);
  for(int i = 0;i<20;i++){
  O.move(d.X,d.Y);
  
  r[i]=new xy(O);
  }
  return new rayHit(r);
}else{
return new rayHit(gridLine(p.X,p.Y,p.X+d.X+1,p.Y+d.Y+1));
}
}

//---------------------------------------------------------------|   raycast class

class rayHit{
Pixel[] l;
rayHit(xy[] li){
  ArrayList<Pixel> ps = new ArrayList<Pixel>();
for(int i = 0;i<li.length;i++){
  xy XY = li[i];
  Pixel XYP=new Pixel(XY);
  
if(XYP.t==0||XYP.t==16){
ps.add(XYP);
}else{
ps.add(XYP);
break;
}
}
l = afihtmbtlis(ps);
}
void update(){
  int av = 11;
for(int i=0;i<l.length;i++){
  Pixel p = l[i];
if(p.t==16){//?
p.setT(0);
p.setV(10);
av+=p.v*2;
}else{//air + else
if(p.v<10){ p.setV(av);}
else if(p.t==0){p.setT(16);}
}
}
}
}
