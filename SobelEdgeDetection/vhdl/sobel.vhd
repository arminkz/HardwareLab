library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sobel is
    port (
        clk : in std_logic;
        rst : in std_logic;
        pixel_in : in std_logic_vector(7 downto 0);
        valid_in : in std_logic;
        pixel_out : out std_logic_vector(7 downto 0);
        valid_out : out std_logic
    );
end Sobel;

architecture Behavioral of Sobel is

    component SobelCore
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
    end component;

    signal r11 , r12 , r13 , r21 , r22 ,r23 , r31 , r32 , r33 : std_logic_vector(7 downto 0); 
    signal state : integer range 1 to 9 := 1;
    
begin

    SC : SobelCore port map(r11,r12,r13,r21,r22,r23,r31,r32,r33,pixel_out);
    
    process(clk,rst)
    begin
        if(rst = '1') then
            --Must RESET
        elsif(rising_edge(clk) and valid_in = '1') then
            case state is
                when 1 =>
                    r11 <= pixel_in;
                    state <= 2;
                    valid_out <= '0';       
                when 2 =>
                    r12 <= pixel_in;
                    state <= 3;
                    valid_out <= '0';    
                when 3 =>
                    r13 <= pixel_in;
                    state <= 4;
                    valid_out <= '0';    
                when 4 =>
                    r21 <= pixel_in;
                    state <= 5;   
                    valid_out <= '0'; 
                when 5 =>
                    r22 <= pixel_in;
                    state <= 6;   
                    valid_out <= '0'; 
                when 6 =>
                    r23 <= pixel_in;
                    state <= 7;   
                    valid_out <= '0'; 
                when 7 =>
                    r31 <= pixel_in;
                    state <= 8;   
                    valid_out <= '0'; 
                when 8 =>
                    r32 <= pixel_in;
                    state <= 9;   
                    valid_out <= '0'; 
                when 9 =>
                    r33 <= pixel_in;
                    state <= 1;   
                    valid_out <= '1';
            end case;
        end if;
    end process;
    
end Behavioral;