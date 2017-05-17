----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:44:51 05/20/2010 
-- Design Name: 
-- Module Name:    PortOut - Behavioral 
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

entity PortOut is
    Port ( data : in  STD_LOGIC;
           ok_to_take : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           rx_clk : in  STD_LOGIC;
           Sout : out  STD_LOGIC;
           take : out  STD_LOGIC);
end PortOut;

architecture Behavioral of PortOut is

signal d1 : std_logic;
signal d2 : std_logic;
signal q1 : std_logic;
signal q2 : std_logic;

component FFDr is
   Port ( D : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end component;

begin

d1 <= data and ok_to_take; 
d2 <= (not q2) and q1;
take <= q2;
Sout <= q2;

FFDr1 : FFDr
	port map ( D => d1 ,
					Q => q1,
					clk => rx_clk,
					reset => reset);

FFDr2 : FFDr
	port map ( D => d2 ,
					Q => q2,
					clk => rx_clk,
					reset => reset);


end Behavioral;

