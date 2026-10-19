-- Lakeshore-Road-Baie-d'Urfé Moore FSM:
-- States definition: 
-- Let SMOOTH be 00, POTHOLE be 01 and TRIPPED be 10. 
-- Let inputs be 00, 01 and 10
-- Let output be 0 or 1. 

-- Characteristics: 
-- If input = "00", stay in current state.
-- If input = "01", move to next state. 
-- Input "10" appears once in state TRIPPED. 
-- Input "10" is the only state capable of resetting the FSM to SMOOTH. 
-- Output = "1" if current state is TRIPPED. 

library ieee; 
use ieee.std_logic.1164.all; 

entity Baie_dUrfe_Lakeshore is
  port(
    clock, reset: in std_logic; 
    input: in std_logic_vector(1 downto 0); 
    output: out std_logic
  );
end entity; 

architecture trip_detector of Baie_dUrfe_Lakeshore is
  type state_t is (SMOOTH, POTHOLE, TRIPPED); 
  signal state, next_state: state_t; 
begin
  state_reg: process(clock, reset)
    begin 
      if (reset = '1' then 
          state <= SMOOTH; 
      elsif rising_edge(clock) then
          state <= next_state; 
      end if; 
    end process;

    next_logic: process(state, input)
        begin 
          next_state <= state; 
          output <= '0'; 

          case state is
            when SMOOTH => 
              if input = '01' then
                next_state <= POTHOLE;
              end if; 

            when POTHOLE =>
              if input = '01' then
                next_state <= TRIPPED; 
              end if; 

            when TRIPPED =>
              output = '1'; 
              if input = '10' then
                next_state <= SMOOTH; 
              end if; 
          end case; 
        end process; 
end architecture; 
