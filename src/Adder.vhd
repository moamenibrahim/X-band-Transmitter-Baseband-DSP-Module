----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:27:17 08/09/2016 
-- Design Name: 
-- Module Name:    Adder - Behavioral 
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
use ieee.std_logic_unsigned.all; 


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Adder is
    Port ( a : in  STD_LOGIC_VECTOR (4 downto 0);
           b : in  STD_LOGIC_VECTOR (4 downto 0);
			  clk : in STD_LOGIC;
			  clk_en : in STD_LOGIC;
			  rst : in STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (5 downto 0));
end Adder;

architecture Behavioral of Adder is


begin

process(a,b,clk,rst,clk_en)

begin
if ( clk'event and clk ='1') then
      if (rst = '1') then
         output <= "000000";
      elsif (clk_en='1') then 
		  output <= ( a(4) & a ) + ( b(4) & b);
		else 
		  output <= "000000";
      end if;
end if;

end process;
end Behavioral;