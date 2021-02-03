
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

LIBRARY work;
USE work.type_declarations.all;

entity first_layer_tb is
--  Port ( );
end first_layer_tb;

architecture Behavioral of first_layer_tb is
signal X: matrix_t(0 to 6, 0 to 6); 
signal y: matrix_t(0 to 48, 0 to 1);

begin
DUT: entity Work.first_layer
             generic map(7)
             port map(X,  Y);


gen_vect_test: process

 begin
    X <= ((1, 2, 3, 4, 5, 6, 7),
          (1, 2, 3, 4, 5, 6, 7),
          (1, 2, 3, 4, 5, 6, 7),
          (1, 2, 3, 4, 5, 6, 7),
          (1, 2, 3, 4, 5, 6, 7),
          (1, 2, 3, 4, 5, 6, 7),
          (1, 2, 3, 4, 5, 6, 7));
    
   
    wait for 20ns;
    
 wait;
 end process gen_vect_test; 
end Behavioral;
