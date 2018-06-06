----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:37:06 08/11/2016 
-- Design Name: 
-- Module Name:    Conventional_Encoder - Behavioral 
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

entity Conventional_Encoder is
    Port ( input : in  STD_LOGIC;
           out_I : out  STD_LOGIC;
           out_Q : out  STD_LOGIC;
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           clk_en : in  STD_LOGIC);
end Conventional_Encoder;

architecture Behavioral of Conventional_Encoder is
signal buff : STD_LOGIC_VECTOR (5 downto 0);

begin

process(clk,clk_en,rst,buff,input)
begin
if (rst = '1') then
		buff <= "000000";
		out_I <= '0';
		out_Q <= '0';

elsif ( rising_edge (clk) ) then
	
	if ( clk_en = '1') then
		buff  <=  buff (4 downto 0) & input;
		out_I <= (((input XOR buff(0))XOR buff(1))XOR buff(2)) XOR buff(5);
		out_Q <= (((input XOR buff(1))XOR buff(2))XOR buff(4)) XOR buff(5);		
	else
		buff <= "000000";
		out_I <= '0';
		out_Q <= '0';

	end if;
end if;	



end process;

end Behavioral;

