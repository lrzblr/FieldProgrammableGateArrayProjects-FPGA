library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Floating_Point_Comparator is
    Port ( A : in  std_logic_vector(31 downto 0);
           B : in  std_logic_vector(31 downto 0);
           Result : out std_logic_vector(31 downto 0)
           );
end Floating_Point_Comparator;

architecture Behavioral of Floating_Point_Comparator is
begin
    compare_process: process(A, B)
        variable A_ex : unsigned(7 downto 0);
        variable B_ex : unsigned(7 downto 0);
        variable A_mantissa : unsigned(22 downto 0);
        variable B_mantissa : unsigned(22 downto 0);
        variable A_sign : std_logic;
        variable B_sign : std_logic;
    begin
        -- A'n�n i�areti, exponent ve mantissas�n� ay�rma
        A_sign := A(31);
        A_ex := unsigned(A(30 downto 23));
        A_mantissa := unsigned(A(22 downto 0));
        
        -- B'nin i�areti, exponent ve mantissas�n� ay�rma
        B_sign := B(31);
        B_ex := unsigned(B(30 downto 23));
        B_mantissa := unsigned(B(22 downto 0));
        
        if A_sign = B_sign then
            -- ��aretler ayn�, exponentleri kar��la�t�rma
            if A_ex = B_ex then
                -- Exponentler ayn�, mantissalar� kar��la�t�rma
                if A_mantissa > B_mantissa then
                    -- A'n�n mantissas� b�y�k
                    Result <= A;
                else
                    -- B'nin mantissas� b�y�k veya e�it
                    Result <= B;
                end if;
            elsif A_ex > B_ex then
                -- A'n�n exponenti b�y�k
                Result <= A;
            else
                -- B'nin exponenti b�y�k
                Result <= B;
            end if;
        elsif A_sign = '1' then
            -- A negatif, B pozitif
            Result <= B;
        else
            -- A pozitif, B negatif
            Result <= A;
        end if;
    end process compare_process;
end Behavioral;