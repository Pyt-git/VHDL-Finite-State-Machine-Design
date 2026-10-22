-- Stm_411_bus_stop_tracker Mealy FSM:

-- State definition: 

-- Let FSM states MAGNOLIA_WB, WILLOWDALE, APPLE_HILL_WB, NORMANDY_WB, 
--                SUNNY_ACRES_WB, MORGAN_WB, LAKESHORE_20551, 
--                CHURCHILL_WB, LAKESHORE_20713, SAINT_ANDREWS_WB, 
--                LAKESHORE_20846_WB and MACDONALD
-- represent the Westbound stops of the 411 route along Lakeshore Road.
-- Reference: https://beta.stm.info/horaires-et-trajets/bus/411/ouest

-- Let FSM states LAKESHORE_20846_EB, SAINT_ANDREWS_EB, _CASE, 
--                CHURCHILL_EB, LAKESHORE_20578, MORGAN_EB, 
--                SUNNY_ACRES_EB, NORMANDY_EB, APPLE_HILL_EB and 
--                WILSON, MAGNOLIA_EB.
-- represent the Eastbound stops of the 411 route along Lakeshore Road. 
-- Reference: https://beta.stm.info/horaires-et-trajets/bus/411/est. 

-- Let FSM state DETOUR_EN_COURS represent state of the bus after it departs MACDONALD.
-- Let FSM state BREAK_AT_MACDONALD represent drivers taking a break at terminus stop. 

-- Characteristics: 
-- Input determines whether the bus has departed its stop.
-- Output = '01' when the bus reaches stop Lakeshore / Churchill (state CHURCHILL): stop detected. 
-- Output = '10' when the bus is detouring: detour in progress after departing MACDONALD. 
-- Output = '11' when driver is taking a break.
-- Not a real route simulator: Check the STM's website for complete 411 route stops. 

library ieee; 
use ieee.std_logic.1164.all; 

entity Stm_411_bus_stop_tracker_Mealy is
  port(
    clock, reset, input: in std_logic; 
    output: out std_logic_vector(1 downto 0)
  );
end entity;

architecture behavioral of  Stm_411_bus_stop_tracker_Mealy is
  type bus_stop is (MAGNOLIA, WILLOWDALE, APPLE_HILL_WB, NORMANDY_WB,
                   SUNNY_ACRES_WB, MORGAN_WB, LAKESHORE_20551, 
                   CHURCHILL_WB, LAKESHORE_20713, SAINT_ANDREWS_WB, 
                   LAKESHORE_20846_WB, MACDONALD, BREAK_AT_MACDONALD,
                   DETOUR_EN_COURS, LAKESHORE_20846_EB, SAINT_ANDREWS_EB, 
                   _CASE, CHURCHILL_EB, LAKESHORE_20578, MORGAN_EB, 
                   SUNNY_ACRES_EB, NORMANDY_EB, APPLE_HILL_EB, 
                   WILSON
  );
  signal stop, next_stop: bus_stop; 
  signal counter: integer := 0; 
begin
  reg: process(clock, reset)
    begin 
      if reset = '1' then
        stop <= MAGNOLIA_WB; 
      elsif rising_edge(clock) then
        stop <= next_stop; 
      end if; 
    end process; 

    next_logic: process(stop, input)
    begin
      next_stop <= stop;
      output = '00'; 

      case stop is 
        when MAGNOLIA_WB => 
          if input = '1' then
            next_stop <= WILLOWDALE; 
          end if; 

        when WILLOWDALE => 
          if input = '1' then
            next_stop <= APPLE_HILL_WB; 
          end if; 

        when APPLE_HILL_WB =>
          if input = '1' then
            next_stop <= NORMANDY_WB; 
          end if; 

        when NORMANDY_WB =>
          if input = '1' then
            next_stop <= SUNNY_ACRES_WB; 
          end if; 

        when SUNNY_ACRES_WB =>
          if input = '1' then
            next_stop <= MORGAN_WB; 
          end if; 

        when MORGAN_WB =>
          if input = '1' then
            next_stop <= LAKESHORE_20551; 
          end if; 

        when LAKESHORE_20551 =>
          if input = '1' then
            next_stop <= CHURCHILL_WB; 
            output <= '01';
          end if; 

        when CHURCHILL_WB =>
          if input = '1' then
            next_stop <= LAKESHORE_20713; 
          else
            output <= '01'; 
          end if; 

        when LAKESHORE_20713 =>
          if input = '1' then
            next_stop <= SAINT_ANDREWS_WB; 
          end if; 

        when SAINT_ANDREWS_WB =>
          if input = '1' then
            next_stop <= LAKESHORE_20846_WB; 
          end if; 

        when LAKESHORE_20846_WB =>
          if input = '1' then
            next_stop <= MACDONALD; 
          end if; 

        when MACDONALD =>
          if input = '1' then
            next_stop <= BREAK_AT_MACDONALD; 
            counter <= 20;
            output <= '11'; 
          end if; 

        when BREAK_AT_MACDONALD =>
          if counter > 0 then
            counter <= counter - 1;
            next_stop <= BREAK_AT_MACDONALD; 
            output <= '11';
          else
            next_stop <= DETOUR_EN_COURS; 
          end if; 

        when DETOUR_EN_COURS =>
          if input = '1' then
            next_stop <= LAKESHORE_20846_EB; 
          else
            output <= '10'
          end if; 

        when LAKESHORE_20846_EB =>
          if input = '1' then
            next_stop <= SAINT_ANDREWS_EB; 
          end if; 

        when SAINT_ANDREWS_EB =>
          if input = '1' then
            next_stop <= _CASE; 
          end if; 

        when _CASE =>
          if input = '1' then
            next_stop <= CHURCHILL_EB; 
            output <= '01'; 
          end if; 

        when CHURCHILL_EB =>
          if input = '1' then
            next_stop <= LAKESHORE_20578; 
          else
            output <= '01';
          end if; 

        when LAKESHORE_20578 =>
          if input = '1' then
            next_stop <= MORGAN_EB; 
          end if; 

        when MORGAN_EB =>
          if input = '1' then
            next_stop <= SUNNY_ACRES_EB; 
          end if; 

        when SUNNY_ACRES_EB =>
          if input = '1' then
            next_stop <= NORMANDY_EB; 
          end if; 

        when NORMANDY_EB =>
          if input = '1' then
            next_stop <= APPLE_HILL_EB; 
          end if; 

        when APPLE_HILL_EB =>
          if input = '1' then
            next_stop <= WILSON; 
          end if; 

        when WILSON =>
          if input = '1' then
            next_stop <= MAGNOLIA_EB; 
          end if; 
            
        when MAGNOLIA_EB =>
          if input = '1' then
            next_stop <= MAGNOLIA_WB; 
          end if; 
      end case; 
    end process; 
  end architecture;
