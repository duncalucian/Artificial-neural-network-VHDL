library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

LIBRARY work;
USE work.type_declarations.all;

entity first_layer is
   generic( imgSize: integer);
    Port(input: in matrix_t(0 to imgSize-1, 0 to imgSize-1);
         output: out matrix_t(0 to (imgSize * imgSize)-1, 0 to 1)
    );
    
end first_layer;

architecture Behavioral of first_layer is
    
begin
    first: for i in 0 to (imgSize * imgSize)-1 generate
        output(i, 0) <= input(i/imgSize, i mod imgSize);
        output(i, 1) <= 0;
    end generate first; 

end Behavioral;
