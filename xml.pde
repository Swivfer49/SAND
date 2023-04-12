
Toolbar getToolbar(XML tool, reference r){
  XML[] btns = tool.getChildren("button");
  String[] btnsS = new String[btns.length];
  color[] btnsC = new color[btns.length];
  int btnsize = tool.getInt("button-size");
  for(int i=0;i<btns.length;i++){
  btnsS[i]=(r.newCondition(btns[i].getString("conditions")+">"+btns[i].getString("to")));
  btnsC[i]=color(btns[i].getInt("r"),btns[i].getInt("g"),btns[i].getInt("b"));
  }
return new Toolbar(btnsS,btnsize,btnsC);
}

boolean[][] getConductitions(String[] conditions){
  int lastTypeNum = conditions.length;
  boolean[][] returnVariable = new boolean[lastTypeNum][lastTypeNum];
  for(int x = 0;x<lastTypeNum;x++){
  for(int y=0;y<lastTypeNum;y++){
  returnVariable[x][y] = conditions[x].contains(","+y+",");
  }
  }
return returnVariable;
}

String[] getConditions(XML con, reference r){
  XML[] cons = con.getChildren("conduct-condition");
  String[] ret = new String[cons.length];
  for(int i = 0;i<cons.length;i++){
  ret[i] = r.newCondition(cons[i].getContent());
  }
return ret;
}



class reference{
String[] results, names, types;
XML[] refs;
reference(XML ref){
refs = ref.getChildren("reference");
results = new String[refs.length];
names = new String[refs.length];
types = new String[refs.length];

for(int i = 0;i<refs.length;i++){
names[i]=refs[i].getString("name");
types[i]=refs[i].getString("type");
results[i]=refs[i].getContent();
}
}

String newCondition(String con){
  String condition = con;
for(int i = 0;i<refs.length;i++){
String n=names[i]; String r=results[i];
if(n.contains(":?:")){
if(condition.contains(":")){
  String[] mt = match(condition,":(.*?):");
  int var;
  if(mt!=null){
  var=int(mt[1]);
  }else{var = 0;}
n=n.replace("?",str(var));
r=r.replace(":?:",str(var));
}
}
if(condition.contains(n)){
if(types[i].equals("exclude")){
String[] rs=split(r,',');
condition=condition.replaceFirst(n,",");
for(int j=0; j<rs.length;j++){
condition=condition.replaceAll(","+rs[j]+",",",");
}
}else if(types[i].equals("include")){
condition=condition.replaceFirst(n,r);
}
}
}
return condition;
}

}
