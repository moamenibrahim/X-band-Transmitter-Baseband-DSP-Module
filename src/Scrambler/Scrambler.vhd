----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:39:53 08/11/2016 
-- Design Name: 
-- Module Name:    Scrambler - Behavioral 
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

entity Scrambler is
    Port ( clk : in  STD_LOGIC;
           clk_en : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           input : in  STD_LOGIC;
           output : out  STD_LOGIC);
end Scrambler;

architecture Behavioral of Scrambler is
signal buff : STD_LOGIC_VECTOR (19 downto 0);
signal out_xor : STD_LOGIC;
begin



process(clk,clk_en,rst,buff,input,out_xor)
begin

if (rst = '1') then
		buff <= "00000000000000000000";
		out_xor <= '0';
elsif ( rising_edge (clk) ) then
	
  if ( clk_en = '1') then
		
		buff <=   buff (18 downto 0) & ((buff(2) xor buff(19)) XOR input);	
		out_xor <= (buff(2) xor buff(19)) XOR input;		
	else
	
		buff <= "00000000000000000000";
	end if;
end if;	

output <= out_xor;

end process;

end Behavioral;

