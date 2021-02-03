library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reLu is
    Port(x: in integer;
         y: out integer);
end reLu;

architecture Behavioral of reLu is
  
begin

    y <= x when x >= 0 else 0;
    
end Behavioral;
