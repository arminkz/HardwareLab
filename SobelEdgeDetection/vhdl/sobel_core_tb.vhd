library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity SobelCore_tb is
end;

architecture bench of SobelCore_tb is

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

  signal p11: std_logic_vector(7 downto 0);
  signal p12: std_logic_vector(7 downto 0);
  signal p13: std_logic_vector(7 downto 0);
  signal p21: std_logic_vector(7 downto 0);
  signal p22: std_logic_vector(7 downto 0);
  signal p23: std_logic_vector(7 downto 0);
  signal p31: std_logic_vector(7 downto 0);
  signal p32: std_logic_vector(7 downto 0);
  signal p33: std_logic_vector(7 downto 0);
  signal pout: std_logic_vector(7 downto 0) ;

begin

  uut: SobelCore port map ( p11  => p11,
                            p12  => p12,
                            p13  => p13,
                            p21  => p21,
                            p22  => p22,
                            p23  => p23,
                            p31  => p31,
                            p32  => p32,
                            p33  => p33,
                            pout => pout );

  stimulus: process
  begin
  
    -- Put initialisation code here
    p11 <= x"AA";
    p12 <= x"A9";
    p13 <= x"A7";
    p21 <= x"AA";
    p22 <= x"A9";
    p23 <= x"A7";
    p31 <= x"AA";
    p32 <= x"AA";
    p33 <= x"AA";


    -- Put test bench stimulus code here

    wait;
  end process;


end;