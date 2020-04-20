with Interfaces.C;
with termbox_h; use termbox_h;

package Termbox is
   subtype Termbox_Constant is Integer;
   subtype Return_Value is Integer; 
   
   type Event is record
      c_type : aliased Integer;
      c_mod : aliased Integer;
      key : aliased Integer;
      ch : aliased Integer;
      w : aliased Integer;
      h : aliased Integer;
      x : aliased Integer;
      y : aliased Integer;
   end record;
   
   BLACK : Termbox_Constant := Integer(TB_BLACK);
   RED : Termbox_Constant := Integer(TB_RED);
   GREEN : Termbox_Constant := Integer(TB_GREEN);
   YELLOW : Termbox_Constant := Integer(TB_YELLOW);
   BLUE : Termbox_Constant := Integer(TB_BLUE);
   MAGENTA : Termbox_Constant := Integer(TB_MAGENTA);
   CYAN : Termbox_Constant := Integer(TB_CYAN);
   WHITE : Termbox_Constant := Integer(TB_WHITE);
   
   KEY_ESC:  Termbox_Constant := Integer(TB_KEY_ESC);
   
   
   function Init return Return_Value;
   procedure Clear;
   procedure Change_Cell(x: Integer; y: Integer; ch: Character; fg: Integer; bg: Integer);
   --procedure Change_Cell(x: Interfaces.C.int; y: Interfaces.C.int; ch : Interfaces.c.unsigned; fg:  Interfaces.C.unsigned_short; bg :  Interfaces.C.unsigned_short);
   function Peek_Event(Evt: access Event; timeout: Interfaces.C.int) return Return_Value;
   procedure Present;
   procedure Shutdown;
   
end Termbox;
