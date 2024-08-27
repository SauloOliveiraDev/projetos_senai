// C++ code
// Saulo de Oliveira
int led = 3;
int beep = 4;
int portaPotenciometro = A0;
int valorPotenciometro = 0;
void setup(){
	pinMode (led, OUTPUT);
  	pinMode (beep, OUTPUT);
  	Serial.begin(9600);
}

void loop(){
  valorPotenciometro = analogRead(portaPotenciometro);
  Serial.println(valorPotenciometro);
  delay(10);
  int brilho = map(valorPotenciometro, 0, 1023,0,255);
  analogWrite(led, brilho);
  
  if(valorPotenciometro > 700){
	digitalWrite(beep, HIGH);
  }else{
    digitalWrite(beep, LOW);
  }
  
  
}