
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

LIBRARY work;
USE work.type_declarations.all;

entity matrixMultiplication_tb is
--  Port ( );
end matrixMultiplication_tb;

architecture Behavioral of matrixMultiplication_tb is
signal X: matrix_t(0 to 2, 0 to 1); 
 signal y: matrix_t(0 to 1, 0 to 1);
  signal S: matrix_t(0 to 2, 0 to 1);
begin
DUT: entity Work.matrixMultiplication
             generic map(C1 => 3, R1 => 2, C2=>2, R2=>2)
             port map(X,  Y,  S);


gen_vect_test: process

 begin
    X <= ((0, 1), (1, 0), (1, 1));
    Y <= ((0,0), (1,0));
    wait for 20ns;
     X <= ((3, 1), (1, 2), (1, 2));
    Y <= ((1,1), (1,1));
   
    wait for 20ns;
    
 wait;
 end process gen_vect_test; 
end Behavioral;
