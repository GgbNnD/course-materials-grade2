#define sbi(PORT, bit) (PORT |= 1 << bit)     // 宏定义设置端口位为 1
#define cbi(PORT, bit) (PORT &= ~(1 << bit))  // 宏定义清除端口位为 0
const int pwmOutPin = 11;                     // PWM 输出引脚
const int testPin = 3;                        // 测试引脚
const float pi = 3.141592;                    // π值，用于计算正弦值
int indexCnt, interCnt;                       //计数器计数值和中断计数器变量
byte sine[512];//存储正弦值的数组
//
// 中断控制变量
volatile boolean adcSample;  // ADC 采样标志
volatile byte bufferAdc0;    // ADC 缓冲区
void setup() {
  pinMode(pwmOutPin, OUTPUT);  // 将 PWM 引脚设置为输出
  pinMode(testPin, OUTPUT);    // 将测试引脚设置为输出
  calcSine();                  // 加载内存中的正弦表
  // 设置ADC预分频器为64，设置8位ADC和VCC参考电压，选择模拟通道0
  ADCSRA |= 0b00000110;
  ADMUX |= 0b01100000;
  // 设置 Timer2 为快速PWM模式
  TCCR2A |= 0b10000011;
  // Timer2 无预分频
  TCCR2B |= 0b00000001;
  cbi(TCCR2B, CS21);  // 清除 Timer2 的预分频位 CS21 和CS22
  cbi(TCCR2B, CS22);
  // 禁用 Timer0，启用Timer2 的中断
  cbi(TIMSK0, TOIE0);
  sbi(TIMSK2, TOIE2);
}
void loop() {
  while (!adcSample) {}         // 等待新的 ADC 样值
  digitalWrite(testPin, HIGH);  // 将测试引脚设置为高电平
  adcSample = false;            // 重置采样标志
  OCR2A = sine[indexCnt];       // 将当前值发送到 PWM
  indexCnt++;
  indexCnt += bufferAdc0;
  indexCnt &= 511;             // 将计数器计数值限制在 0到511 之间
  digitalWrite(testPin, LOW);  // 将测试引脚设置为低电平
}
// 计算包含512个值（在0到2*pi之间）的正弦数组
void calcSine() {
  for (int n = 0; n <= 511; n++) {
    sine[n] = 127 * sin(pi * n / 255) + 128;
  }
}
// 获取电位器值
ISR(TIMER2_OVF_vect) {
  interCnt++;  // 减少采样率，从 62.5 kHz 降到 15.625 kHz
  if (4 == interCnt) {
    bufferAdc0 = ADCH;  // 获取 8 位 ADC 值
    adcSample = true;   // 设置 ADC 采样标志
    sbi(ADCSRA, ADSC);  // 开始下一次转换
    interCnt = 0;       // 重置中断计数器
  }
}