library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;


package dot_prod_type is
constant n : integer := 2;  --bits wide
type vec_type is array(0 to n) of std_logic_vector (15 downto 0);
end package dot_prod_type;


ENTITY dot_prod_pkg is
        port(
                i_CLK       : in std_logic;
                i_RST       : in std_logic;
                i_A         : in vec_type;
                i_B         : in vec_type;
                o_C         : out std_logic_vector(15 DOWNTO 0)
            );

end ENTITY dot_prod_pkg;

architecture sequential of dot_prod_pkg is
    variable n : integer := 2;
    variable i : integer := 0;
    signal c   : vec_type;

begin
        c(0) <= (others => '0');
        for i in 1 to i_A'length loop
            c(i) := c(i-1) + (i_A(i-1)*i_B(i-1));
        end loop;

        o_C <= c(c'length-1);

end sequential;