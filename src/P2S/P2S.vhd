----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:32:25 08/08/2016 
-- Design Name: 
-- Module Name:    P2S - Behavioral 
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

entity P2S is
    Port ( input : in  STD_LOGIC_VECTOR (4 downto 0);
			  rst : in STD_LOGIC;
			  clk : in STD_LOGIC;
			  clk_en : in  STD_LOGIC;
           output : out  STD_LOGIC);
end P2S;

architecture Behavioral of P2S is
signal x: std_logic_vector (2 downto 0 );

begin
process(clk,input,rst,x,clk_en)

begin
	if ( rising_edge(clk) ) then
      if (rst = '1') then
         output <= '0';
		
	elsif ( clk_en = '1') then
			if (x = 0)then
				output <= input(conv_integer (x));
				x <= x + 1;
			elsif(x = 1)then
				output <= input(conv_integer (x));
				x <= x + 1;				
			elsif(x = 2)then
				output <= input(conv_integer (x));
				x <= x + 1;				
			elsif(x = 3)then
				output <= input(conv_integer (x));
				x <= x + 1;
			elsif(x = 4)then
				output <= input (conv_integer (x));
				x <= "000";
			else
				output <= '0';
			end if;
			
			
	else 
	      output <= '0';
	end if;
end if;

	end process;
			
end Behavioral;

