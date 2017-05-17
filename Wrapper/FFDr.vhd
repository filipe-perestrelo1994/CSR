----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:48:32 05/20/2010 
-- Design Name: 
-- Module Name:    FFDr - Behavioral 
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

entity FFDr is
    Port ( D : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end FFDr;

architecture Behavioral of FFDr is

begin

process(clk)
begin
	if reset = '1' then   -- or '0' if RESET is active low...
    Q <= '0';
		else if clk = '1' and clk'event then--use rising edge, use  "if CLK = '0' and CLK'event" instead for falling edge
			Q <= D;
		end if;
	end if;
end process;

end Behavioral;

