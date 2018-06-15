library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;

entity Sobel_tb is
end;

architecture bench of Sobel_tb is

  type picture is array (0 to 139,0 to 139) of std_logic_vector(7 downto 0) ;
  signal pic : picture;

  component Sobel
      port (
          clk : in std_logic;
          rst : in std_logic;
          pixel_in : in std_logic_vector(7 downto 0);
          valid_in : in std_logic;
          pixel_out : out std_logic_vector(7 downto 0);
          valid_out : out std_logic
      );
  end component;

  signal clk: std_logic := '0';
  signal rst: std_logic := '0';
  signal pixel_in: std_logic_vector(7 downto 0);
  signal valid_in: std_logic;
  signal pixel_out: std_logic_vector(7 downto 0);
  signal valid_out: std_logic ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;
  
  file in_file : text is in "input_image.txt";	
  file out_file : text is out "output_image.txt";

begin

  uut: Sobel port map ( clk       => clk,
                        rst       => rst,
                        pixel_in  => pixel_in,
                        valid_in  => valid_in,
                        pixel_out => pixel_out,
                        valid_out => valid_out );

  process
  
    variable in_line     : line;
    variable out_line     : line;
    
    --variable pic_width : integer;
    --variable pic_height : integer;
    variable pixel : integer;
    
  begin
    
    
    --load image
    for I in 0 to 139 loop
        for J in 0 to 139 loop
            readline(in_file, in_line);
            read(in_line, pixel);
            pic(I,J) <= std_logic_vector(to_unsigned(pixel,8));
        end loop;
    end loop;
    file_close(in_file);
    
    --feed image to sobel core
    for I in 1 to 138 loop
        for J in 1 to 138 loop
            valid_in <= '1';
            for II in -1 to 1 loop
                for JJ in -1 to 1 loop
                    pixel_in <= pic(I+II,J+JJ);
                    --advance clock
                    clk <= not clk;
                    wait for 10ns;
                    clk <= not clk;
                    wait for 10ns;
                end loop;
            end loop;
            
            write(out_line,to_integer(unsigned(pixel_out)));
            writeline(out_file,out_line);
            
        end loop;
    end loop;
    --write(v_OLINE, w_SUM, right, c_WIDTH);
    --writeline(file_RESULTS, v_OLINE);
     
    wait;
  end process;

end;