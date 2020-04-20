package body HikerEnemy is
						 
   procedure Draw_Enemy(Ene: HikerEnemy_Type; lvl: BaseEnemy.Level_Access) is
   begin
      Gfx.Draw_String(bfpos - lvl.Cam_X, lvl.Height - 5, "HHHHH", Termbox.YELLOW, Termbox.BLACK); 
      Gfx.Draw_String(bfpos - lvl.Cam_X, lvl.Height - 4, "HHHHH", Termbox.YELLOW, Termbox.BLACK); 
      Gfx.Draw_String(bfpos - lvl.Cam_X, lvl.Height - 3, "HHHHH", Termbox.YELLOW, Termbox.BLACK); 
      Gfx.Draw_String(bfpos - lvl.Cam_X, lvl.Height - 2, "HHHHH", Termbox.YELLOW, Termbox.BLACK); 
      Gfx.Draw_String(bfpos - lvl.Cam_X, lvl.Height - 1, "HHHHH", Termbox.YELLOW, Termbox.BLACK);
      
   end Draw_Enemy;
   
   
end HikerEnemy;
