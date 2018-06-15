library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;
use STD.textio.all;

entity fir_tb is
end;

architecture bench of fir_tb is

  component fir
      port ( 
          clk : in std_logic;
          data_in : in std_logic_vector(7 downto 0);
          data_out : out std_logic_vector(15 downto 0)
      );
  end component;

  signal clk: std_logic;
  signal data_in: std_logic_vector(7 downto 0);
  signal data_out: std_logic_vector(15 downto 0) ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;
  
  file in_file : text is in "fir.txt";
  

begin

  uut: fir port map ( clk      => clk,
                      data_in  => data_in,
                      data_out => data_out );

  stimulus: process
  
    variable in_line     : line;
    variable in_dash     : character;
    variable in_int      : integer;
    
  begin
  
    
    while not endfile(in_file) loop
        readline(in_file, in_line);
        
        while in_line'length /= 0 loop
            read(in_line, in_dash);
            read(in_line, in_int);
            
            data_in <= std_logic_vector(to_unsigned(in_int,8));
            
            --Advance clock
            clk <= not clk;
            wait for 60ns;
            clk <= not clk;
            wait for 60ns;
        end loop;
        
    end loop;

    wait;
  end process;

end;