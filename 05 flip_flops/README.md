# Lab 5: NhatTruongNguyen

### D & T Flip-flops

1. Screenshot with simulated time waveforms. Try to simulate both D- and T-type flip-flops in a single testbench with a maximum duration of 200 ns, including reset. Always display all inputs and outputs (display the inputs at the top of the image, the outputs below them) at the appropriate time scale!

   ![your figure](https://github.com/Truong16720/DE1/blob/main/flip_flops/images/Untitled.png)

### JK Flip-flop

1. Listing of VHDL architecture for JK-type flip-flop. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

```vhdl
architecture behavioral of jk_ff_rst is

signal sig_q : std_logic;

begin
    p_jk_ff_rst : process(clk)
    begin
        if rising_edge(clk) then
                if (rst = '1') then
                    sig_q <= '0';
                    
                elsif (j = '0' and k = '0') then
                    sig_q <= sig_q;
                    
                elsif (j = '0' and k = '1') then
                    sig_q <= '0';
                    
                elsif (j = '1' and k = '0') then
                    sig_q <= '1';
                    
                else 
                    sig_q <= not sig_q;
                end if;
          end if;
        q     <= sig_q;
        q_bar <= not sig_q;
        
    end process p_jk_ff_rst;
end architecture behavioral;
```

### Shift register

1. Image of `top` level schematic of the 4-bit shift register. Use four D-type flip-flops and connect them properly. The image can be drawn on a computer or by hand. Always name all inputs, outputs, components and internal signals!

   ![your figure](https://github.com/Truong16720/DE1/blob/main/04%20segment/Images/Sn%C3%ADmek%20obrazovky%202023-03-15%20v%C2%A017.11.48.png)
