library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity fir is
    port ( 
        clk : in std_logic;
        data_in : in std_logic_vector(7 downto 0);
        data_out : out std_logic_vector(15 downto 0)
    );
end fir;

architecture Behavioral of fir is
    
    constant h0 : std_logic_vector := x"F1";
    constant h1 : std_logic_vector := x"F3";
    constant h2 : std_logic_vector := x"07";
    constant h3 : std_logic_vector := x"26";
    constant h4 : std_logic_vector := x"42";
    constant h5 : std_logic_vector := x"4E";
    constant h6 : std_logic_vector := x"42";
    constant h7 : std_logic_vector := x"26";
    constant h8 : std_logic_vector := x"07";
    constant h9 : std_logic_vector := x"F3";
    constant h10 : std_logic_vector := x"F1";

    signal p1 , p2 , p3 , p4 , p5 , p6 , p7 , p8 , p9 , p10 : std_logic_vector(7 downto 0) := (others => '0');
begin
    
    process(clk)
    begin
        if(rising_edge(clk)) then
            p1 <= data_in;
            p2 <= p1;
            p3 <= p2;
            p4 <= p3;
            p5 <= p4;
            p6 <= p5;
            p7 <= p6;
            p8 <= p7;
            p9 <= p8;
            p10 <= p9;
        end if;
    end process;
    
    data_out <= std_logic_vector(unsigned(data_in) * unsigned(h0) + unsigned(p1) * unsigned(h1) + unsigned(p2) * unsigned(h2) + unsigned(p3) * unsigned(h3) + unsigned(p4) * unsigned(h4) + unsigned(p5) * unsigned(h5) + 
    unsigned(p6) * unsigned(h6) + unsigned(p7) * unsigned(h7) + unsigned(p8) * unsigned(h8) + unsigned(p9) * unsigned(h9) + unsigned(p10) * unsigned(h10));
    
end Behavioral;
