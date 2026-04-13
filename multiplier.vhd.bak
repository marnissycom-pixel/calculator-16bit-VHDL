library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity multiplier is
    port (
        A      : in  STD_LOGIC_VECTOR(15 downto 0);
        B      : in  STD_LOGIC_VECTOR(15 downto 0);
        RESULT : out STD_LOGIC_VECTOR(31 downto 0)
    );
end multiplier;

architecture behavioral of multiplier is
begin
    RESULT <= STD_LOGIC_VECTOR(UNSIGNED(A) * UNSIGNED(B));
end behavioral;
