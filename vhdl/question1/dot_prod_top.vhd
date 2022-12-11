library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
use work.dot_prod_pkg.all;


entity dot_prod_top is
    port (
        i_CLK       : in std_logic;
        i_RST       : in std_logic;
        i_A         : in vec_type;
        i_B         : in vec_type;
        o_C         : out std_logic_vector(16 DOWNTO 0)
        );
end dot_prod_top;

architecture behave of dot_prod_top is

    signal r_RESULT : vec_type;
    signal r_A      : vec_type;
    signal r_B      : vec_type;

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
