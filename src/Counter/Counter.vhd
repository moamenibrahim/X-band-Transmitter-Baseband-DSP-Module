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

entity Counter is
	port(clock_enable : in std_logic;
	clock : in std_logic;
	reset : in std_logic;
	reg_out : out std_logic_vector (6 downto 0));
		  
end Counter;


architecture Behavioral of Counter is
   signal reg_name: std_logic_vector(6 downto 0);

begin

process(clock,reset,clock_enable,reg_name)
begin
   if ( clock'event and clock ='1') then
      if (reset = '1') then
         reg_name <= (others => '0');
		elsif (reg_name = 127) then 
			reg_name <= "0000000" ;
      elsif clock_enable='1' then 
		  reg_name <= reg_name + 1;
		else
			reg_name <= (others => '0');
      end if;
   end if;
	reg_out <= reg_name; 
end process; 

					

end Behavioral;

