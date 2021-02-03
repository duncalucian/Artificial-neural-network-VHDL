library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.Numeric_Std .ALL;
LIBRARY work;
USE work.type_declarations.all;

entity normalizare is
     generic( numNeurons: integer);
    Port (X:in matrix_t(0 to numNeurons - 1, 0 to 1);
          Y:out matrix_t(0 to numNeurons - 1, 0 to 1));
end normalizare;

architecture Behavioral of normalizare is
constant base: integer := 3;
type arr is array (0 to 60) of unsigned(4000 downto 0);
begin

  process(X)
  variable sumTemp: unsigned(4000 downto 0);
  variable exp :  unsigned(4000 downto 0);
   variable temp: arr;
  begin
    sumTemp := to_unsigned(0, 4001);
    e1:for i in 0 to numNeurons - 1 loop
    
        exp := to_unsigned(x(i, 0), 4001);
        if x(i,0) > 0 then
            sumTemp := sumTemp + exp;
   
        end if;
    end loop e1;
    
      et3: for i in 0 to numNeurons - 1 loop
       if x(i,0) > 0 then
          Y(i, 0) <= to_integer((to_unsigned(x(i, 0), 4001) * 100) / sumTemp);
          else
          Y(i,0) <= 0;
       end if;
        Y(i, 1) <= 0;
        
      end loop et3;
  end process;
  
end Behavioral;
