--code 
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use STD.textio.all; 

ENTITY readfile IS
port(rst,clk:in std_logic;
EOR:out std_logic;
y:out std_logic );
END readfile;

ARCHITECTURE behav OF readfile IS 
begin
  process (rst, clk) 
            file file_pointer:         text;
            variable line_content:  character;
            variable line_num:      line;
            -- variable j:             integer := 0;
            variable char:          character := '0'; 
            variable cnt:           integer range 0 to 80 := 0; -- defaults to 0
        begin
            if rst = '1' then
                eor <= '0';
                -- file_open (file_pointer, "c:\input.txt", read_mode);
            elsif rising_edge(clk) then 
                if cnt < 80 then
                    if cnt = 0 then  -- open file once
                        file_open (file_pointer, "input.txt", READ_MODE);
                        eor <= '1';   
                    end if;
                    readline (file_pointer, line_num); 
                    read (line_num, line_content);  
                    -- eor <= '1';
                    char := line_content;
                    if char = '0' then
                        y <= '0';
                    else
                        y <= '1';
                    end if; 
                    cnt := cnt + 1;
                end if;
                if cnt = 80 then     -- variable updated immediately
                    file_close (file_pointer);   -- close only once
                    eor <= '0';      -- signal end of input
                end if;  
            end if;
        end process;
end behav; 