----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:08:52 08/08/2016 
-- Design Name: 
-- Module Name:    Mux - Behavioral 
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

entity Mux is
    Port ( input : in  STD_LOGIC_VECTOR (4 downto 0);
			  rst : in STD_LOGIC; 
			  clk : in STD_LOGIC;
           sel : in  STD_LOGIC_VECTOR (2 downto 0);
           output : out  STD_LOGIC
           );
end Mux;

architecture Behavioral of Mux is

begin

process (sel,input,clk,rst)
begin
if ( clk'event and clk ='1') then
      if (rst = '1') then
         output <= '0';
	  else
	  
		case sel is
		when "000" => output <= input(0);
		when "001" => output <= input(1);
		when "010" => output <= input(2);
		when "011" => output <= input(3);
		when "100" => output <= input(4);
		when others => output <= '0';
		end case;

	  end if;
end if;  

end process;

end Behavioral;

