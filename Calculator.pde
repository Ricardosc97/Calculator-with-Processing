// Ricardo Silva 
// Centro de Investigación de Tecnología y Electrónica
// Julio 2016

int [] lxs = {10, 70,80,140,150,210,220,280};
int [] lys = {10,70,80,140,150,210,220,280,290,350,360,420,430,430,430,430};
int [] nums={1,2,3,4,5,6,7,8,9,0};
int [] boton={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
int op=0, coma =0;
int [] signo = { 1 , -1 };
float  resul =0, ans =0, basura =0;
int c = 60, d=270, a =0, anscheck = 0;
int i =0, j=0,r =1, k=0, entero1 = 0, entero2 = 0 ,digito = -25, q = 0, enteroresul = 1;
int num1check = 0, num2check = 0, estado = 0, negativo = 0, resulcheck = 0;
float num1=0, num2=0;
int decimal1 = 0, click, decimal2 = 0, decimal3 = 0;



void setup () {
  background (0);
  size (290,430);
  stroke(255);
  fill(150);
  rect (lxs[0],lys[0],d,c,7);
}

void draw () {
  
  for (i=0; i < 11; i=i+2){
    for (j=0 ; j < 7; j=j+2){
      // para la ubicación del mouse, cuando se encuentre en las cordenadas de un boton, dicho boton tendra un color mas oscuro.
      if ((mouseX > lxs[j])&&(mouseX<lxs[j+1])&&(mouseY>lys[i+2])&&(mouseY<lys[i+3])){
        stroke (255);
        fill(0,15,100);
        rect (lxs [j],lys[i+2], c,c,7); 
        fill(255);
        textSize(40);
        if(click==1){
          if (j>5 && estado ==0  &&  i != 2){
            boton [j/2 + 2*i]=0;
            click = 0;
          }
          else{
          boton[j/2 + 2*i] = 1;
          click = 0;
          }
        }
      }
      else {
        stroke (255);
        fill (0,15,200); 
        rect(lxs[j], lys [i+2], c, c,7);
        fill(255);
        textSize(40);

      } 
      textSize (30); 
      text ("Ans", lxs[4]+5, lys[11]-23);           //Ans
      textSize(40);  
      text (nums[0], lxs[0] + 20, lys[5] - 15 );    //numeros
      text (nums[1], lxs[2] + 20, lys[5] - 15); 
      text (nums[2], lxs[4] + 20, lys[5] - 15);
      text (nums[3], lxs[0] + 20, lys[7] -15);
      text (nums[4], lxs[2] + 20, lys[7] - 15); 
      text (nums[5], lxs[4] + 20, lys[7] -15);
      text (nums[6], lxs[0] + 20, lys[9] - 15); 
      text (nums[7], lxs[2] + 20, lys[9] - 15);
      text (nums[8], lxs[4] + 20, lys[9] - 15); 
      text (nums[9], lxs[0] + 20, lys[11] - 15);
      text ("=", lxs[6] + 15, lys[11] -15);         // simbolos
      text ("+", lxs[6] +15, lys[3] -17); 
      text ("-", lxs[6] +19, lys[5] -17);
      text ("x", lxs[6] +19, lys[7] -18);
      text ("÷", lxs[6] +15, lys[9] -18);
      text ("Cl", lxs[4] + 12, lys[3] -15);
      text ("<-", lxs[2] + 2, lys[3] -15); 
      text("√", lxs[0] +15, lys[3] -15);
      text (",", lxs[2] +23, lys[11]-25); 
     
      if ( boton [1] ==1 ){                                                        // boton borrar simple
        basura = 0;
        boton [1] = 0;
        stroke(255); 
        fill(150);
        rect (lxs[0],lys[0],d,c,7);
        fill (255);
        
        if (estado == 1 && num1 != 0 && op == 0){                                               // borrar digitos de num1
         
          if ( coma ==1){
            if (decimal1 > 1)
              basura = (num1 * pow (10, decimal1)) % 10;
            else {
              basura = (num1 * 10) % 10;
              coma=0;
            }
          num1 = num1 - (basura * pow (10, -decimal1));
          decimal1 = decimal1 -1;
          } else {
              basura = num1 % 10;
              num1 = (num1 - basura)/10; 
            if (num1 == 0){
              q =0;
              estado = 0;
            }
          }
          if (entero1 > 0)
            entero1 = entero1 - 1;
          if (entero1<=8){
            if(num1 > 0)
              text(nf(num1,1,decimal1), lxs[6]+25 + (entero1 * digito),lys[1]-15); 
            if (num1 < 0)
              text(nf(num1,1,decimal1), lxs[6]+15 + (entero1 * digito),lys[1]-15);
          } else { 
            textSize (15) ;
            text ("El numero es demasiado grande", lxs [0]+10, lys [1]-30);
            text ("para ser escrito.", lxs [1]+13, lys [1]-15);
            }
          }
        
        if ( op != 0 && num2 == 0 && num1check ==1){                                             //borrar operadores
          op=0;
          num1check=0;
          text(nf(num1,1,decimal1), lxs [6] + 25 + (entero1 * digito),lys[1]-15);
        }
        if(num1check == 1 && op!=0 && op!=5 ){                                                  // borrar digitos de num2
          if ( coma ==1){
              if (decimal2 > 1)
                basura = (num2 * pow (10, decimal2)) % pow (10,decimal2 -1);
              else {
                basura = (num2 * 10) % 10;
                coma=0;
              }
            num2 = num2 - basura * pow (10, -decimal2);
            decimal2 = decimal2 -1;
            } else {
              a=round (num2/10);
              if (a > (num2/10)){
                a = a -1;
              }
              basura = ((num2/10) -a ) * 10;
              num2= (num2-basura)/10 ;
            }
          if (entero2 > 0)
            entero2 = entero2 - 1;
          if (entero2<=8)
            text(nf(num2,1,decimal2), lxs[6]+25 + (entero2 * digito),lys[1]-15);        
            else { 
            textSize (15) ;
            text ("El numero es demasiado grande", lxs [0]+10, lys [1]-30);
            text ("para ser escrito.", lxs [1]+13, lys [1]-15);
            }
        }
        if (resulcheck ==1){
          boton [2] = 1;
          resulcheck = 0;         
        }
        for (k=0; k<20; k++)
          boton [k] =0;
        }
      }
      if((boton [0] ==1)&&(num1check==0) && estado == 0 && op == 0){                //operador raiz cuadrada
        op=5;
        coma=0;
        boton [0] =0;
        if(resulcheck == 1){
            stroke(255);
            fill(150);
            rect (lxs[0],lys[0],d,c,7);
            resulcheck =0;
          }
          fill(255);
          textSize (30);
          text ("√", lxs[0]+5, lys [1] - 15);
        }
      if((boton [7] ==1) &&(estado == 0 || op ==3 || op ==4) && op != 5){                //operador NEGATIVO  
        if(resulcheck == 1){
          num1=resul;
        }
        q = 1;
        stroke(255);
        fill(150);
        rect (lxs[0],lys[0],d,c,7);
        textSize (40);
        fill (255);
        text ("-", lxs[6], lys [1] - 15);
        boton [7] = 0;
      }
        textSize (40);
        if ((boton [3] ==1)&&(num2check==0)&& estado == 1 && op == 0 && entero1<=8){                             //operador suma
          num1check = 1;
          if(resulcheck == 1){
            num1=resul;
          }
          op =1;
          num1check = 1;
          text ("+", lxs[0]+5,lys [1]-15);
          coma=0;
          boton [3] =0;
          q=0;
        }
        if ((boton [7] ==1)&&(num2check==0)&& estado == 1 && op == 0 && entero1<=8){               //operador resta
          num1check = 1;
          if(resulcheck == 1){
            num1=resul;
          }
          op =2;
          num1check = 1;
          text ("-", lxs[0]+5,lys [1]-15);
          coma=0;
          boton [7] =0;
          q=0;
        }
        if ((boton [11] ==1)&&(num2check==0)&& estado == 1 && op == 0 && entero1<=8){                          //operador multiplicacion
          num1check = 1;
          if(resulcheck == 1){
            num1=resul;
          }
          op =3;
          num1check = 1;
          text ("x", lxs[0]+5,lys [1]-15);
          coma=0;
          boton [11] =0;
          q=0;
        }
        if ((boton [15] ==1) &&(num2check==0)&& estado == 1 && op == 0 && entero1<=8){                         //operador division
          num1check = 1;
          if(resulcheck == 1){
            num1=resul;
          }
          op =4;
          num1check = 1;
          text ("÷", lxs[0]+5,lys [1]-15);
          coma=0;
          boton [15] =0;
          q=0;
        }
        if (boton [19] ==1 && op != 0) {                                                                    // RESULTADO
          boton [19]= 0;
          enteroresul = 1;
          
          if (op ==1){                                                                            //RESULTADO suma
            if (decimal2 >= decimal1){
            decimal3 = decimal2;
          } else {
            decimal3 = decimal1;
          }
            if (num2 == 0){
              resul = num1;
              }else {
              resul = num1 + num2;
              }
              stroke(255);
              fill(150);
              rect (lxs[0],lys[0],d,c,7);
              fill (255);
              if (resul > 0){
                for (r = 10; r <100000000; r = r *10)
                  if(resul >= r){
                    enteroresul = enteroresul + 1;
                  }
                } else {
                  for (r = -10; r >-100000000; r = r *10)
                  if(resul <= r){
                    enteroresul = enteroresul + 1;
                  }
                }
              if ((enteroresul+decimal3)<=8)  
                text(nf(resul, 1, decimal3), lxs[6]+25 + ((enteroresul+decimal3) * digito), lys[1]-15);
                else{ 
                textSize (15) ;
                text ("El resultado es demasiado grande", lxs [0]+10, lys [1]-30);
                text ("para ser escrito.", lxs [1]+13, lys [1]-15);
                }
            }
          if (op ==2){                                                                          //RESULTADO resta
            if (decimal2 >= decimal1){
              decimal3 = decimal2;
            } else {
              decimal3 = decimal1;
            }
            if (num2 == 0){
              resul = num1; 
              }else {
              resul = num1 - num2;
              }
              stroke(255);
              fill(150);
              rect (lxs[0],lys[0],d,c,7);
              fill (255);
              if (resul > 0){
                for (r = 10; r <100000000; r = r *10)
                  if(resul >= r){
                    enteroresul = enteroresul + 1;
                  }
                } else {
                  for (r = -10; r >-100000000; r = r *10)
                    if(resul <= r){
                      enteroresul = enteroresul + 1;
                  }
                }
              if ((enteroresul+decimal3)<=8)  
                text(nf(resul, 1, decimal3), lxs[6]+25 + ((enteroresul+decimal3) * digito), lys[1]-15);
                else{ 
                textSize (15) ;
                text ("El resultado es demasiado grande", lxs [0]+10, lys [1]-30);
                text ("para ser escrito.", lxs [1]+13, lys [1]-15);
                }
            }
          if (op ==4){                                                                            //RESULTADO division
            if (num2 == 0){
              stroke(255);
              fill(150);
              rect (lxs[0],lys[0],d,c,7);
              fill (255);
              textSize (15) ;
              text ("Cannot divide by zero.", lxs [2], lys [1]-15);  
              resul = 0;
              }else {
              resul = num1 / num2;
              
              a = round (resul);                     //
              if (a > resul)
                a = a -1;
              if ((resul % a)>0)                     //  checkeo para saber si tiene decimales
                decimal3 = 3;
                else decimal3 = 0;                   // 
                
              stroke(255);
              fill(150);
              rect (lxs[0],lys[0],d,c,7);
              fill (255);
              if (resul > 0){
                for (r = 10; r <100000000; r = r *10)
                  if(resul >= r){
                    enteroresul = enteroresul + 1;
                  }
                } else {
                  for (r = -10; r >-100000000; r = r *10)
                  if(resul <= r){
                    enteroresul = enteroresul + 1;
                  }
                }
              if ((enteroresul+decimal3)<=8)  
                text(nf(resul, 1, decimal3), lxs[6]+25 + ((enteroresul+decimal3) * digito), lys[1]-15);
                else{ 
                textSize (15) ;
                text ("El resultado es demasiado grande", lxs [0]+10, lys [1]-30);
                text ("para ser escrito.", lxs [1]+13, lys [1]-15);
                }
              }
            }
          if (op ==3){                                                                          //RESULTADO multiplicacion
            if (decimal1 + decimal2 <= 6)   
              decimal3 =decimal1 + decimal2;
              else 
              decimal3 =6;
            if (num2 == 0){
              resul = 0;
              }else {
              resul = num1 * num2;
              }
              stroke(255);
              fill(150);
              rect (lxs[0],lys[0],d,c,7);
              fill (255);
              if (resul > 0){
                for (r = 10; r <100000000; r = r *10)
                  if(resul >= r){
                    enteroresul = enteroresul + 1;
                  }
                } else {
                  for (r = -10; r >-100000000; r = r *10)
                  if(resul <= r){
                    enteroresul = enteroresul + 1;
                  }
                }
              if ((enteroresul+decimal3)<=8)  
                text(nf(resul, 1, decimal3), lxs[6]+25 + ((enteroresul+decimal3) * digito), lys[1]-15);
                else{ 
                textSize (15) ;
                text ("El resultado es demasiado grande", lxs [0]+10, lys [1]-30);
                text ("para ser escrito.", lxs [1]+13, lys [1]-15);
                }
            }
          if ((op ==5)){                                                                        //RESULTADO raiz
            if(num1 !=0){
              resul =  sqrt(num1);
              } else {
              resul =  0;
              }
              a = round (resul); 
              if (a > resul)
                a = a -1;
              if ((resul % a)>0)
                decimal3 = 3;
                else decimal3 = 0;
              stroke(255);
              fill(150);
              rect (lxs[0],lys[0],d,c,7);
              fill (255);
              if (resul > 0){
                for (r = 10; r <100000000; r = r *10)
                  if(resul >= r){
                    enteroresul = enteroresul + 1;
                  }
                } else {
                  for (r = -10; r >-100000000; r = r *10)
                  if(resul <= r){
                    enteroresul = enteroresul + 1;
                  }
                }
              if ((enteroresul+decimal3)<=8)  
                text(nf(resul, 1,0), lxs[6]+25 + ((enteroresul+decimal3) * digito), lys[1]-15);
                else{ 
                textSize (15) ;
                text ("El resultado es demasiado grande", lxs [0]+10, lys [1]-30);
                text ("para ser escrito.", lxs [1]+13, lys [1]-15);
                }
            }  
          op =0;
          entero1 = 0;
          entero2 = 0;
          decimal1 = decimal3 ;
          decimal2 = 0;
          coma =0;
          q=0;
          num1check =0;
          num2check =0;
          num1=0;
          num2=0;
          estado = 1;
          negativo =0;
          ans = resul;
          resulcheck =1;
          for (k=0; k<20; k++)
            boton [k] =0;
        }  
        if(boton [2] ==1){                //Borrar TODO
          op =0;
          entero1 = 0;
          entero2 = 0;
          num1check =0;
          decimal1 = 0;
          decimal2 = 0;
          decimal3 = 0;
          coma =0;
          num2check =0;
          num1=0;
          num2=0;
          resul=0;
          estado = 0;
          negativo =0;
          resulcheck = 0 ;
          q=0;
          background (0);
          stroke(255);
          fill(150);
          rect (lxs[0],lys[0],d,c,7);
          for (k=0; k<20; k++)
            boton [k] =0;
            
        }
        if(boton [18] ==1 && resul != 0){                //ANS
          anscheck = 1;
          decimal1 = decimal3;
          if (op != 5) {
            stroke(255);
            fill(150);
            rect (lxs[0],lys[0],d,c,7);
          } 
          fill(255);
          textSize (30); 
          text ("Ans", lxs[6], lys[1]-15);   
          if (num1check == 0){
            num1 = ans;
            num1check = 1;
            estado = 1;
            resulcheck = 0;
          }
          if (num1check == 1 && op != 0 && op != 5 ){
            num2 = ans;
            resulcheck = 0;
          }
          for (k=0; k<20; k++)
            boton [k] =0;
        }
    }
  
  for(i=0;i<4;i++)
    for(j=0;j<3;j++){
      if((boton [18]==1 || boton [17] == 1) && ((num1check ==0) || ( num1check ==1 && op != 0 ))){
        boton[18] = 0;
        if (boton[17]==1){  // boton coma
          coma =1;
          boton[17]=0;
        }
      }
      
      if (boton[4+j+i*4]==1 && boton[18] ==0 ){
        decimal3 = 0;
        boton [7] = 0;
        estado =1;
        boton[4+j+i*4]=0 ;
        
        if (resulcheck == 1){
          stroke(255);
          fill(150);
          rect (lxs[0],lys[0],d,c,7);
          resulcheck = 0;
          }
          fill (255);
          if(num1check == 0 ){                                              // ESCRIBIR NUMERO 1
            entero1 = 1 + entero1;
            
            if (coma ==1){    
              decimal1= decimal1 +1;                                        // COMA
              
              num1 = num1 + signo [q]*nums[j+i*3] * pow (10, -decimal1);
            } else {
              num1 = (num1*10)+ signo [q]*nums[j+i*3];     
            }
            
            stroke(255);
            fill(150);
            rect (lxs[0],lys[0],d,c,7);
            fill (255);
            if (op == 5){
              fill(255);
              textSize (30);
              text ("√", lxs[0]+5, lys [1] - 15);
            }
            textSize (40);
            if (entero1<=8){
              text(nf(num1,1,decimal1), lxs[6]+25 + (entero1 * digito),lys[1]-15);         // los numeros tienen una distancia de 25 pixeles
              for (k=0; k<20; k++)
                boton [k] =0;
              }else { 
              textSize (15) ;
              text ("El numero es demasiado grande", lxs [0]+10, lys [1]-30);
              text ("para ser escrito.", lxs [1]+13, lys [1]-15);
              for (k=0; k<20; k++)
                boton [k] =0;
              }
            }
            if(num1check == 1 && op!=0 && op!=5 ){                          //ESCRIBIR NUMERO 2
              if (num2check == 0){
                entero2 = 0;
                num2check =1;
              }
              entero2 = 1 + entero2;
              if(coma ==1){
                decimal2= decimal2 +1;                                      // COMA
                num2 = num2 + signo [q]*nums[j+i*3] * pow (10, -decimal2);
                } else {
                  num2 = (num2*10)+ signo [q]*nums[j+i*3];
                }
                stroke(255);
                fill(150);
                rect (lxs[0],lys[0],d,c,7);
                fill(255);
                if (entero2<=8)
                  text(nf(num2,1,decimal2), lxs[6]+25 + (entero2 * digito),lys[1]-15);        
                  else { 
                  textSize (15) ;
                  text ("El numero es demasiado grande", lxs [0]+10, lys [1]-30);
                  text ("para ser escrito.", lxs [1]+13, lys [1]-15);
                  for (k=0; k<20; k++)
                    boton [k] =0;
                  }
              }  
            }
          }
        }
  
  
  void mouseReleased()
  {
    click = 1;
  }