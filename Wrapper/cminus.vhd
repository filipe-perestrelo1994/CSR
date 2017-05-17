----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:42:59 06/21/2010 
-- Design Name: 
-- Module Name:    cminus - Behavioral 
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

entity cminus is
    Port ( a : in  STD_LOGIC;
           m : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           y : out  STD_LOGIC);
end cminus;

architecture Behavioral of cminus is
	signal y_aux : std_logic;
	signal a_aux : std_logic;
	signal m_aux : std_logic;
	
begin

	a_aux <= a and (NOT reset);
	m_aux <= m and (NOT reset);
	
	y_aux <= a_aux OR (y_aux AND m_aux ) ;
	y <= y_aux;

end Behavioral;

