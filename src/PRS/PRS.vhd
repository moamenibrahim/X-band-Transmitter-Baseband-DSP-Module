----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:27:22 08/11/2016 
-- Design Name: 
-- Module Name:    PRS - Behavioral 
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

entity PRS is
    Port ( clk : in  STD_LOGIC;
           clk_en : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           output : out  STD_LOGIC);
end PRS;

architecture Behavioral of PRS is
signal buff : STD_LOGIC_VECTOR (6 downto 0);
begin

process(clk,clk_en,rst,buff)
begin
if (rst = '1') then
		buff <= "0000001";

elsif ( rising_edge (clk) ) then
	
	if ( clk_en = '1') then
		buff (6 downto 0) <= buff (5 downto 0) & (buff(2) xor buff(6)) ;		
	else
		buff <= "0000001";
	end if;
end if;	

output <= buff(6);

end process;
end Behavioral;

