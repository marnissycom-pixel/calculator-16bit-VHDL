library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu is
    port (
        A        : in  STD_LOGIC_VECTOR(15 downto 0);
        B        : in  STD_LOGIC_VECTOR(15 downto 0);
        OP       : in  STD_LOGIC_VECTOR(2 downto 0);
        RESULT   : out STD_LOGIC_VECTOR(31 downto 0);
        CARRY    : out STD_LOGIC;
        ZERO     : out STD_LOGIC;
        DIV_ZERO : out STD_LOGIC
    );
end alu;

architecture structural of alu is

    component adder
        port (A, B : in STD_LOGIC_VECTOR(15 downto 0);
              RESULT : out STD_LOGIC_VECTOR(15 downto 0);
              CARRY : out STD_LOGIC);
    end component;

    component subtractor
        port (A, B : in STD_LOGIC_VECTOR(15 downto 0);
              RESULT : out STD_LOGIC_VECTOR(15 downto 0);
              BORROW : out STD_LOGIC);
    end component;

    component multiplier
        port (A, B : in STD_LOGIC_VECTOR(15 downto 0);
              RESULT : out STD_LOGIC_VECTOR(31 downto 0));
    end component;

    component divider
        port (A, B : in STD_LOGIC_VECTOR(15 downto 0);
              QUOTIENT, REMAINDER : out STD_LOGIC_VECTOR(15 downto 0);
              DIV_ZERO : out STD_LOGIC);
    end component;

    signal add_result  : STD_LOGIC_VECTOR(15 downto 0);
    signal sub_result  : STD_LOGIC_VECTOR(15 downto 0);
    signal mul_result  : STD_LOGIC_VECTOR(31 downto 0);
    signal div_quot    : STD_LOGIC_VECTOR(15 downto 0);
    signal div_rem     : STD_LOGIC_VECTOR(15 downto 0);
    signal add_carry   : STD_LOGIC;
    signal sub_borrow  : STD_LOGIC;
    signal div_zero_s  : STD_LOGIC;
    signal result_s    : STD_LOGIC_VECTOR(31 downto 0);

begin
    U_ADD : adder      port map(A, B, add_result, add_carry);
    U_SUB : subtractor port map(A, B, sub_result, sub_borrow);
    U_MUL : multiplier port map(A, B, mul_result);
    U_DIV : divider    port map(A, B, div_quot, div_rem, div_zero_s);

    process(OP, A, B, add_result, sub_result, mul_result, div_quot)
    begin
        CARRY    <= '0';
        DIV_ZERO <= '0';
        case OP is
            when "000" =>
                result_s <= x"0000" & add_result;
                CARRY    <= add_carry;
            when "001" =>
                result_s <= x"0000" & sub_result;
                CARRY    <= sub_borrow;
            when "010" =>
                result_s <= mul_result;
            when "011" =>
                result_s <= x"0000" & div_quot;
                DIV_ZERO <= div_zero_s;
            when "100" =>
                result_s <= x"0000" & (A and B);
            when "101" =>
                result_s <= x"0000" & (A or B);
            when "110" =>
                result_s <= x"0000" & (not A);
            when "111" =>
                result_s <= x"0000" & (A xor B);
            when others =>
                result_s <= (others => '0');
        end case;
    end process;

    RESULT <= result_s;
    ZERO   <= '1' when result_s = x"00000000" else '0';

end structural;
