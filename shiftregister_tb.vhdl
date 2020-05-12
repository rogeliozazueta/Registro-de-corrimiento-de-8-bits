library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity shiftregister8bits_tb is
end;

architecture tb of shiftregister8bits_tb is

  component shiftregister8bits
     port(
        p: in std_logic_vector(7 downto 0);
        m: in std_logic_vector(1 downto 0);
        sdr,sdl,clr,clk: in std_logic;
        q: inout std_logic_vector(7 downto 0)
    );
  end component;

  signal p: std_logic_vector(7 downto 0);
  signal m: std_logic_vector(1 downto 0);
  signal sdr,sdl,clr,clk:  std_logic;
  signal q: std_logic_vector(7 downto 0);
  
  constant period : time := 10 ns;

begin

  uut: shiftregister8bits port map (   p    => p,
                                       m    => m,
                                       sdr  => sdr,
                                       sdl  => sdl,
                                       clr => clr,
                                       clk  => clk,
                                       q    => q );

  clk_process : process
  begin
    clk <= '0';
    wait for period/2;
    clk <= '1';
    wait for period/2;
  end process;           
 
  clr <= '0', '1' after period*4, '0' after period*20;
  m<= "00", "11" after period*5, "10" after period*6, "01" after period*12, "00" after period*16;
  p <= "10101010";
  sdr <= '0';
  sdl <= '1';
end tb;