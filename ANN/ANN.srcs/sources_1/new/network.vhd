library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

LIBRARY work;
USE work.type_declarations.all;

entity network is
   generic(imgSize: integer);
   Port (selector: in integer;
         output: out matrix_t(0 to 9 , 0 to 1));
end network;

architecture Behavioral of network is
signal image: matrix_t (0 to imgSize -1 , 0 to imgSize - 1);
signal output_first_layer: matrix_t (0 to imgSize * imgSize - 1, 0 to 1);
signal outputHidden: matrix_t (0 to 9, 0 to 1);
signal sigOut: matrix_t (0 to 9, 0 to 1);
begin
    image <= img1 when selector = 1 else
             img4 when selector = 4 else
             img3 when selector = 3 else
             img7 when selector = 7 else
             img0 when selector = 0;
             
    et1: entity Work.first_layer
                generic map (imgSize )
                port map (image, output_first_layer);

     et2: entity Work.hiddenLayer
                generic map (10, 400)
                port map (weigthsHidden, 
                output_first_layer,
                 biasHidden, 
                 outputHidden);
                
     et3: entity Work.outputLayer
                generic map (10, 10)
                port map (weigthsOutput, outputHidden, biasOutput, sigOut);

    output <= sigOut;
end Behavioral;
