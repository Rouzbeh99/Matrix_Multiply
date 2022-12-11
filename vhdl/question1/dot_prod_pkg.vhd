library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;


ENTITY dot_prod_pkg is
        port(
                i_CLK       : in std_logic;
                i_RST       : in std_logic;
                i_A         : in array (0 to n) of std_logic_vector(15 DOWNTO 0);
                i_B         : in array (0 to n) of std_logic_vector(15 DOWNTO 0);
                o_C         : out std_logic_vector(15 DOWNTO 0)
            );

end ENTITY dot_prod_pkg;

architecture sequential of dot_prod_pkg is
    variable n : integer := 2;
    variable i : integer := 0;
    signal c   : array (0 to n) of std_logic_vector(15 DOWNTO 0);
    
begin
        c(0) <= (others => '0');
        for i in 1 to i_A'length loop
            c(i) := c(i-1) + (i_A(i-1)*i_B(i-1));
        end loop;

        o_C <= c(c'length-1);

end sequential;