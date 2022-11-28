library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

library ieee_proposed;
use ieee_proposed.float_pkg.all;

-- declaration of package

package dot_prod_pkg is

    constant n : integer := 2;

    type vec_type is array (0 to n) of float32;

    function dot_prod (a : vec_type; b : vec_type) return float32;

    component dot_prod_top is
        port(
                i_CLK       : in std_logic;
                i_RST       : in std_logic;
                i_A         : in vec_type;
                i_B         : in vec_type;
                o_C         : out float32
            );
    end component;
end package dot_prod_pkg;


-- implementation of the logic

package body dot_prod_pkg is

    function dot_prod (a : vec_type; b : vec_type) return float32 is
        variable res : float32 := (others =>'0');
        variable i : integer := 0;

        begin
            for i in 0 to a'length-1 loop
                res := res + (a(i)*b(i));
            end loop;
        return res;
    end dot_prod;
end dot_prod_pkg;
