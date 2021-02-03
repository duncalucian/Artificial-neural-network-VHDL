
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

LIBRARY work;
USE work.type_declarations.all;

entity hidden_layer_tb is
--  Port ( );
end hidden_layer_tb;

architecture Behavioral of hidden_layer_tb is
signal X: matrix_t(0 to 1, 0 to 1); 
signal y: matrix_t(0 to 3, 0 to 1);
signal weigths: matrix_t(0 to 1, 0 to 3); 
signal bias: matrix_t(0 to 1, 0 to 1); 
signal output: matrix_t(0 to 1, 0 to 1); 
begin
DUT: entity Work.first_layer
             generic map(2)
             port map(X,  Y);

DUT2: entity Work.hiddenLayer
             generic map(numNeurons => 2, numInputs => 4)
             port map(weigths, 
             Y, 
             bias,
             output);
gen_vect_test: process

 begin
   
   X <= ((3, 2),
         (6, 4));
          
   weigths <= ((1,1,0,0),
                (0,0,1,1));
                 
   bias <= ((0,0), 
            (0,0));
   
    
 wait;
 end process gen_vect_test; 
end Behavioral;
