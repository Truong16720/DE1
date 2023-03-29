{\rtf1\ansi\ansicpg1250\cocoartf2708
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 # Lab 7: INSERT_YOUR_FIRSTNAME INSERT_YOUR_LASTNAME\
\
### Display driver\
\
1. Listing of VHDL code of the completed process `p_mux`. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:\
\
```vhdl\
    --------------------------------------------------------\
    -- p_mux:\
    -- A sequential process that implements a multiplexer for\
    -- selecting data for a single digit, a decimal point,\
    -- and switches the common anodes of each display.\
    --------------------------------------------------------\
    p_mux : process (clk) is\
    begin\
        if (rising_edge(clk)) then\
            if (rst = '1') then\
                sig_hex <= data0;\
                dp      <= dp_vect(0);\
                dig     <= "1110";\
            else\
                case sig_cnt is\
                    when "11" =>\
                        sig_hex <= data3;\
                        dp      <= dp_vect(3);\
                        dig     <= "0111";\
\
                    when "10" =>\
                        -- DEFINE ALL OUTPUTS FOR "10" HERE\
\
                    when "01" =>\
                        -- DEFINE ALL OUTPUTS FOR "01" HERE\
\
                    when others =>\
                        -- DEFINE ALL OUTPUTS FOR "00" HERE\
                end case;\
            end if;\
        end if;\
    end process p_mux;\
```\
\
### Eight-digit driver\
\
1. Image of the 8-digit driver's block schematic. The image can be drawn on a computer or by hand. Always name all inputs, outputs, components, and internal signals!\
\
   ![your figure]()}