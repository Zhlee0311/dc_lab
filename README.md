# HDU_DCexperiments

# 杭电2023-2024第一学期计科数字电路实验

## 1. 文件结构

- `code`: 源码文件，后缀为.v

  > 描述逻辑电路 **结构**

- `sim`:  仿真文件，后缀为.v

  > 验证逻辑电路 **输出信号** 是否正确

- `constr`: 管脚约束文件，后缀为.xdc

  > 为了进行板级验证，要将信号配置到 **fpga引脚** 上

- `bit`: 比特流文件，后缀为.bit

  > 可 **烧录** 到实验板卡上的文件
## 2. 实验内容


### 2.1 基础实验

- [lab1-加法器](https://github.com/Zhlee0311/dc_lab/tree/main/lab1_Adder)

- [lab2-超前进位加法器](https://github.com/Zhlee0311/dc_lab/tree/main/lab2_Ahead_Adder)

- [lab3-译码器](https://github.com/Zhlee0311/dc_lab/tree/main/lab3_Decoder)

- ~~lab4-二进制优先级编码器(没做)~~

- [lab5-多路数据选择器](https://github.com/Zhlee0311/dc_lab/tree/main/lab5_Mux)

- [lab6-边沿J-K触发器](https://github.com/Zhlee0311/dc_lab/tree/main/lab6_JK2)

- [lab7-基本寄存器](https://github.com/Zhlee0311/dc_lab/tree/main/lab7_Register)

- [lab8-移位寄存器](https://github.com/Zhlee0311/dc_lab/tree/main/lab8_Shift_Register)

- [lab9-可逆计数器](https://github.com/Zhlee0311/dc_lab/tree/main/lab9_Reversible_Counter)

### 2.2 综合实验

- [AS1-数码管扫描显示](https://github.com/Zhlee0311/dc_lab/tree/main/Final_Lab1_DigitalTube)

- [AS2-出租车计费器](https://github.com/Zhlee0311/dc_lab/tree/main/Final_Lab2_TaxiMeter)



## 3. Note

1. 管脚约束均基于 `HDU-XL-01` 板卡进行




2. 过了很久才想起来维护这个仓库，难免有疏漏。欢迎提 [issue](https://github.com/Zhlee0311/dc_lab/issues) ，也可以邮件交流（我的邮箱：lz1907041@gmail.com)




3. 实验尽量自己做，代码仅供 **参考**



