with Ada.Strings.UnBounded;
with Ada.Text_IO; use Ada.Text_IO;

with MPV;
with Termbox;

with GFX;

with Level; use Level; --use is for exit_values equality checks only
with Timer;
with Util;

procedure Main is
   
   trv : Termbox.Return_Value;
   evt: access Termbox.Event := new Termbox.Event;
   Current_Time: Duration := 0.0;
   Old_Time: Duration := 0.0;
   Periodic_Time: Duration := 0.0;
   Process_Key: Integer;
   
   Update_Result: Level.Exit_Values;
    
   --rv : MPV.Return_Value;
   --ctx : MPV.Context_Addr;
   --args : MPV.Command_Args_List(1..2) := (
--					  Ada.Strings.Unbounded.To_Unbounded_String ("loadfile"),
--					  Ada.Strings.Unbounded.To_Unbounded_String ("BeepBox-Song.wav")
--					 );
   Current_Level : Level.Level_Type(10, 20, 20); 
   Str  : String (1 .. 80);
   Last : Natural;

begin
   
   Put_Line("BIGFOOT, PROTECTOR OF THE FOREST");
   Put_Line("Goal: Return sticks to honor the stump before people get there.");
   Put_Line("Controls:");
   Put_Line("A/D = left/right");
   Put_Line("W = Whoop or knock (scares people)");
   Put_Line("S = Pick up item, harvest sticks from trees");
   Put_Line("Q = Build/Upgrade a tree structure");
   Put_Line("E = Throw Rock");
   Put_Line("G = Scream (special move)");
   Put_Line("Press enter to start...");
   Get_Line(Str, Last);
   
   --Put_Line("Trees (1-100): ");
   --Get_Line (Str, Last);
   --numtrees := Integer'Value(Str(1 .. Last));
   
   --Put_Line("Enemies (1-100): ");
   --Get_Line (Str, Last);
   --numenemies := Integer'Value(Str(1 .. Last));
   
   --Put_Line("Max Items (1-100): ");
   --Get_Line (Str, Last);
   --numitems := Integer'Value(Str(1 .. Last));
   
   --Put_Line("Goal (1-100): ");
   --Get_Line (Str, Last);
   --numgoal := Integer'Value(Str(1 .. Last));
   
   --return;
   
   trv := Termbox.Init;
   if trv /= 0 then
      Put_Line("Termbox Init failed with error code: " & Integer'Image(trv));
      return;
   end if;
   
   
   Current_Level := Level.Create_Level(2000, 10, 20, 20);
   
   loop
      trv := Termbox.Peek_Event(evt, 0);
      exit when evt.key = Termbox.KEY_ESC;
      
      if evt.ch /= 0 then
	 Process_Key := evt.ch; --store last key hit
      end if;
	 
      Current_Time := Timer.Time_Since_Epoch;
      
      
      if Current_Time - Old_Time > Duration(1.0/30.0) then --slow time for faster sytems
	 --update stuff
      
	 Update_Result := Level.Update_Level(Current_Level, Process_Key);
	 if Current_Time - Periodic_Time > 1.0 then --2 second lockstep
	    Update_Result := Level.Update_Level_Periodic(Current_Level);
	    if Update_Result = Level.Level_Success or Update_Result = Level.Level_Failure then
	       exit;
	    end if;
	   Periodic_Time := Current_Time;
	 end if;
	   
	 Process_Key := 0;
	 Old_Time := Current_Time;
     end if;
      
      --draw stuff
      Termbox.Clear;
      Level.Draw_Level(Current_Level);
      
      Gfx.Draw_String(0,0,Integer'Image(Current_Level.Cam_X), Termbox.WHITE, Termbox.BLACK);
      
      Termbox.Present;
      
   end loop;
   
   Termbox.Shutdown;
   
   if Update_Result = Level.Level_Success then
      Put_Line("You won!");
   else
      Put_Line("You lost!");
   end if;
   --ctx := MPV.Create;
   --rv := MPV.Initialize(ctx);
   --if rv < 0 then
   --   Put_Line("init " & MPV.Error_String(rv));
   --   return;
   --end if;

   --rv := MPV.Command(ctx, args);
   --if rv < 0 then
   --   Put_Line("load " & MPV.error_string(rv));
   --   return;
   --end if;

    --MPV.Terminate_Destroy(ctx);
end Main;
