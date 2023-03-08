{\rtf1\ansi\ansicpg1250\cocoartf2708
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 # Lab 5: INSERT_YOUR_FIRSTNAME INSERT_YOUR_LASTNAME\
\
### D & T Flip-flops\
\
1. Screenshot with simulated time waveforms. Try to simulate both D- and T-type flip-flops in a single testbench with a maximum duration of 200 ns, including reset. Always display all inputs and outputs (display the inputs at the top of the image, the outputs below them) at the appropriate time scale!\
\
   ![your figure]()\
\
### JK Flip-flop\
\
1. Listing of VHDL architecture for JK-type flip-flop. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:\
\
```vhdl\
architecture Behavioral of jk_ff_rst is\
\
    -- WRITE YOUR CODE HERE\
\
    -- Output ports are permanently connected to local signal\
    q     <= sig_q;\
    q_bar <= not sig_q;\
end architecture Behavioral;\
```\
\
### Shift register\
\
1. Image of `top` level schematic of the 4-bit shift register. Use four D-type flip-flops and connect them properly. The image can be drawn on a computer or by hand. Always name all inputs, outputs, components and internal signals!\
\
   ![your figure]()\
}