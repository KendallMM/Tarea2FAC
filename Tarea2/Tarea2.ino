int R=2;
int Q=3;
int P=4;
int C=5;
int B=6;
int A=7;
int state=0;
int binaryNumber;
String result;
long timeInMicro;
long distanceInCm;

void setup() 
{
  Serial.begin(9600);
  pinMode(A1,OUTPUT);
  pinMode(A0,INPUT);
  pinMode(2,OUTPUT);
  pinMode(3,OUTPUT);
  pinMode(4,OUTPUT);
  pinMode(7,INPUT);
  pinMode(6,INPUT);
  pinMode(5,INPUT);
  
  pinMode(8,OUTPUT);
  pinMode(9,OUTPUT);
  pinMode(10,OUTPUT);
  pinMode(11,OUTPUT);
  pinMode(12,OUTPUT);
  pinMode(13,OUTPUT);
  pinMode(A2,OUTPUT);
}

void loop()  
{
 digitalWrite(A1,LOW);
 delayMicroseconds(2);
 digitalWrite(A1,HIGH);
 delayMicroseconds(10);
 digitalWrite(A1,LOW);

 timeInMicro= pulseIn(A0,HIGH);

 distanceInCm = ((timeInMicro/29)/2);
 if (distanceInCm > 58) {
   distanceInCm = 58;}
 state = map(distanceInCm,2,58,7,0);
  
  // A partir de un "Switch Case" se pocede a generar la salida de tres bits en gray.
  switch (state) {
    case 0:
      digitalWrite(P, LOW);
      digitalWrite(Q, LOW);
      digitalWrite(R, LOW);
      break;
    case 1:
      digitalWrite(P, LOW);
      digitalWrite(Q, LOW);
      digitalWrite(R, HIGH);
      break;
    case 2:
      digitalWrite(P, LOW);
      digitalWrite(Q, HIGH);
      digitalWrite(R, HIGH);
      break;
    case 3:
      digitalWrite(P, LOW);
      digitalWrite(Q, HIGH);
      digitalWrite(R, LOW);
      break;
    case 4:
      digitalWrite(P, HIGH);
      digitalWrite(Q, HIGH);
      digitalWrite(R, LOW);
      break;
    case 5:
      digitalWrite(P, HIGH);
      digitalWrite(Q, HIGH);
      digitalWrite(R, HIGH);
      break;
    case 6:
      digitalWrite(P, HIGH);
      digitalWrite(Q, LOW);
      digitalWrite(R, HIGH);
      break;
    case 7:
      digitalWrite(P, HIGH);
      digitalWrite(Q, LOW);
      digitalWrite(R, LOW);
      break;
  }
  result = String(digitalRead(A))+String(digitalRead(B))+String(digitalRead(C));
  binaryNumber = result.toInt();
  
  Serial.print("GrayCode: ");Serial.print(digitalRead(P));Serial.print(digitalRead(Q));Serial.print(digitalRead(R));
  Serial.print(",   Salida: ");Serial.print(binaryNumber);
  Serial.print(",   Hexadecimal: ");Serial.print(state);
  if (distanceInCm>57){
    Serial.println(",   Distancia mayor a 58cm (máximo)");
  }else{
    Serial.print(",   Distancia en cm: ");Serial.println(distanceInCm);
  }
  
  delay(100);
  }
