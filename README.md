# Introduction
APB is low bandwidth and low performance bus. So, the components requiring lower bandwidth like the peripheral devices such as UART, Keypad, Timer and PIO (Peripheral Input Output) devices are connected to the APB. The bridge connects the high performance AHB or ASB bus to the APB bus. So, for APB the bridge acts as the master and all the devices connected on the APB bus acts as the slave.

# APB Specifications:
1. Parallel bus operation. All the data will be captured at rising edge clock.
2. Two slave design.
3. Signal priority: 1.PRESET (active low) 2. PSEL (active high) 3. PENABLE (active high) 4. PREADY (active high) 5. PWRITE
4. Data width 8 bit and address width 9 bit.
5. PWRITE=1 indicates write PWDATA to slave. PWRITE=0 indicates read PRDATA from slave.
6. Start of data transmission is indicated when PENABLE changes from low to high. End of transmission is indicated by PREADY changes from high to low.

   Top Module Name: main_module.v Testbench Name: test.v

 
 # APB Interface Block Diagram:
  <img width="500" alt="Untitled" src="https://github.com/Samiksha-0710/APB_Protocol/assets/97450842/1b594142-bd5d-4460-81ed-d16cc0aed1f8">


# Operations Of APB:
   ![image](https://github.com/Samiksha-0710/APB_Protocol/assets/97450842/87f18fc7-2a99-4a53-85f7-d6bb623ccff5)

# APB PIN Description:

   <style> </style>

   |SIGNAL|	SOURCE	|Description|	WIDTH(Bit)|
   |------|---------|-----------|-----------|
|Transfer|	System Bus|	APB enable signal. If high, APB is activated else APB is disabled	|1|
|PCLK|	Clock Source	|All APB functionality occurs at a rising edge|	1|
|PRESETn|	System Bus|	An active low signal|	1|
|PADDR	|APB bridge|	The APB address bus can be up to 32 bits	|8|
|PSEL1	|APB bridge|	There is a PSEL for each slave. It’s an active high signal 1|
|PENABLE|	APB bridge	|It indicates the 2nd cycle of a data transfer. It’s an active high signal	|1|
|PWRITE|	APB bridge	|Indicates the data transfer direction. PWRITE=1 indicates APB write access(Master to slave) PWRITE=0 indicates APB read access(Slave to master)|	1|
|PREADY	|Slave Interface|	This is an input from Slave. It is used to enter the access state|	1|
|PSLVERR	|Slave Interface|	This indicates a transfer failure by the slave|	1|
|PRDATA|	Slave Interface|	Read Data. The selected slave drives this bus during reading operation|	8|
|PWDATA|	Slave Interface|	Write data. This bus is driven by the peripheral bus bridge unit during write cycles when PWRITE is high|	8|


# APB Interface Block Diagram With Slaves:
   ![Untitled](https://github.com/Samiksha-0710/APB_Protocol/assets/97450842/12d06147-b08d-4401-9be9-d9c3428f4a9b)

# APB Simulation Result with Slaves:

#### Slave 1 WRITE Operation
![Screenshot 2024-06-11 140118](https://github.com/Samiksha-0710/APB_Protocol/assets/97450842/4f7324d0-13f7-4b8d-b367-4e50b214c808)

#### Slave 2 WRITE Operation
 ![Screenshot 2024-06-11 140146](https://github.com/Samiksha-0710/APB_Protocol/assets/97450842/2bc57577-876a-4edb-b057-186e4c0de1da)

#### Slave 1 READ Operation
![Screenshot 2024-06-11 140237](https://github.com/Samiksha-0710/APB_Protocol/assets/97450842/324f3f02-ed30-4bb8-9465-1362f81224c7)

#### Slave 2 READ Operation
![Screenshot 2024-06-11 140307](https://github.com/Samiksha-0710/APB_Protocol/assets/97450842/f4628fe4-b6d4-43ec-9f3a-6df31b8190b6)





