----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:43:51 08/16/2016 
-- Design Name: 
-- Module Name:    DSP_top - Behavioral 
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

entity DSP_top is
    Port ( clk : in  STD_LOGIC;
           clk_en : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           output_I : out  STD_LOGIC;
           output_Q : out  STD_LOGIC
			  );
end DSP_top;

architecture Behavioral of DSP_top is

signal clk_100 : STD_LOGIC;
signal clk_50 : STD_LOGIC;
signal PRS_sig : STD_LOGIC;
signal Diff_sig : STD_LOGIC;
signal Scramb_sig : STD_LOGIC;
signal out_Q_before : STD_LOGIC;
signal scr_en : STD_LOGIC;
signal con_en : STD_LOGIC;
signal counter : STD_LOGIC_VECTOR (1 downto 0);

	COMPONENT Conventional_Encoder
	PORT(
		input : IN std_logic;
		rst : IN std_logic;
		clk : IN std_logic;
		clk_en : IN std_logic;          
		out_I : OUT std_logic;
		out_Q : OUT std_logic
		);
	END COMPONENT;
	
	

	COMPONENT PRS
	PORT(
		clk : IN std_logic;
		clk_en : IN std_logic;
		rst : IN std_logic;          
		output : OUT std_logic
		);
	END COMPONENT;

	

	COMPONENT Scrambler
	PORT(
		clk : IN std_logic;
		clk_en : IN std_logic;
		rst : IN std_logic;
		input : IN std_logic;          
		output : OUT std_logic
		);
	END COMPONENT;

	
	COMPONENT clk_diff
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		clk_en : IN std_logic;          
		clk_100 : OUT std_logic;
		clk_50 : OUT std_logic
		);
	END COMPONENT;


	COMPONENT diff_en
	PORT(
		input : IN std_logic;
		clk : IN std_logic;
		clk_en : IN std_logic;
		rst : IN std_logic;          
		output : OUT std_logic
		);
	END COMPONENT;



begin

	Inst_Conventional_Encoder: Conventional_Encoder PORT MAP(
		input => Scramb_sig,
		out_I => output_I,
		out_Q => out_Q_before,
		rst => rst,
		clk => clk_50,
		clk_en => con_en 
	);

	Inst_PRS: PRS PORT MAP(
		clk => clk_50,
		clk_en => clk_en,
		rst => rst,
		output => PRS_sig
	);

	Inst_Scrambler: Scrambler PORT MAP(
		clk => clk_50,
		clk_en => scr_en,
		rst => rst,
		input => Diff_sig,
		output => Scramb_sig
	);



	Inst_clk_diff: clk_diff PORT MAP(
		clk => clk,
		clk_100 => clk_100,
		clk_50 => clk_50,
		rst => rst,
		clk_en => clk_en
	);



	Inst_diff_en: diff_en PORT MAP(
		input => PRS_sig,
		output => Diff_sig,
		clk => clk_50,
		clk_en => clk_en,
		rst => rst
	);
	
process(clk_50,clk_en,rst)
	begin
	if (rst='1')then 
		counter <= "00";
		scr_en <= '0'; 
		con_en <= '0';
	elsif (clk_en = '1')then
		if (rising_edge(clk_50)) then
			 
			if ( counter = "10")then
				scr_en <= '1';
				counter <= counter + 1;
			elsif (counter ="11")then
				con_en <= '1';
			else
				counter <= counter + 1;
			end if;
		end if;
	end if;
	end process;	

process (clk_100,rst) 
	begin 
	
if(rst='1') then
		output_Q <= '0';
	
elsif (rising_edge(clk_100)) then		
	if (con_en = '1')then
		output_Q <= out_Q_before;
	
	end if;
end if;
	end process;

end Behavioral;

