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
  type state_t is (MAGNOLIA, WILLOWDALE, APPLE_HILL, NORMANDY,
                   SUNNY_ACRES, MORGAN, LAKESHORE_20551, 
                   CHURCHILL, LAKESHORE_20713, SAINT-ANDREWS, 
                   LAKESHORE_20846, MACDONALD
                  
