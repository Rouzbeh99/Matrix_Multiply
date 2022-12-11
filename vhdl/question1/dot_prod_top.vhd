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
        o_C         : out std_logic_vector(16 DOWNTO 0)
        );
end dot_prod_top;

architecture behave of dot_prod_top is

    constant n : integer := 2;
    type vec_type is array (0 to n) of std_logic_vector(15 DOWNTO 0);
    signal r_RESULT : std_logic_vector(15 DOWNTO 0)                := (others => '0');
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
