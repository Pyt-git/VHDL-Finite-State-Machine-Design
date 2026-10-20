-- Stm_411_bus_stop_tracker Mealy FSM:

-- State definition: 

-- Let FSM states be: MAGNOLIA, WILLOWDALE, APPLE_HILL, NORMANDY, 
--                    SUNNY_ACRES, MORGAN, LAKESHORE_20551, 
--                    CHURCHILL, LAKESHORE_20713, SAINT_ANDREWS, 
--                    LAKESHORE_20846 and MACDONALD. 

-- Reference: https://beta.stm.info/horaires-et-trajets/bus/411/ouest

-- Characteristics: 
-- Input determines whether the bus has departed its stop.
-- Output = '1' when the bus reaches stop Lakeshore / Churchill (state CHURCHILL).
-- Not a real route simulator: FSM resets to state MAGNOLIA after reaching state MACDONALD. 
-- FSM states are defined as the stops of the 411 route along Lakeshore Road. 

library ieee; 
use ieee.std_logic.1164.all; 

entity Stm_411_bus_stop_tracker_Mealy is
  port(
    clock, reset, input: in std_logic; 
    output: out std_logic
  );
end entity;

architecture behavioral of  Stm_411_bus_stop_tracker_Mealy is
  type bus_stop is (MAGNOLIA, WILLOWDALE, APPLE_HILL, NORMANDY,
                   SUNNY_ACRES, MORGAN, LAKESHORE_20551, 
                   CHURCHILL, LAKESHORE_20713, SAINT_ANDREWS, 
                   LAKESHORE_20846, MACDONALD
  );
  signal stop, next_stop: bus_stop; 

begin
  reg: process(clock, reset)
    begin 
      if reset = '1' then
        stop <= MAGNOLIA; 
      elsif rising_edge(clock) then
        stop <= next_stop; 
      end if; 
    end process; 

    next_logic: process(stop, input)
    begin
      next_stop <= stop;
      output = '0'; 

      case stop is 
        when MAGNOLIA => 
          if input = '1' then
            next_stop <= WILLOWDALE; 
          end if; 

        when WILLOWDALE => 
          if input = '1' then
            next_stop <= APPLE_HILL; 
          end if; 

        when APPLE_HILL =>
          if input = '1' then
            next_stop <= NORMANDY; 
          end if; 

        when NORMANDY =>
          if input = '1' then
            next_stop <= SUNNY_ACRES; 
          end if; 

        when SUNNY_ACRES =>
          if input = '1' then
            next_stop <= MORGAN; 
          end if; 

        when MORGAN =>
          if input = '1' then
            next_stop <= LAKESHORE_20551; 
          end if; 

        when LAKESHORE_20551 =>
          if input = '1' then
            next_stop <= CHURCHILL; 
            output <= '1';
          end if; 

        when CHURCHILL =>
          if input = '1' then
            next_stop <= LAKESHORE_20713; 
          else
            output <= '1'; 
          end if; 

        when LAKESHORE_20713 =>
          if input = '1' then
            next_stop <= SAINT_ANDREWS; 
          end if; 

        when SAINT_ANDREWS =>
          if input = '1' then
            next_stop <= LAKESHORE_20846; 
          end if; 

        when LAKESHORE_20846 =>
          if input = '1' then
            next_stop <= MACDONALD; 
          end if; 

        when MACDONALD =>
          if input = '1' then
            next_stop <= MAGNOLIA; 
          end if; 
    end case; 
  end process; 
end architecture; 
