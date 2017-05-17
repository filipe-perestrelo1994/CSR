----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:29:19 05/20/2010 
-- Design Name: 
-- Module Name:    PortIn - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PortIn is
    Port ( Sin : in  STD_LOGIC;
           ok_to_put : in  STD_LOGIC;
           put : out  STD_LOGIC;
           data : out  STD_LOGIC;
			  tx_clk:  in  STD_LOGIC;
			  reset: in  STD_LOGIC
			 
			  );
end PortIn;

architecture Behavioral of PortIn is
signal activate    : std_logic;
signal aux_Sin    : std_logic;
signal aux_a    : std_logic;
signal aux_y    : std_logic;
signal resetFF    : std_logic;

component cminus is
    Port ( a : in  STD_LOGIC;
           m : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           y : out  STD_LOGIC);
end component;

component FFDr is
   Port ( D : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end component;

begin

--process (Sin,ok_to_put) is
--begin 
--	if Sin='1' then
--		if ok_to_put='1' then
--		auxSin<= '1' ;
--		end if;
--	else if ok_to_put='0' then
--			auxSin<= '0' ;
--	end if;
--	end if;	
--end process; 


aux_a<= Sin and ok_to_put;

cminus1 : cminus
	port map (	 a=> aux_a,
                m=> ok_to_put,
                reset=> reset,
                y=> aux_y
					 );

resetFF<= not ok_to_put;

FFDr1 : FFDr
	port map (	 D=> aux_y,
                Q=> activate,
                clk=> tx_clk,
                reset=> resetFF
					 );

--process (tx_clk, resetFF) is
--begin 
--	if (tx_clk= '1' and tx_clk'event) or resetFF='0' then
--		if auxSin='1' then
--			activate<= '1' ;
--		else
--			activate<= '0' ;
--		end if;
--	end if;			
--end process;



put<= activate;
data<= activate;


end Behavioral;

