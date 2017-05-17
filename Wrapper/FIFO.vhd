----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:10:49 05/20/2010 
-- Design Name: 
-- Module Name:    FIFO - Behavioral 
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



entity FIFO is
    Port ( put : in  STD_LOGIC;
           take : in  STD_LOGIC;
           din : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           dout : out  STD_LOGIC;
           ok_to_put : out  STD_LOGIC;
           ok_to_take : out  STD_LOGIC);
end FIFO;

architecture Behavioral of FIFO is
--signal ok_to_take1               : std_logic;
--signal full2               : std_logic;
signal full0               : std_logic;
signal lt0               : std_logic;
--signal lt2               : std_logic;
--signal q1               : std_logic;


component latchD 
    Port ( D : in  STD_LOGIC;
           G : in  STD_LOGIC;
			  Reset: in  STD_LOGIC;
           Q : out  STD_LOGIC);
end component;

component LCSD is
   port ( put        : in    std_logic; 
          reset      : in    std_logic; 
          take       : in    std_logic; 
          full       : out   std_logic; 
          lt         : out   std_logic; 
          ok_to_take : out   std_logic);
end component;


begin

LCSD1 : LCSD
      port map (put => put,
                reset => reset,
                take => take,
                full => full0,
                lt => lt0,
                ok_to_take => ok_to_take);
					 
--LCSD2 : LCSD
--      port map (put=>ok_to_take1,
--                reset=>reset,
--                take=>take,
--                full=>full2,
--                lt=>lt2,
--                ok_to_take=> ok_to_take);
					 
					 
latchD1: latchD 
    port map ( D => Din,
					G => lt0,
					Reset=> reset,
					Q => Dout);
					
--latchD2: latchD 
--     port map ( D => q1,
--					G => lt2,
--					Reset=> reset,
--					Q => Dout);
				 
ok_to_put <= NOT full0;

end Behavioral;

