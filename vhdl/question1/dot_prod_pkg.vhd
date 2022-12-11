library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;


-- declaration of package

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
    constant n : integer := 2;
    type vec_type is array (0 to n) of std_logic_vector(15 DOWNTO 0);
    variable c : out std_logic_vector(a'length+1 DOWNTO 0);
    variable i : integer := 0;
begin
        c(0) <= '0';
        for i in 1 to a'length loop
            c(i) := c(i-1) + (a(i-1)*b(i-1));
        end loop;

        o_C <= c(c'length-1)

end sequential;