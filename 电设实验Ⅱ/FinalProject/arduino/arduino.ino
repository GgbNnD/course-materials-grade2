//电压采集引脚
const int voltage_collect_pin = A0;
float voltage = 0;
const float pi = 3.1415926; ///< PI
float sin[512]; ///< sin值计算存储
void setup() {
  Serial.begin(115200);
  //开启电压采集端口
  pinMode(voltage_collect_pin,INPUT);
  CalcSin();
}

void loop() {
  //读取adc的值
  voltage = analogRead(voltage_collect_pin)*5.0/1023;
  Serial.print("Collected Voltage:");
  Serial.println(voltage);
}

void CalcSin(void)
{
  for(int i =0 ;i<512;i++)
  {
    sin[i] = 127*sin(pi*i/255)+128;
  }
}
