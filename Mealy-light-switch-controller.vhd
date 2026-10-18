library ieee; 
use ieee.std_logic.1164.all; 

entity mealy_controller is
  port(clock, reset, input: in std_logic; 
       day_of_week: out std_logic_vector(2 downto 0)
       output: out std_logic
  );
end entity; 

architecture behavioral of mealy_controller is
  type state_t is (MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY); 
  signal state, next_state: state_t; 
begin 
  reg: process(clock, reset) 
    begin 
      if (reset = '1') then
        state <= MONDAY; 
      elsif rising_edge(clock) then
        state <= next_state; 
      end if; 
    end process; 

    next_logic: process(state, input)
      begin 
        case state is
          when MONDAY =>
             if input = '1' then 
               next_state <= TUESDAY;
               output = '0'; 
             else
               next_state <= MONDAY; 
               output = '1';
             end if; 
               
          when TUESDAY =>
             if input = '1' then 
               next_state <= WEDNESDAY; 
               output = '1'; 
             else 
               next_state <= TUESDAY; 
               output = '0'; 
             end if; 

          when WEDNESDAY => 
            if input = '1' then
              next_state <= THURSDAY; 
              output = '0'; 
            else
              
              
            
               
