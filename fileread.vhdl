library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use STD.textio.all;

entity fileread is
end fileread;

architecture behave of fileread is
	file file_VECTORS : text;

  -- ARRAYS
  type INST_IN_STRINGS is array (15 downto 1) of line;
  type INST_IN_BITS is array (15 downto 1) of integer;

  begin
	process
    -- VARIABLES
    variable v_ILINE     : line;
    variable v_INST      : string(1 to 4);
    variable v_OP1       : string(1 to 2);
    variable v_OP2       : string(1 to 2);
    variable v_OP3       : string(1 to 2);
    variable v_COMMA		 : character;
    variable v_SPACE     : character;
    variable param       : integer;
    variable iterator    : integer          := 1;
    variable is_Counter  : integer          := 0;
    variable inst_in_strings  : INST_IN_STRINGS;
    variable inst_in_bits     : INST_IN_BITS;

    -- INSTRUCTIONS
      constant LOAD_INST  : integer := 000;
      constant ADD_INST   : integer := 001;
      constant SUB_INST   : integer := 010;
      constant MUL_INST   : integer := 011;
      constant DIV_INST   : integer := 100;
      constant MOD_INST   : integer := 101;

    -- IMMEDIATE VALUES
      constant IMM_ZERO   : integer := 00000000;
      constant IMM_ONE    : integer := 00000001;
      constant IMM_TWO    : integer := 00000010;
      constant IMM_THREE  : integer := 00000011;

   -- REGISTERS
     constant REG_R0   : integer := 00000100;
     constant REG_R1   : integer := 00001000;
     constant REG_R2   : integer := 00001100;
     constant REG_R3   : integer := 00010000;
     constant REG_R4   : integer := 00010100;
     constant REG_R5   : integer := 00011000;
     constant REG_R6   : integer := 00011100;
     constant REG_R7   : integer := 00100000;
     constant REG_R8   : integer := 00100100;
     constant REG_R9   : integer := 00101000;
     constant REG_R10  : integer := 00101100;
     constant REG_R11  : integer := 00110000;
     constant REG_R12  : integer := 00110100;
     constant REG_R13  : integer := 00111000;
     constant REG_R14  : integer := 00111100;
     constant REG_R15  : integer := 01000000;
     constant REG_R16  : integer := 01000100;
     constant REG_R17  : integer := 01001000;
     constant REG_R18  : integer := 01001100;
     constant REG_R19  : integer := 01010000;
     constant REG_R20  : integer := 01010100;
     constant REG_R21  : integer := 01011000;
     constant REG_R22  : integer := 01011100;
     constant REG_R23  : integer := 01110000;
     constant REG_R24  : integer := 01110100;
     constant REG_R25  : integer := 01111000;
     constant REG_R26  : integer := 01111100;
     constant REG_R27  : integer := 10000000;
     constant REG_R28  : integer := 10000100;
     constant REG_R29  : integer := 10001000;
     constant REG_R30  : integer := 10001100;
     constant REG_R31  : integer := 10010000;

	begin
		file_open(file_VECTORS, "input.txt",  read_mode);

    --while loop(saving each instruction to array "inst_in_strings" *per line)
		 while not endfile(file_VECTORS) loop
      readline(file_VECTORS, v_ILINE);
      inst_in_strings(iterator) := v_ILINE;
      iterator := iterator + 1;
      is_Counter := is_Counter + 1;
    end loop;

    report integer'image(iterator);
    report integer'image(is_Counter);

    --for loop(test print if values have been stored in "inst_in_strings" array)
    for param in 1 to is_Counter loop
      read(inst_in_strings(param), v_INST);
      read(inst_in_strings(param), v_SPACE);           -- read in the space character
      if v_INST = "LOAD" then
      	read(inst_in_strings(param), v_OP1);	--  operand 1
      	read(inst_in_strings(param), v_COMMA);
      	read(inst_in_strings(param), v_SPACE);
      	read(inst_in_strings(param), v_OP2);	--	operand 2
        report v_INST & " " & v_OP1 & ", " & v_OP2;
      else
      	read(inst_in_strings(param), v_OP1);	--  operand 1
      	read(inst_in_strings(param), v_COMMA);
      	read(inst_in_strings(param), v_SPACE);
      	read(inst_in_strings(param), v_OP2);	--	operand 2
      	read(inst_in_strings(param), v_COMMA);
      	read(inst_in_strings(param), v_SPACE);
      	read(inst_in_strings(param), v_OP3);	--	operand 3
      report v_INST & " " & v_OP1 & ", " & v_OP2& ", " & v_OP3;
      end if;
    end loop;


  file_close(file_VECTORS);
	wait;
  end process;
end behave;
