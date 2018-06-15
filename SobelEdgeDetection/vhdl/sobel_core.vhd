library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SobelCore is
    port (
        p11 : in std_logic_vector(7 downto 0);
        p12 : in std_logic_vector(7 downto 0);
        p13 : in std_logic_vector(7 downto 0);
        p21 : in std_logic_vector(7 downto 0);
        p22 : in std_logic_vector(7 downto 0);
        p23 : in std_logic_vector(7 downto 0);
        p31 : in std_logic_vector(7 downto 0);
        p32 : in std_logic_vector(7 downto 0);
        p33 : in std_logic_vector(7 downto 0);
        pout : out std_logic_vector(7 downto 0)
    );
end SobelCore;

architecture Behavioral of SobelCore is

    signal i1 : integer;
    signal i2 : integer;
    signal i3 : integer;
    
    signal j1 : integer;
    signal j2 : integer;
    signal j3 : integer;
    
    signal gx : integer;
    signal gy : integer;
    signal gt,gt2 : integer;
    
begin

    i1 <= to_integer(unsigned(p11)) - to_integer(unsigned(p13));
    i2 <= (to_integer(unsigned(p21)) - to_integer(unsigned(p23))) * 2;
    i3 <= to_integer(unsigned(p31)) - to_integer(unsigned(p33));
    
    j1 <= to_integer(unsigned(p11)) - to_integer(unsigned(p31));
    j2 <= (to_integer(unsigned(p12)) - to_integer(unsigned(p32))) * 2;
    j3 <= to_integer(unsigned(p13)) - to_integer(unsigned(p33));

    gx <= abs(i1 + i2 + i3);
    gy <= abs(j1 + j2 + j3);
    
    gt <= gx + gy;
    gt2 <= gt when (gt < 256) else 255;
    
    pout <= std_logic_vector(to_unsigned(gt2, 8));
end Behavioral;