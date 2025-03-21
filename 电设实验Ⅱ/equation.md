# 四、实验方案设计

## 1.总体参数

$$V_o = \frac{R_fR_1I_i}{R_6}-\frac{R_fV_f}{R_7}$$
为了让输入电流$I_i$从$4mA$到$20mA$变化，$V_f$从$0$到$10V$变化,取
$$
\frac{R_fR_1}{R_6} = 625\Omega\\
\frac{R_fV_f}{R_7} = 1.25
$$

## 2.$R_1、R_2、R_3、R_4、R_5$选择

差动放大器的四个匹配电阻$R_2、R_3、R_4、R_5$可以预先取定位中等阻值$10k\Omega$。

电阻$R_1$采用变送器标准负载，取$R_1 = 250\Omega$。

## 3.$R_f$选择

$$
\frac{R_fR_1}{R_6} = 625\Omega\\
$$

可取$R_6 = 10k\Omega$。

$R_f$可由$20k\Omega$固定电阻串联一个$10k\Omega$电位器$R_{w1}$得到。

## 4.$R_6、R_7、V_f$选择

取$R_6 = R_7 = 10k\Omega$，为了使得$I_i = 4mA、V_{o1} = -1V$时，$V_o = 0V$，取$V_f = 1V$。

## 5.$R_{11}、R_{12}、R_{w2}$选择

为了使得调整后的$V_f$不受电源电压变化影响，$V_f$由稳压电路分压产生

由于击穿电压在 4~7V 的稳压二极管温度系数最小、近似为零，这里选用 5.1V 稳压管来实现稳压电路。

分压后要产生 1V 左右的可调电压，分压电路可由上固定电阻串联下电位器构成。取流过分压电路电流为 5mA，则分压电路总电阻约为 1kΩ。若取上固定电阻 $R_{12}=510\Omega$，下电位器 $R_{w2} = 500\Omega$，则分压$V_f$将可在 0~2.5V 之间可调。

## 6.电源、$R_{11}、电容、补偿电阻$选择

为避免运放输出最大电压时接近饱和，运放供电电压可取为$\plusmn 12V$

补偿电阻$R_9 = R_6||R_7||R_f = 4.3k\Omega$

设稳压管最小工作电流为 10mA，则稳压管限流电阻 
$$
R_{11} = （13V － 5.1V）/（10mA+5mA）≈ 527Ω
$$
可取为标称值 $510Ω$

电容主要作用是抑制高频干扰，可取为$100pF$