library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
use work.dot_prod_pkg.all;

library ieee_proposed;
use ieee_proposed.float_pkg.all;

entity dot_prod_tb is
end dot_prod_tb;

architecture behave of dot_prod_tb is

    constant c_CLK_PERIOD : time := 10 ns;

    signal r_CLK    : std_logic                 := '0';
    signal r_RST    : std_logic                 := '0';
    signal r_A      : vec_type                  := (others => (others => '0'));
    signal r_B      : vec_type                  := (others => (others => '0'));
    signal w_RESULT : float32                   := (others => '0');
begin

  DOT_PROD_TOP_INST : dot_prod_top
    port map (
        i_CLK   => r_CLK,
        i_RST   => r_RST,
        i_A     => r_A,
        i_B     => r_B,
        o_C     => w_RESULT
        );

  p_CLK_GEN : process is 
  begin
    wait for c_CLK_PERIOD/2;
        r_CLK <= not r_CLK;
  end process p_CLK_GEN;

  process
  begin

    r_RST <= '1';
    wait for c_CLK_PERIOD;
    r_RST <= '0';
    r_A <= (1,1,1);
    r_B <= (1,1,1);
    wait for c_CLK_PERIOD;
    if w_RESULT = 3 then
        report "SUCESS";
    else
        report "FAILURE";
    end if;
    r_A <= (2,2,2);
    r_B <= (3,3,3);
    wait for c_CLK_PERIOD;
    if w_RESULT = 18 then
        report "SUCESS";
    else
        report "FAILURE";
    end if;

    end process;

end behave;
