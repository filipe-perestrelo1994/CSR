

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity LCSD is
   port ( put        : in    std_logic; 
          reset      : in    std_logic; 
          take       : in    std_logic; 
          full       : out   std_logic; 
          lt         : out   std_logic; 
          ok_to_take : out   std_logic);
end LCSD;

architecture BEHAVIORAL of LCSD is
   attribute BOX_TYPE   : string ;
   signal bcminus          : std_logic;
   signal takeinv          : std_logic;
   signal ycminus          : std_logic;
   signal ok_to_take_DUMMY : std_logic;
   signal full_DUMMY       : std_logic;
   component cnminus
      port ( a     : in    std_logic; 
             b     : in    std_logic; 
             m     : in    std_logic; 
             reset : in    std_logic; 
             y     : out   std_logic);
   end component;
   
   component cplus
      port ( a     : in    std_logic; 
             p     : in    std_logic; 
             reset : in    std_logic; 
             y     : out   std_logic);
   end component;
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
begin
   full <= full_DUMMY;
   ok_to_take <= ok_to_take_DUMMY;
   cnm : cnminus
      port map (a=>put,
                b=>bcminus,
                m=>takeinv,
                reset=>reset,
                y=>ycminus);
   
   cp : cplus
      port map (a=>ycminus,
                p=>takeinv,
                reset=>reset,
                y=>ok_to_take_DUMMY);
   
   invt : INV
      port map (I=>take,
                O=>takeinv);
   
   ltinv : INV
      port map (I=>full_DUMMY,
                O=>lt);
   
   ok_to_take_inv : INV
      port map (I=>ok_to_take_DUMMY,
                O=>bcminus);
   
   ycnmbuf : BUF
      port map (I=>ycminus,
                O=>full_DUMMY);
   
end BEHAVIORAL;
