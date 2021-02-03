library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

LIBRARY work;
USE work.type_declarations.all;

entity ANN_tb is
--  Port ( );
end ANN_tb;

architecture Behavioral of ANN_tb is
signal sigOut: matrix_t (0 to 9, 0 to 1);
signal X: integer;
begin
    
    DUT: entity Work.network
             generic map(20)
             port map(X,  sigOut);


gen_vect_test: process
 begin
  X <= 0;
  
  wait for 100 ns;
   
    X <= 1;
    wait for 100 ns;
  X <= 3;
  wait for 100 ns;
  X <= 4;
    wait for 100 ns;
  X <= 7;
  wait for 100 ns;
 wait;
 end process gen_vect_test; 
end Behavioral;
