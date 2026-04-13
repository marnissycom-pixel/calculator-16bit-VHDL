library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity testbench is
end testbench;

architecture behavioral of testbench is

    component alu
        port (
            A, B     : in  STD_LOGIC_VECTOR(15 downto 0);
            OP       : in  STD_LOGIC_VECTOR(2 downto 0);
            RESULT   : out STD_LOGIC_VECTOR(31 downto 0);
            CARRY    : out STD_LOGIC;
            ZERO     : out STD_LOGIC;
            DIV_ZERO : out STD_LOGIC
        );
    end component;

    signal A, B    : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal OP      : STD_LOGIC_VECTOR(2 downto 0)  := (others => '0');
    signal RESULT  : STD_LOGIC_VECTOR(31 downto 0);
    signal CARRY, ZERO, DIV_ZERO : STD_LOGIC;

begin
    UUT : alu port map(A, B, OP, RESULT, CARRY, ZERO, DIV_ZERO);

    process
    begin
        A <= STD_LOGIC_VECTOR(TO_UNSIGNED(100, 16));
        B <= STD_LOGIC_VECTOR(TO_UNSIGNED(200, 16));
        OP <= "000"; wait for 20 ns;

        A <= STD_LOGIC_VECTOR(TO_UNSIGNED(500, 16));
        B <= STD_LOGIC_VECTOR(TO_UNSIGNED(300, 16));
        OP <= "001"; wait for 20 ns;

        A <= STD_LOGIC_VECTOR(TO_UNSIGNED(10, 16));
        B <= STD_LOGIC_VECTOR(TO_UNSIGNED(20, 16));
        OP <= "010"; wait for 20 ns;

        A <= STD_LOGIC_VECTOR(TO_UNSIGNED(100, 16));
        B <= STD_LOGIC_VECTOR(TO_UNSIGNED(4, 16));
        OP <= "011"; wait for 20 ns;

        A <= STD_LOGIC_VECTOR(TO_UNSIGNED(100, 16));
        B <= (others => '0');
        OP <= "011"; wait for 20 ns;

        A <= x"FF00"; B <= x"0FF0";
        OP <= "100"; wait for 20 ns;

        A <= x"FF00"; B <= x"0FF0";
        OP <= "101"; wait for 20 ns;

        A <= x"FF00"; B <= x"0000";
        OP <= "110"; wait for 20 ns;

        A <= x"FF00"; B <= x"0FF0";
        OP <= "111"; wait for 20 ns;

        wait;
    end process;
end behavioral;
