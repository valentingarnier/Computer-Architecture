library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PC is
    port(
        clk     : in  std_logic;
        reset_n : in  std_logic;
        en      : in  std_logic;
        sel_a   : in  std_logic;
        sel_imm : in  std_logic;
        add_imm : in  std_logic;
        imm     : in  std_logic_vector(15 downto 0);
        a       : in  std_logic_vector(15 downto 0);
        addr    : out std_logic_vector(31 downto 0)
    );
end PC;

architecture synth of PC is
begin
	pc : process(clk, en)
	begin
	if(reset_n = '0') then
		addr <= (others => '0');
	elsif rising_edge(clk) then
		if(en = '1') then
			addr <= std_logic_vector(to_unsigned(to_integer(unsigned(imm)) + 4, 32));
		end if;
	end if;
	end process;
end synth;
