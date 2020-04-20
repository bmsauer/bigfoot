package body Gfx is
   
   procedure Draw_String(x: Integer; y: Integer; str: String; fg: Integer; bg:Integer) is
      trimmed : String := Trim(str, Ada.Strings.Left); --this is for numbers, trimming leading space
   begin
      for i in 1..trimmed'Length loop
	 Termbox.Change_Cell(x + i - 1, y, trimmed(i), fg, bg);
      end loop;
   end Draw_String;
   
end Gfx;

