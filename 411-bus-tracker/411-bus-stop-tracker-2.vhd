-- Part 1 of this Mealy FSM simulated the 411 Express Lionel-Groulx route's stops on Lakeshore Road. 
-- Part 2 will simulate the remaining stops (ie, Station Lionel-Groulx (61337) to Beaconsfield / Brentwood for the Westbound route
-- And from Beaconsfield / Redfern to Station Lionel-Groulx (61329) for its Eastbound counterpart). 

-- State definition for the Westbound 411 route:

-- Let states LIONEL_GROULX_61337 and TERMINUS_DORVAL_57539 represent transfer stops. 
-- Let states GARE_PINE_BEACH, GARE_POINTE_CLAIRE, A20_O_ST_JEAN and A20_CARTIER_WB represent the highway stops. 
-- Let states PRAIRIE, SAINT_CHARLES, KENWOOD_WB, FIELDSEND, GABLES_WB, BEACONSFIELD_CT_WB, SHORE_WB, HARROW_WB, NEVEU_WB, LEGAULT_WB,
--            SAINT_LOUIS_WB, WOODLAND_WB, MADSEN_WB, LAKEVIEW_WB and BRENTWOOD represent the stops off highway. 

-- State definition for the Eastbound 411 route: 

-- Let states REDFERN, LAKEVIEW_EB, MADSEN_EB, WOODLAND_EB, SAINT_LOUIS_EB, LEGAULT_EB, NEVEU_EB, HARROW_EB, 
--            SHORE_EB, BEACONSFIELD_CT_EB, GABLES_EB, EAST_GABLES, KENWOOD_EB and BEACONSFIELD 
-- represent the off-highway stops. 

-- Let states A20_CARTIER_EB, A20_SAINT_JEAN, GARE_POINTE_CLAIRE, HERRON_PINE_BEACH, 
--            HERRON_DUMONT and HERRON_ROND_POINT 
-- represent the highway stops. 

-- Let states TERMINUS_DORVAL_57538 and LIONEL_GROULX_61329 represent the transfer stops. 

