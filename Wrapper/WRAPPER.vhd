----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:52:08 05/21/2010 
-- Design Name: 
-- Module Name:    WRAPPER - Behavioral 
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

entity WRAPPER is
    Port ( Sin : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           rx_clk : in  STD_LOGIC;
			  tx_clk : in  STD_LOGIC;
           Sout : out  STD_LOGIC);
end WRAPPER;

architecture Behavioral of WRAPPER is

signal sig_okput : std_logic;
signal sig_put : std_logic;
signal sig_din : std_logic;

signal sig_dout : std_logic;
signal sig_oktake : std_logic;
signal sig_take : std_logic;

component FIFO 
    Port ( put : in  STD_LOGIC;
           take : in  STD_LOGIC;
           din : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           dout : out  STD_LOGIC;
           ok_to_put : out  STD_LOGIC;
           ok_to_take : out  STD_LOGIC);
end component;

component PortIn 
    Port ( Sin : in  STD_LOGIC;
           ok_to_put : in  STD_LOGIC;
           put : out  STD_LOGIC;
           data : out  STD_LOGIC;
			  tx_clk:  in  STD_LOGIC;
			  reset: in STD_LOGIC);
end component;

component PortOut 
    Port ( data : in  STD_LOGIC;
           ok_to_take : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           rx_clk : in  STD_LOGIC;
           Sout : out  STD_LOGIC;
           take : out  STD_LOGIC);
end component;

begin

PortIn1 : PortIn
      port map (Sin=> Sin,
                ok_to_put=> sig_okput,
                put=> sig_put,
                data=> sig_din,
					 tx_clk=> tx_clk,
					 reset=> reset
                );
					 
FIFO1 : FIFO 
    port map ( put => sig_put,
           take => sig_take,
           din => sig_din,
           reset => reset,
           dout => sig_dout,
           ok_to_put => sig_okput ,
           ok_to_take => sig_oktake);
			  
PortOut1 : PortOut
      port map (data=> sig_dout,
                ok_to_take=> sig_oktake,
                reset=> reset,
                rx_clk=> rx_clk,
					 Sout=> Sout,
					 take=> sig_take
                );	

end Behavioral;

