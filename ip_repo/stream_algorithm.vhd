----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/13/2018 08:40:02 AM
-- Design Name: 
-- Module Name: matrix_power - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;


entity stream_algorithm is
    generic (
        DATA_WIDTH	: integer	:= 32
    );
    Port ( data_in : in STD_LOGIC_VECTOR (DATA_WIDTH-1 downto 0);
           data_out : out STD_LOGIC_VECTOR (DATA_WIDTH-1 downto 0)
         );
end stream_algorithm;

architecture Behavioral of stream_algorithm is

begin

   data_out <= data_in and x"0000FFFF";

end Behavioral;
