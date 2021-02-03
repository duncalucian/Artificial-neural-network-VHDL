library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

LIBRARY work;
USE work.type_declarations.all;

entity matrixMultiplication is
    generic( C1, R1, C2, R2: integer := 2);
    Port (mat1:in matrix_t(0 TO C1-1, 0 TO R1-1);
          mat2:in matrix_t(0 TO C2-1, 0 TO R2-1);
          rez:out matrix_t(0 to C1-1, 0 to R2-1)); 
          
end matrixMultiplication;

architecture Behavioral of matrixMultiplication is
signal loop1, loop2, loop3: STD_LOGIC := '0';

begin



    process(mat1, mat2)
    variable i, j, k: integer := 0;  
    variable stop: STD_LOGIC := '0';
    variable temp: matrix_t(0 to C1-1, 0 to R2-1);

      begin
        L11: for i in 0 to C1-1 loop
                L22: for j in 0 to R2-1 loop
                    L33: for k in 0 to C2-1 loop
                        temp(i,j) := 0;
                    end loop L33;
                 end loop L22;
            end loop L11;
            L1: for i in 0 to C1-1 loop
                L2: for j in 0 to R2-1 loop
                    L3: for k in 0 to C2-1 loop
                        temp(i,j) :=  temp(i,j) + (mat1(i,k) * mat2(k,j));
                    end loop L3;
                 end loop L2;
            end loop L1;
     
        
         rez <= temp;
          end process;
    
end Behavioral;
