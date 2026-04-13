library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity subtractor is
    port (
        A      : in  STD_LOGIC_VECTOR(15 downto 0);
        B      : in  STD_LOGIC_VECTOR(15 downto 0);
        RESULT : out STD_LOGIC_VECTOR(15 downto 0);
        BORROW : out STD_LOGIC
    );
end subtractor;

architecture behavioral of subtractor is
    signal temp : UNSIGNED(16 downto 0);
begin
    temp   <= ('0' & UNSIGNED(A)) - ('0' & UNSIGNED(B));
    RESULT <= STD_LOGIC_VECTOR(temp(15 downto 0));
    BORROW <= temp(16);
end behavioral;
