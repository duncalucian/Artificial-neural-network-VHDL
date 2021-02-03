library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.Numeric_Std .ALL;

LIBRARY work;
USE work.type_declarations.all;

entity main is
   Port (clk: in STD_LOGIC;
         sw: in STD_LOGIC_VECTOR(3 downto 0);
         cat: out STD_LOGIC_VECTOR(6 downto 0);
         an: out STD_LOGIC_VECTOR(3 downto 0));    
    
end main;

architecture Behavioral of main is
signal selector: integer;
signal outTemp: matrix_t(0 to 9 , 0 to 1);
signal output: STD_LOGIC_VECTOR(15 downto 0);
begin

 selector <= 1 when sw = "0000" else
            4 when sw = "0100" else 
            3 when sw = "0011" else
            7 when sw = "0111" else 0;
 et1: entity Work.network
                generic map (20)
                port map (selector, outTemp);
                
  process(outTemp)
  variable percent, position:integer := 0;
  begin
      for i in 0 to 9 loop
        if outTemp(i,0) > percent then
            position := i;
            percent := outTemp(i,0);
        end if;
      end loop;
      output <= std_logic_vector(to_unsigned(percent, 16));
  end process;             
      
   
 et2: entity Work.SSD
                port map (clk, output, cat, an);

end Behavioral;