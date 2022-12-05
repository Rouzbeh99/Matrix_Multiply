library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;


-- declaration of package

ENTITY dot_prod_pkg is

    constant n : integer := 2;

    type vec_type is array (0 to n) of std_logic_vector(15 DOWNTO 0);

    component dot_prod_top is
        port(
                i_CLK       : in std_logic;
                i_RST       : in std_logic;
                i_A         : in vec_type;
                i_B         : in vec_type;
                o_C         : out std_logic_vector(15 DOWNTO 0)
            );
    end component;
end ENTITY dot_prod_pkg;

architecture behave of dot_prod_pkg is

    variable c_inner : vec_type;
    variable i : integer := 0;
    begin
        for i in 0 to a'length-1 loop
            c(i+1) := c(i) + (a(i)*b(i));   -------------------------
        end loop;
    end

end behave;