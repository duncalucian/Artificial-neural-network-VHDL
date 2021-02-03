
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

LIBRARY work;
USE work.type_declarations.all;

entity normalizare_tb is
--  Port ( );
end normalizare_tb;

architecture Behavioral of normalizare_tb is
signal X: matrix_t(0 to 2, 0 to 1); 
signal Y: matrix_t(0 to 2, 0 to 1); 

begin

DUT2: entity Work.normalizare
             generic map(numNeurons => 3)
             port map(X,Y);
gen_vect_test: process

 begin

   X <= ((3, 0),
         (5, 0),
         (2, 0));
   
   wait for 40ns;
    X <= ((6, 0),
         (4, 0),
         (8, 0));
    
 wait;
 end process gen_vect_test; 
end Behavioral;
