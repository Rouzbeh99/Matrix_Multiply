library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
use work.dot_prod_pkg.all;

use ieee_proposed.float_pkg.all;

entity dot_prod_top is
    port (
        i_CLK       : in std_logic;
        i_RST       : in std_logic;
        i_A         : in t_in_vec;
        i_B         : in t_in_vec;
        o_C         : out integer
        );
end dot_prod_top;

architecture behave of dot_prod_top is

    signal r_RESULT : integer               := (others => '0');
    signal r_A      : vec_type              := (others => (others => '0'));
    signal r_B      : vec_type              := (others => (others => '0'));

begin

    p_DOT_PROD : process (i_CLK) is
    begin
        if rising_edge(i_CLK) then
            r_RESULT <= dot_prod(r_A, r_B);
        end if;
    end process;

   r_A <= i_A;
   r_B <= i_B;
   o_C <= r_RESULT;

end behave;
