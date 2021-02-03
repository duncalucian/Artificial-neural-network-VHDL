library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

LIBRARY work;
USE work.type_declarations.all;

entity outputLayer is
    generic( numNeurons, numInputs: integer);
    Port (weigths:in matrix_t(0 to numNeurons - 1, 0 to numInputs - 1);
          input:in matrix_t(0 to numInputs - 1, 0 to 1);    -- numNeurons - 10
          bias:in  matrix_t(0 to numNeurons - 1, 0 to 1);   --numInputs - 5
          output:out matrix_t(0 to numNeurons - 1, 0 to 1));
end outputLayer;

architecture Behavioral of outputLayer is
signal out_We: matrix_t(0 to numNeurons - 1, 0 to 1);
signal out_We_B: matrix_t(0 to numNeurons - 1, 0 to 1);
begin
    DUT: entity Work.matrixMultiplication
             generic map(C1 => numNeurons, R1 => numInputs, C2=>numInputs, R2 => 2)
             port map(weigths,  input,  out_We);
    
    et1: for i in 0 to numNeurons - 1 generate
        out_We_B(i, 0) <= bias(i, 0) + out_We(i, 0);
        
           
    end generate et1;
    ent1: entity Work.normalizare   
            generic map(numNeurons)
             port map(out_We_B,  output);

end Behavioral;
