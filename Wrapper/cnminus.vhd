----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:55:04 03/02/2010 
-- Design Name: 
-- Module Name:    cnminus - Behavioral 
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

entity cnminus is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           m : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           y : out  STD_LOGIC);
end cnminus;

architecture Behavioral of cnminus is
	signal y_aux : std_logic;
	signal a_aux : std_logic;
	signal b_aux : std_logic;
	signal m_aux : std_logic;
	
begin

	a_aux <= a and (NOT reset);
	b_aux <= b and (NOT reset);
	m_aux <= m and (NOT reset);
	
	y_aux <= (y_aux AND a_aux ) OR( a_aux AND b_aux )OR( y_aux AND b_aux) OR (y_aux AND m_aux ) ;
	y <= y_aux;

end Behavioral;

