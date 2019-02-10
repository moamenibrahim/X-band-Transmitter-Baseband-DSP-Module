----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:38:07 08/07/2016 
-- Design Name: 
-- Module Name:    Counter - Behavioral 
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

entity u_d_Counter is
	port(clock_enable : in std_logic;
	clk : in std_logic;
	reset : in std_logic;
	up_down: in std_logic;
	reg_out : out std_logic_vector (6 downto 0));
		  
end u_d_Counter;


architecture Behavioral of u_d_Counter is
   signal reg_name: std_logic_vector(6 downto 0);

begin

process(clk,reset,clock_enable,reg_name)
begin
   if ( clk'event and clk ='1') then
      if (reset = '1') then
         reg_name <= (others => '0'); 
      elsif clock_enable='1' then 
		
			if (up_down = '1' and reg_name /= 127)then
				reg_name <= reg_name + 1;
			elsif (up_down = '0' and reg_name /= 0) then 
				reg_name <= reg_name - 1;
			end if;
			
		else
			reg_name <= (others => '0');
      end if;
   end if;
	
	reg_out <= reg_name; 
end process; 

					

end Behavioral;

