library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shiftregister8bits is
    port(
        p: in std_logic_vector(7 downto 0);
        m: in std_logic_vector(1 downto 0);
        sdr,sdl,clr,clk: in std_logic;
        q: inout std_logic_vector(7 downto 0)
    );
end shiftregister8bits;

architecture behave of shiftregister8bits is
    component shift_register is
        port (
        clr, clk, sdr, sdl : in std_logic;
        mode : in std_logic_vector(1 downto 0);
        parallel : in std_logic_vector(3 downto 0);
        q : out std_logic_vector(3 downto 0)
    );
    end component;
begin
    S0: shift_register port map(clr, clk, q(4), sdl, m, p(3 downto 0), q(3 downto 0));
    S1: shift_register port map(clr, clk, sdr, q(3), m, p(7 downto 4), q(7 downto 4));
end behave;