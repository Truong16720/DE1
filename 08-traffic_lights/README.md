# Lab 8: NhatTruongNguyen

### Traffic light controller

1. Listing of VHDL code of the completed process `p_traffic_fsm`. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

```vhdl
    --------------------------------------------------------
    -- p_traffic_fsm:
    -- A sequential process with synchronous reset and
    -- clock_enable entirely controls the s_state signal by
    -- CASE statement.
    --------------------------------------------------------
    p_traffic_fsm : process (clk) is
  begin

    if (rising_edge(clk)) then
      if (rst = '1') then                    -- Synchronous reset
        sig_state <= WEST_STOP;              -- Init state
        sig_cnt   <= (others => '0');        -- Clear delay counter
      elsif (sig_en = '1') then
        -- Every 250 ms, CASE checks the value of sig_state
        -- local signal and changes to the next state 
        -- according to the delay value.
        case sig_state is

          when WEST_STOP =>
            -- Count to 2 secs
            if (sig_cnt < c_DELAY_2SEC) then
              sig_cnt <= sig_cnt + 1;
            else
              -- Move to the next state
              sig_state <= WEST_GO;
              -- Reset delay counter value
              sig_cnt   <= (others => '0');
            end if;

          when WEST_GO =>
            -- WRITE OTHER STATES HERE
           -- Count to 4 secs
            if (sig_cnt < c_DELAY_4SEC) then
              sig_cnt <= sig_cnt + 1;
            else
              -- Move to the next state
              sig_state <= WEST_WAIT;
              -- Reset local counter value
              sig_cnt   <= (others => '0');
            end if;

            when WEST_WAIT =>
            -- Count to 1 sec
            if (sig_cnt < c_DELAY_1SEC) then
              sig_cnt <= sig_cnt + 1;
            else
              -- Move to the next state
              sig_state <= SOUTH_STOP;
              -- Reset local counter value
              sig_cnt   <= (others => '0');
            end if;

            when SOUTH_STOP =>
            -- Count to 2 secs
            if (sig_cnt < c_DELAY_2SEC) then
              sig_cnt <= sig_cnt + 1;
            else
              -- Move to the next state
              sig_state <= SOUTH_GO;
              -- Reset local counter value
              sig_cnt   <= (others => '0');
            end if;

            when SOUTH_GO =>
            -- Count to 4 secs
            if (sig_cnt < c_DELAY_4SEC) then
              sig_cnt <= sig_cnt + 1;
            else
              -- Move to the next state
              sig_state <= SOUTH_WAIT;
              -- Reset local counter value
              sig_cnt   <= (others => '0');
            end if;

            when SOUTH_WAIT =>
            -- Count to 1 sec
            if (sig_cnt < c_DELAY_1SEC) then
              sig_cnt <= sig_cnt + 1;
            else
              -- Move to the next state
              sig_state <= WEST_STOP;
              -- Reset local counter value
              sig_cnt   <= (others => '0');
            end if;

          when others =>
            -- It is a good programming practice to use the
            -- OTHERS clause, even if all CASE choices have
            -- been made.
            sig_state <= WEST_STOP;
            sig_cnt   <= (others => '0');

        end case;

      end if; -- Synchronous reset
    end if; -- Rising edge
  end process p_traffic_fsm;

```

2. Screenshot with simulated time waveforms. The full functionality of the entity must be verified. Always display all inputs and outputs (display the inputs at the top of the image, the outputs below them) at the appropriate time scale!

   ![your figure](https://github.com/Truong16720/DE1/blob/main/08-traffic_lights/Images/Untitled.png)

3. Figure of Moor-based state diagram of the traffic light controller with *speed button* to ensure a synchronous transition to the `WEST_GO` state. The image can be drawn on a computer or by hand. Always name all states, transitions, and input signals!

   ![your figure](https://github.com/Truong16720/DE1/blob/main/08-traffic_lights/Images/Sn%C3%ADmek%20obrazovky%202023-04-04%20v%C2%A018.25.13.png )
