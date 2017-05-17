----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:46:29 03/02/2010 
-- Design Name: 
-- Module Name:    cplus - Behavioral 
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

entity cplus is
    Port ( a : in  STD_LOGIC;
           p : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           y : out  STD_LOGIC);
end cplus;

architecture Behavioral of cplus is
	signal y_aux : std_logic;
begin
	y_aux <=  (not reset)  and (( p or y_aux ) and a);
	y <= y_aux;

end Behavioral;

