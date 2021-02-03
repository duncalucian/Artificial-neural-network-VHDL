library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity SSD is
Port (clk :in STD_LOGIC;
      sin: in STD_LOGIC_VECTOR(15 downto 0);
      cat: out STD_LOGIC_VECTOR(6 downto 0);
      an: out STD_LOGIC_VECTOR(3 downto 0)     
      
      );
end SSD;

architecture Behavioral of SSD is
SIGNAL count16: STD_LOGIC_VECTOR(16 downto 0) := (others => '0');
SIGNAL sel: STD_LOGIC_VECTOR(1 downto 0);
SIGNAL temp : STD_LOGIC_VECTOR(3 downto 0);
begin

sel <= count16(15 downto 14);

process(clk)
begin
if clk = '1' and clk'event then
    count16 <= count16 + 1;
    end if;
end process;




process(sel)
begin
case sel is
     when "11" => an <= "1110"; 
     when "10" => an <= "1101";
     when "01" => an <= "1011";
     when "00" => an <= "0111";
     when others  => an <= "1111";
     end case;
end process;

process(sel)
begin
case sel is
     when "00" => temp <= sin(15 downto 12);
     when "01" => temp <= sin(11 downto 8);
     when "10" => temp <= sin(7 downto 4);
     when "11" => temp <= sin(3 downto 0);
     when others  => temp <= "0000";
     end case;
end process;

process(temp)
begin 
 case temp is
  when "0000" => cat <= "1000000";  --0
  when "0001" => cat <= "1111001";  --1
  when "0010" => cat <= "0100100";  --2
  when "0011" => cat <= "0110000";  --3
  when "0100" => cat <= "0011001";  --4
  when "0101" => cat <= "0010010";  --5
  when "0110" => cat <= "0000010";  --6
  when "0111" => cat <= "1111000";  --7
  when "1000" => cat <= "0000000";  --8
  when "1001" => cat <= "0010000";  --9
  when "1010" => cat <="0001000"; --A
  when "1011" => cat <="0000011"; --b
  when "1100" => cat <="1000110"; --C
  when "1101" => cat <= "0100001"; --D
  when "1110" => cat <="0000110"; --E
  when "1111" => cat <="0001110"; --F
  when others => cat <="0000000";

  end case;
end process;

end Behavioral;
