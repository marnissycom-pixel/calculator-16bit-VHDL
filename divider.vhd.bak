library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity divider is
    port (
        A         : in  STD_LOGIC_VECTOR(15 downto 0);
        B         : in  STD_LOGIC_VECTOR(15 downto 0);
        QUOTIENT  : out STD_LOGIC_VECTOR(15 downto 0);
        REMAINDER : out STD_LOGIC_VECTOR(15 downto 0);
        DIV_ZERO  : out STD_LOGIC
    );
end divider;

architecture behavioral of divider is
begin
    process(A, B)
    begin
        if UNSIGNED(B) = 0 then
            DIV_ZERO  <= '1';
            QUOTIENT  <= (others => '0');
            REMAINDER <= (others => '0');
        else
            DIV_ZERO  <= '0';
            QUOTIENT  <= STD_LOGIC_VECTOR(UNSIGNED(A) / UNSIGNED(B));
            REMAINDER <= STD_LOGIC_VECTOR(UNSIGNED(A) mod UNSIGNED(B));
        end if;
    end process;
end behavioral;
