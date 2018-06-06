----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:04:14 08/16/2016 
-- Design Name: 
-- Module Name:    clk_diff - Behavioral 
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
use IEEE.STD_LOGIC_unsigned.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clk_diff is
    Port ( clk : in  STD_LOGIC;
	        clk_100 : out  STD_LOGIC;
           clk_50 : out  STD_LOGIC;
           rst : in  STD_LOGIC;
           clk_en : in  STD_LOGIC);
end clk_diff;

architecture Behavioral of clk_diff is

signal tmp : STD_LOGIC ; 

begin
process(clk,clk_en,rst,tmp)
begin
if ( rising_edge (clk) ) then
	if (rst = '1') then
		clk_50 <= '0'; 
		tmp <= '0';
	elsif ( clk_en = '1') then
			tmp <= NOT ( tmp) ; 
	else
		clk_50 <= '0'; 
		tmp <= '0';
	end if;
end if;	

clk_50 <= tmp ; 
clk_100 <= clk;

end process;

end Behavioral;

