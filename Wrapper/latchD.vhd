----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:26:36 05/19/2010 
-- Design Name: 
-- Module Name:    latchD - Behavioral 
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

entity latchD is
    Port ( D : in  STD_LOGIC;
           G : in  STD_LOGIC;
			  Reset: in  STD_LOGIC;
           Q : out  STD_LOGIC);
end latchD;

architecture Behavioral of latchD is
signal store : std_logic;
begin

process (G, Reset, D) is
begin 
	if G='1' and Reset='0' then
		Q<= D;
		store <= D;
		else if G='0' and Reset='0' then
			Q<= store;
		end if;
	end if;
	if Reset='1' then
		Q<='0';
		store<='0';
	end if;

end process;



end Behavioral;

