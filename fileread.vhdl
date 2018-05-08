library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use STD.textio.all;
 
entity fileread is
end fileread;

architecture behave of fileread is
	file file_VECTORS : text;
	begin
	process
    variable v_ILINE     : line;
    variable v_INST : string(1 to 4);
    variable v_OP1  : string(1 to 2);
    variable v_OP2  : string(1 to 2);
    variable v_OP3  : string(1 to 2);
    variable v_COMMA		 : character;
    variable v_SPACE     : character;
   
	begin
		file_open(file_VECTORS, "input.txt",  read_mode);
		 while not endfile(file_VECTORS) loop
      readline(file_VECTORS, v_ILINE);
      read(v_ILINE, v_INST);
      read(v_ILINE, v_SPACE);           -- read in the space character

      if v_INST = "LOAD" then
      	read(v_ILINE, v_OP1);	--  operand 1
      	read(v_ILINE, v_COMMA);
      	read(v_ILINE, v_SPACE);
      	read(v_ILINE, v_OP2);	--	operand 2
        report v_INST & " " & v_OP1 & ", " & v_OP2;
      else
      	read(v_ILINE, v_OP1);	--  operand 1
      	read(v_ILINE, v_COMMA);
      	read(v_ILINE, v_SPACE);
      	read(v_ILINE, v_OP2);	--	operand 2
      	read(v_ILINE, v_COMMA);
      	read(v_ILINE, v_SPACE);
      	read(v_ILINE, v_OP3);	--	operand 3
     	report v_INST & " " & v_OP1 & ", " & v_OP2& ", " & v_OP3;
      end if;
      
 
     -- wait for 60 ns;
 
    end loop;
  file_close(file_VECTORS);
	wait;
  end process;
end behave;
