
package body Termbox is
   
   function Init return Return_Value is
      termbox_rv: Interfaces.C.int;
   begin
      termbox_rv := tb_init;
      return Return_Value(termbox_rv);
   end Init;
   
   procedure Clear is
   begin
      tb_clear;
   end Clear;
   
   procedure Change_Cell(x: Integer; y: Integer; ch: Character; fg: Integer; bg: Integer) is
      x2: Interfaces.C.int := Interfaces.C.int(x);
      y2: Interfaces.C.int := Interfaces.C.int(y);
      ch2: Interfaces.C.unsigned := Interfaces.C.unsigned(Character'Pos(ch));
      fg2: Interfaces.C.unsigned_short := Interfaces.C.unsigned_short(fg);
      bg2: Interfaces.C.unsigned_short := Interfaces.C.unsigned_short(bg);
   begin
      tb_change_cell(x2, y2, ch2, fg2, bg2);
   end Change_Cell;

   function Peek_Event(Evt: access Event; timeout: Interfaces.C.int) return Return_Value is
      termbox_event : access tb_event := new tb_event;
      termbox_rv : Interfaces.C.int;
   begin
      termbox_rv := tb_peek_event(termbox_event, timeout);
      Evt.c_type := Integer(termbox_event.c_type);
      Evt.c_mod := Integer(termbox_event.c_mod);
      Evt.key := Integer(termbox_event.key);
      Evt.ch := Integer(termbox_event.ch);
      Evt.w := Integer(termbox_event.w);
      Evt.h := Integer(termbox_event.h);
      Evt.x := Integer(termbox_event.x);
      Evt.y := Integer(termbox_event.y);
      return Return_Value(termbox_rv);
   end Peek_Event;
   
   procedure Present is
   begin
      tb_present;
   end Present;
   
   procedure Shutdown is
   begin
      tb_shutdown;
   end Shutdown;
     
end Termbox;
