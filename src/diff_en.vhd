----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:37:34 08/16/2016 
-- Design Name: 
-- Module Name:    diff_en - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity diff_en is
    Port ( input : in  STD_LOGIC;
           output : out  STD_LOGIC;
           clk : in  STD_LOGIC;
           clk_en : in  STD_LOGIC;
           rst : in  STD_LOGIC);
end diff_en;

architecture Behavioral of diff_en is

signal buff : STD_LOGIC; 

begin

process(input,clk_en,rst,clk,buff)
begin
if ( rising_edge (clk) ) then
	if (rst = '1') then
		output <= '0'; 
		buff <= '0'; 
	elsif ( clk_en = '1') then
		buff <= buff XOR input; 
		
	else
		output <= '0'; 
		buff <= '0'; 

	end if;
end if;	
output <= buff;
end process;



end Behavioral;

