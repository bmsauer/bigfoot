package body Level is
   
   function Create_Enemy(Pos: Integer; Res: Integer) return BaseEnemy_Access is
      RV: BaseEnemy_Access := new BaseEnemy_Type;
   begin
      RV.Position := Pos;
      RV.Resolve := Res;
      return RV;
   end Create_Enemy;
     
   procedure Update_Enemy_Position(Ene: in out BaseEnemy_Type; Pos: Integer) is
   begin
      Ene.Position := Pos;
   end Update_Enemy_Position;
   
   procedure Update_Enemy_Resolve(Ene: in out BaseEnemy_Type; Res: Integer) is
   begin
      Ene.Resolve := Res;
   end Update_Enemy_Resolve;
   
   function Get_Enemy_Position(Ene: BaseEnemy_Type) return Integer is
   begin
      return Ene.Position;
   end Get_Enemy_Position;
     
   function Get_Enemy_Resolve(Ene: BaseEnemy_Type) return Integer is
   begin
      return Ene.Resolve;
   end Get_Enemy_Resolve;
						 
   procedure Draw_Enemy(Ene: BaseEnemy_Type; lvl: Level_Type) is
   begin
      return;
   end Draw_Enemy;
   
   function Create_Hiker(Pos: Integer; Res: Integer; Speed: Integer) return BaseEnemy_Type'Class is
      RV: HikerEnemy_Type;
   begin
      RV.Position := Pos;
      RV.Resolve := Res;
      RV.Speed := 1;
      return RV;
   end Create_Hiker;
   
   procedure Draw_Enemy(Ene: HikerEnemy_Type; lvl: Level_Type) is
   begin
      Gfx.Draw_String(Ene.Get_Enemy_Position - lvl.Cam_X, lvl.Height - 5, "HHHHH", Termbox.YELLOW, Termbox.BLACK); 
      Gfx.Draw_String(Ene.Get_Enemy_Position - lvl.Cam_X, lvl.Height - 4, "HHHHH", Termbox.YELLOW, Termbox.BLACK); 
      Gfx.Draw_String(Ene.Get_Enemy_Position - lvl.Cam_X, lvl.Height - 3, "HHHHH", Termbox.YELLOW, Termbox.BLACK); 
      Gfx.Draw_String(Ene.Get_Enemy_Position - lvl.Cam_X, lvl.Height - 2, "HHHHH", Termbox.YELLOW, Termbox.BLACK); 
      Gfx.Draw_String(Ene.Get_Enemy_Position - lvl.Cam_X, lvl.Height - 1, "HHHHH", Termbox.YELLOW, Termbox.BLACK);
      Gfx.Draw_String(Ene.Get_Enemy_Position - lvl.Cam_X + 1, lvl.Height - 3, Integer'Image(Ene.Get_Enemy_Resolve), Termbox.WHITE, Termbox.BLACK);
   end Draw_Enemy;
   
   function Create_Camper(Pos: Integer; Res: Integer; Sp: Integer; Cs: Integer) return BaseEnemy_Type'Class is
      RV: CamperEnemy_Type;
   begin
      RV.Position := Pos;
      RV.Resolve := Res;
      RV.Speed := Sp;
      RV.Campsite := Cs;
      return RV;
   end Create_Camper;
   
   procedure Draw_Enemy(Ene: CamperEnemy_Type; lvl: Level_Type) is
   begin
      Gfx.Draw_String(Ene.Get_Enemy_Position - lvl.Cam_X, lvl.Height - 5, "CCCCC", Termbox.YELLOW, Termbox.BLACK); 
      Gfx.Draw_String(Ene.Get_Enemy_Position - lvl.Cam_X, lvl.Height - 4, "CCCCC", Termbox.YELLOW, Termbox.BLACK); 
      Gfx.Draw_String(Ene.Get_Enemy_Position - lvl.Cam_X, lvl.Height - 3, "CCCCC", Termbox.YELLOW, Termbox.BLACK); 
      Gfx.Draw_String(Ene.Get_Enemy_Position - lvl.Cam_X, lvl.Height - 2, "CCCCC", Termbox.YELLOW, Termbox.BLACK); 
      Gfx.Draw_String(Ene.Get_Enemy_Position - lvl.Cam_X, lvl.Height - 1, "CCCCC", Termbox.YELLOW, Termbox.BLACK);
      Gfx.Draw_String(Ene.Get_Enemy_Position - lvl.Cam_X + 1, lvl.Height - 3, Integer'Image(Ene.Get_Enemy_Resolve), Termbox.WHITE, Termbox.BLACK);
   end Draw_Enemy;
   
   function Create_Researcher(Pos: Integer; Res: Integer; Sp: Integer) return BaseEnemy_Type'Class is
      RV: ResearcherEnemy_Type;
   begin
      RV.Position := Pos;
      RV.Resolve := Res;
      RV.Speed := 1;
      return RV;
   end Create_Researcher;
   
   procedure Draw_Enemy(Ene: ResearcherEnemy_Type; lvl: Level_Type) is
   begin
      Gfx.Draw_String(Ene.Get_Enemy_Position - lvl.Cam_X, lvl.Height - 5, "RRRRR", Termbox.YELLOW, Termbox.BLACK); 
      Gfx.Draw_String(Ene.Get_Enemy_Position - lvl.Cam_X, lvl.Height - 4, "RRRRR", Termbox.YELLOW, Termbox.BLACK); 
      Gfx.Draw_String(Ene.Get_Enemy_Position - lvl.Cam_X, lvl.Height - 3, "RRRRR", Termbox.YELLOW, Termbox.BLACK); 
      Gfx.Draw_String(Ene.Get_Enemy_Position - lvl.Cam_X, lvl.Height - 2, "RRRRR", Termbox.YELLOW, Termbox.BLACK); 
      Gfx.Draw_String(Ene.Get_Enemy_Position - lvl.Cam_X, lvl.Height - 1, "RRRRR", Termbox.YELLOW, Termbox.BLACK);
      Gfx.Draw_String(Ene.Get_Enemy_Position - lvl.Cam_X + 1, lvl.Height - 3, Integer'Image(Ene.Get_Enemy_Resolve), Termbox.WHITE, Termbox.BLACK);
   end Draw_Enemy;
   
   function Create_Logger(Pos: Integer; Res: Integer; Sp: Integer; Fc: Integer) return BaseEnemy_Type'Class is
      RV: LoggerEnemy_Type;
   begin
      RV.Position := Pos;
      RV.Resolve := Res;
      RV.Speed := Sp;
      RV.Felling_Chance := Fc;
      return RV;
   end Create_Logger;
   
   procedure Draw_Enemy(Ene: LoggerEnemy_Type; lvl: Level_Type) is
   begin
      Gfx.Draw_String(Ene.Get_Enemy_Position - lvl.Cam_X, lvl.Height - 5, "LLLLL", Termbox.YELLOW, Termbox.BLACK); 
      Gfx.Draw_String(Ene.Get_Enemy_Position - lvl.Cam_X, lvl.Height - 4, "LLLLL", Termbox.YELLOW, Termbox.BLACK); 
      Gfx.Draw_String(Ene.Get_Enemy_Position - lvl.Cam_X, lvl.Height - 3, "LLLLL", Termbox.YELLOW, Termbox.BLACK); 
      Gfx.Draw_String(Ene.Get_Enemy_Position - lvl.Cam_X, lvl.Height - 2, "LLLLL", Termbox.YELLOW, Termbox.BLACK); 
      Gfx.Draw_String(Ene.Get_Enemy_Position - lvl.Cam_X, lvl.Height - 1, "LLLLL", Termbox.YELLOW, Termbox.BLACK);
      Gfx.Draw_String(Ene.Get_Enemy_Position - lvl.Cam_X + 1, lvl.Height - 3, Integer'Image(Ene.Get_Enemy_Resolve), Termbox.WHITE, Termbox.BLACK);
   end Draw_Enemy;
   
   function Update_Enemy(Ene: in out BaseEnemy_Type; lvl: Level_Type) return Exit_Values is
      randint: Integer;
   begin
      if Ene.Resolve > 0 then
	 randint := Util.Random_Integer(0,Ene.Speed + 3);
	 if randint < Ene.Speed then
	    Ene.Position := Ene.Position - randint;
	 end if;
      else
	 Ene.Position := Ene.Position + Ene.Speed;
	 if Ene.Position > 500 then
	    Ene.Position := 500;
	 end if;
      end if;
      
      if Ene.Position < 10 then
	 Return Level_Failure;
      end if;
	 
      return Continue;
   end Update_Enemy;
	   
   procedure Whoop_Enemy(Ene: in out BaseEnemy_Type; s: Scare_Values) is
   begin
      if s = Whoop then
	 Ene.Resolve := Ene.Resolve - 1;
      elsif s = Knock then
	 Ene.Resolve := Ene.Resolve - 3;
      elsif s = Scream then
	 Ene.Resolve := Ene.Resolve - 20;
      end if;
   end Whoop_Enemy;
   
   procedure Whoop_Enemy(Ene: in out ResearcherEnemy_Type; s: Scare_Values) is
   begin
      if s = Whoop then
	 if Ene.Resolve > 0 then
	    Ene.Resolve := Ene.Resolve + 1;
	 end if;
      elsif s = Knock then
	 if Ene.Resolve > 0 then
	    Ene.Resolve := Ene.Resolve + 3;
	 end if;
      elsif s = Scream then
	 Ene.Resolve := Ene.Resolve - 20;
      end if;
   end Whoop_Enemy;
   
   function Create_Level(sgoal: Positive; ntrees: Positive; nenemies: Positive; nitems: Positive) return Level_Type is
      RV: Level_Type(ntrees, nenemies, nitems);
      BF: Bigfoot;
      randint: Integer;
   begin
      BF.Position := 60;
      BF.Sticks := 0;
      BF.Rocks := 0;
      BF.Special := 0; -- out of 10
      
      RV.Stick_Goal := sgoal;
      RV.Num_Trees := ntrees;
      RV.Player := BF;
      
      for i in 1..ntrees loop
	 RV.Trees(i).Position := Util.Random_Integer(20, RV.Width - 20);
	 RV.Trees(i).Max_Sticks := Util.Random_Integer(20,99);
	 RV.Trees(i).Sticks := Util.Random_Integer(0,RV.Trees(i).Max_Sticks);
	 RV.Trees(i).Dead := False;
      end loop;
      
      Spawn_Items(RV, 5);
      for i in RV.Rocks'Range loop
	 RV.Rocks(i) := -10;
      end loop;
      for i in RV.Status'Range loop
	 RV.Status(i) := To_Unbounded_String("...");
      end loop;
      
      for i in RV.Enemies'Range loop
	 randint := Util.Random_Integer(1,10);
	 if randint < 3 then 
	    RV.Enemies(i) := new BaseEnemy_Type'Class'(Create_Hiker(Util.Random_Integer(50, RV.Width - 50), 20, 4));
	 elsif randint >= 3 and randint < 7 then
	    RV.Enemies(i) := new BaseEnemy_Type'Class'(Create_Camper(Util.Random_Integer(50, RV.Width - 50), 20, 8, 10));
	 elsif randint >= 7 and randint < 10 then
	    RV.Enemies(i) := new BaseEnemy_Type'Class'(Create_Researcher(Util.Random_Integer(50, RV.Width - 50), 20, 8));
	 else
	    RV.Enemies(i) := new BaseEnemy_Type'Class'(Create_Logger(Util.Random_Integer(50, RV.Width - 50), 20, 10, 10));
	 end if;
      end loop;
      return RV;
   end Create_Level;
   
   procedure Draw_Level(lvl: Level_Type) is
   begin
      for y in 0..lvl.Height-1 loop
	 for x in 0..lvl.Screen_Width-1 loop
	    if y /= lvl.Height then
	      Termbox.Change_Cell(x, y, '.', Termbox.GREEN, Termbox.BLACK);
	    else
	       Termbox.Change_Cell(x, y, '#', Termbox.BLACK, Termbox.GREEN);
	    end if;
	 end loop;
      end loop;
      Draw_Stump(lvl);
      Draw_Items(lvl);
      Draw_Bigfoot(lvl);
      Draw_Trees(lvl);
      Draw_Structures(lvl);
      Draw_Enemies(lvl);
      --draw rocks
      for i in lvl.Rocks'Range loop
	 if lvl.Rocks(i) /= -10 then
	    Termbox.Change_Cell(lvl.Rocks(i) - lvl.Cam_X, lvl.Height - 4, 'o', Termbox.BLACK, Termbox.WHITE);
	 end if;
      end loop;
	      
      
      Draw_HUD(lvl);
      
   end Draw_Level;
   
   procedure Draw_Trees(lvl: Level_Type) is
      treex: Positive;
   begin
      for i in lvl.Trees'Range loop
	 treex := lvl.Trees(i).Position;
	 Gfx.Draw_String(treex - lvl.Cam_X, lvl.Height - 15, "t", Termbox.WHITE, Termbox.GREEN);
	 Gfx.Draw_String(treex - lvl.Cam_X, lvl.Height - 14, "tt", Termbox.WHITE, Termbox.GREEN);
	 Gfx.Draw_String(treex - lvl.Cam_X, lvl.Height - 13, "tt", Termbox.WHITE, Termbox.GREEN);
	 Gfx.Draw_String(treex - lvl.Cam_X - 1, lvl.Height - 12, "tttt", Termbox.WHITE, Termbox.GREEN);
	 Gfx.Draw_String(treex - lvl.Cam_X - 1, lvl.Height - 11, "tttt", Termbox.WHITE, Termbox.GREEN);
	 Gfx.Draw_String(treex - lvl.Cam_X - 2, lvl.Height - 10, "tttttt", Termbox.WHITE, Termbox.GREEN);
	 Gfx.Draw_String(treex - lvl.Cam_X - 3, lvl.Height - 9, "tttttttt", Termbox.WHITE, Termbox.GREEN);
	 Gfx.Draw_String(treex - lvl.Cam_X - 3, lvl.Height - 8, "tttttttt", Termbox.WHITE, Termbox.GREEN);
	 Gfx.Draw_String(treex - lvl.Cam_X - 4, lvl.Height - 7, "tttttttttt", Termbox.WHITE, Termbox.GREEN);
	 Gfx.Draw_String(treex - lvl.Cam_X - 4, lvl.Height - 6, "tttttttttt", Termbox.WHITE, Termbox.GREEN);
	 Gfx.Draw_String(treex - lvl.Cam_X, lvl.Height - 5, "TT", Termbox.BLACK, Termbox.RED);
	 Gfx.Draw_String(treex - lvl.Cam_X, lvl.Height - 4, "TT", Termbox.BLACK, Termbox.RED);
	 Gfx.Draw_String(treex - lvl.Cam_X, lvl.Height - 3, "TT", Termbox.BLACK, Termbox.RED);
	 Gfx.Draw_String(treex - lvl.Cam_X, lvl.Height - 2, "TT", Termbox.BLACK, Termbox.RED);
	 Gfx.Draw_String(treex - lvl.Cam_X, lvl.Height - 1, "TT", Termbox.BLACK, Termbox.RED);
	 Gfx.Draw_String(treex - lvl.Cam_X, lvl.Height - 7, Positive'Image(lvl.Trees(i).Sticks), Termbox.WHITE, Termbox.BLACK);
      end loop;
   end Draw_Trees;
   
   procedure Draw_Stump(Lvl: Level_Type) is
   begin
      Gfx.Draw_String(2 - lvl.Cam_X, lvl.Height - 5, "SSSSSS", Termbox.BLACK, Termbox.RED);
      Gfx.Draw_String(2 - lvl.Cam_X, lvl.Height - 4, "SSSSSS", Termbox.BLACK, Termbox.RED);
      Gfx.Draw_String(2 - lvl.Cam_X, lvl.Height - 3, "SSSSSSS", Termbox.BLACK, Termbox.RED);
      Gfx.Draw_String(2 - lvl.Cam_X, lvl.Height - 2, "SSSSSSS", Termbox.BLACK, Termbox.RED);
      Gfx.Draw_String(1 - lvl.Cam_X, lvl.Height - 1, "SSSSSSSSSS", Termbox.BLACK, Termbox.RED);
      Gfx.Draw_String(4 - lvl.Cam_X, lvl.Height - 3, Integer'Image(lvl.Stick_Goal_Progress), Termbox.WHITE, Termbox.BLACK);
      Gfx.Draw_String(4 - lvl.Cam_X, lvl.Height - 2, Integer'Image(lvl.Stick_Goal), Termbox.WHITE, Termbox.BLACK);
   end Draw_Stump;
   
   procedure Draw_Bigfoot(lvl: Level_Type) is
      bfpos: Integer := lvl.Player.Position;
   begin
      Gfx.Draw_String(bfpos - lvl.Cam_X, lvl.Height - 7, "BBBBB", Termbox.CYAN, Termbox.BLACK); 
      Gfx.Draw_String(bfpos - lvl.Cam_X, lvl.Height - 6, "BBBBB", Termbox.CYAN, Termbox.BLACK); 
      Gfx.Draw_String(bfpos - lvl.Cam_X, lvl.Height - 5, "BBBBB", Termbox.CYAN, Termbox.BLACK); 
      Gfx.Draw_String(bfpos - lvl.Cam_X, lvl.Height - 4, "BBBBB", Termbox.CYAN, Termbox.BLACK); 
      Gfx.Draw_String(bfpos - lvl.Cam_X, lvl.Height - 3, "BBBBB", Termbox.CYAN, Termbox.BLACK); 
      Gfx.Draw_String(bfpos - lvl.Cam_X, lvl.Height - 2, "BBBBB", Termbox.CYAN, Termbox.BLACK); 
      Gfx.Draw_String(bfpos - lvl.Cam_X, lvl.Height - 1, "BBBBB", Termbox.CYAN, Termbox.BLACK); 
   end Draw_Bigfoot;
   
   procedure Draw_Hud(lvl: Level_Type) is
   begin
      Gfx.Draw_String(1, 21, "Sticks: " & Integer'Image(lvl.Player.Sticks), Termbox.GREEN, Termbox.BLACK);
      Gfx.Draw_String(1, 22, "Rocks: " & Integer'Image(lvl.Player.Rocks), Termbox.GREEN, Termbox.BLACK);
      Gfx.Draw_String(1, 23, "Special:", Termbox.GREEN, Termbox.BLACK);
      Gfx.Draw_String(10, 23, "..........", Termbox.BLUE, Termbox.BLUE);
      for i in 1..lvl.Player.Special loop
	 Termbox.Change_Cell(i+9, 23, '.', Termbox.RED, Termbox.RED);
      end loop;
      for i in lvl.Status'Range loop
	 Gfx.Draw_String(25, 20 + i, To_String(lvl.Status(i)), Termbox.GREEN, Termbox.BLACK);
      end loop;
	 
   end Draw_Hud;
   
   procedure Draw_Items(lvl: Level_Type) is
      item_lst: Item_Array := lvl.Items;
   begin
      for i in item_lst'Range loop
	 if item_lst(i).Kind = Rocks then
	    Gfx.Draw_String(item_lst(i).Position - lvl.Cam_X, lvl.Height - 2, "oo", Termbox.BLACK, Termbox.WHITE);
	    Gfx.Draw_String(item_lst(i).Position - lvl.Cam_X, lvl.Height - 1, "ooo", Termbox.BLACK, Termbox.WHITE);
	 elsif item_lst(i).Kind = Food then
	    Gfx.Draw_String(item_lst(i).Position - lvl.Cam_X + 2, lvl.Height - 4, ",", Termbox.RED, Termbox.GREEN);
	    Gfx.Draw_String(item_lst(i).Position - lvl.Cam_X + 1, lvl.Height - 3, "F", Termbox.GREEN, Termbox.RED);
	    Gfx.Draw_String(item_lst(i).Position - lvl.Cam_X, lvl.Height - 2, "FFF", Termbox.GREEN, Termbox.RED);
	    Gfx.Draw_String(item_lst(i).Position - lvl.Cam_X, lvl.Height - 1, "FFF", Termbox.GREEN, Termbox.RED);
	 elsif item_lst(i).Kind = Sticks then
	    Gfx.Draw_String(item_lst(i).Position - lvl.Cam_X, lvl.Height - 1, "----f--", Termbox.BLACK, Termbox.RED);
	 end if;
      end loop;
   end Draw_Items;
   
   procedure Draw_Structures(lvl: Level_Type) is
   begin
      for i in lvl.Structures'Range loop
	 if lvl.Structures(i).Upgrade = 1 then
	    Gfx.Draw_String(lvl.Structures(i).Position - lvl.Cam_X + 2, lvl.Height -5, "/", Termbox.RED, Termbox.BLACK);
	    Gfx.Draw_String(lvl.Structures(i).Position - lvl.Cam_X + 1,lvl.Height -4, "/", Termbox.RED, Termbox.BLACK);
	    Gfx.Draw_String(lvl.Structures(i).Position - lvl.Cam_X, lvl.Height -3, "|", Termbox.RED, Termbox.BLACK);
	    Gfx.Draw_String(lvl.Structures(i).Position - lvl.Cam_X, lvl.Height -2, "|", Termbox.RED, Termbox.BLACK);
	    Gfx.Draw_String(lvl.Structures(i).Position - lvl.Cam_X, lvl.Height -1, "|", Termbox.RED, Termbox.BLACK);
	 elsif lvl.Structures(i).Upgrade = 2  then
	    Gfx.Draw_String(lvl.Structures(i).Position - lvl.Cam_X, lvl.Height -5, "\|/", Termbox.RED, Termbox.BLACK);
	    Gfx.Draw_String(lvl.Structures(i).Position - lvl.Cam_X + 1, lvl.Height -4, "T", Termbox.RED, Termbox.BLACK);
	    Gfx.Draw_String(lvl.Structures(i).Position - lvl.Cam_X + 1, lvl.Height -3, "|", Termbox.RED, Termbox.BLACK);
	    Gfx.Draw_String(lvl.Structures(i).Position - lvl.Cam_X + 1, lvl.Height -2, "|", Termbox.RED, Termbox.BLACK);
	    Gfx.Draw_String(lvl.Structures(i).Position - lvl.Cam_X + 1, lvl.Height -1, "|", Termbox.RED, Termbox.BLACK);
	 elsif lvl.Structures(i).Upgrade = 3 then
	    Gfx.Draw_String(lvl.Structures(i).Position - lvl.Cam_X, lvl.Height -5, "\ | /", Termbox.RED, Termbox.BLACK);
	    Gfx.Draw_String(lvl.Structures(i).Position - lvl.Cam_X+1, lvl.Height -4, "\|/", Termbox.RED, Termbox.BLACK);
	    Gfx.Draw_String(lvl.Structures(i).Position - lvl.Cam_X+2, lvl.Height -3, "X", Termbox.RED, Termbox.BLACK);
	    Gfx.Draw_String(lvl.Structures(i).Position - lvl.Cam_X+1, lvl.Height -2, " /|\", Termbox.RED, Termbox.BLACK);
	    Gfx.Draw_String(lvl.Structures(i).Position - lvl.Cam_X, lvl.Height -1, "/ | \", Termbox.RED, Termbox.BLACK);
	 end if;	 
	    
      end loop;
   end Draw_Structures;
   
   procedure Draw_Enemies(lvl: Level_Type) is
   begin
      for i in lvl.Enemies'Range loop
	 Draw_Enemy(lvl.Enemies(i).all, lvl);
      end loop;
   end Draw_Enemies;
   
   
   function Update_Level(lvl: in out Level_Type; Process_Key: Integer)  return Exit_Values is
      Update_Result: Exit_Values := Continue;
   begin
      Update_Result := Update_Bigfoot(lvl, Process_Key);
      --update rocks
      for i in lvl.Rocks'Range loop
	 if lvl.Rocks(i) /= -10 then
	    lvl.Rocks(i) := lvl.Rocks(i) + 1;
	    if lvl.Rocks(i) > lvl.Width then
	       lvl.Rocks(i) := -10;
	    end if;
	 end if;
      end loop;
		 
      return Continue;
   end Update_Level;
   
   function Update_Bigfoot(lvl: in out Level_Type; Process_Key: Integer) return Exit_Values is
      scare: Scare_Values;
   begin
      if Process_Key = 97 then -- a (left)
	 lvl.Player.Position := lvl.Player.Position - 1;
      elsif Process_Key = 100 then -- d (right)
	 lvl.Player.Position := lvl.Player.Position + 1;
      elsif Process_Key = 115 then -- s (pick up/harvest)
	 Bigfoot_Harvest(lvl);
      elsif Process_Key = 101 then -- e (throw rock)
	 if lvl.Player.Rocks > 0 then
	    lvl.Player.Rocks := lvl.Player.Rocks - 1;
	    for i in lvl.Rocks'Range loop
	       if lvl.Rocks(i) = -10 then
		  lvl.Rocks(i) := lvl.Player.Position + 5;
		  exit;
	       end if;
	    end loop;
	 end if;
      elsif Process_Key = 113 then -- q (build)
	 Bigfoot_Build(lvl);
      elsif Process_Key = 119 then --w (whoop, knock)
	 scare := Whoop;
	 for i in lvl.Trees'Range loop
	    if Bigfoot_Object_Collide(lvl.Player, lvl.Trees(i).Position, 2) then
	       scare := Knock;
	       exit;
	    end if;
	 end loop;
	 if scare = Knock then
	    Update_Status(lvl, "*KNOCK* *KNOCK* *KNOCK*");
	 else
	    Update_Status(lvl, "WHOOP! WHOOP!");
	 end if;
	 
	 for i in lvl.Enemies'Range loop
	    if Bigfoot_Object_Collide(lvl.Player, lvl.Enemies(i).all.Position, 50) then
	       Whoop_Enemy(lvl.Enemies(i).all, scare);
	    end if;
	 end loop;
      elsif Process_Key = 103 then -- g (special)
	 if lvl.Player.Special >= 10 then
	    Update_Status(lvl, "ARGURORUAHHGHFHHAAAR!!!");
	    for i in lvl.Enemies'Range loop
	       if lvl.Player.Position >= lvl.Enemies(i).all.Position -40 and lvl.Player.Position <= lvl.Enemies(i).all.Position + 40 then
		  Whoop_Enemy(lvl.Enemies(i).all, Scream);
	       end if;
	    end loop;
	    --lvl.Player.Special := 0;
	 end if;
	
      end if;
      
      -- clamp possible positions
      if lvl.Player.Position < 0 then
	 lvl.Player.Position := 0;
      elsif lvl.Player.Position > lvl.Width - 5 then
	 lvl.Player.Position := lvl.Width - 5;
      end if;
      
      -- scroll camera
      if lvl.Player.Position - lvl.Cam_X >= lvl.Screen_Width - 10 then
	 if lvl.Cam_X < lvl.Width - lvl.Screen_Width then
	    lvl.Cam_X := lvl.Cam_X + 1;
	 end if;
      end if;
      if lvl.Player.Position - lvl.Cam_X <= 6 then
	 if lvl.Cam_X > 0 then
	    lvl.Cam_X := lvl.Cam_X - 1;
	 end if;
      end if;
      
      --stump collection
      if lvl.Player.Position <= 11 then
	 if lvl.Player.Sticks > 0 then
	    lvl.Stick_Goal_Progress := lvl.Stick_Goal_Progress + lvl.Player.Sticks;
	    lvl.Player.Sticks := 0;
	 end if;
      end if;
      
	
	 
      return Continue;
   end Update_Bigfoot;
   
   function Update_Level_Periodic(lvl: in out Level_Type) return Exit_Values is
      Update_Result: Exit_Values;
      should_spawn: Integer;
   begin
      Update_Result := Update_Trees(lvl);
      Update_Result := Update_Enemies(lvl);
      if Update_Result = Level_Failure or Update_Result = Level_Success then
	 return Update_Result;
      end if;
      
      should_spawn := Util.Random_Integer(1,6);
      --should_spawn := 0;
      if should_spawn = 1 then
	 Spawn_Items(lvl, Util.Random_Integer(1,5)); 
      end if;
      return Continue;
   end Update_Level_Periodic;
   
   function Update_Trees(lvl: in out Level_Type) return Exit_Values is  
   begin
      for i in lvl.Trees'Range loop
	 lvl.Trees(i).Sticks := lvl.Trees(i).Sticks + Util.Random_Integer(0,5);
	 if lvl.Trees(i).Sticks > lvl.Trees(i).Max_Sticks then
	    lvl.Trees(i).Sticks := lvl.Trees(i).Max_Sticks;
	 end if;
      end loop;
      return Continue;
   end Update_Trees;
   
   function Update_Enemies(lvl: in out Level_Type) return Exit_Values is
      RV: Exit_Values;
      all_dead: Boolean := True;
   begin
      for i in lvl.Enemies'Range loop
	 RV := Update_Enemy(lvl.Enemies(i).all, lvl);
	 if lvl.Enemies(i).all.Position <= 10 then
	    return Level_Failure;
	 end if;
	 if lvl.Enemies(i).all.Resolve > 0 then
	    all_dead := False;
	 end if;
      end loop;
      if all_dead = True then
	 return Level_Success;
      end if;
      return Continue;
   end Update_Enemies;
   
   procedure Bigfoot_Harvest(lvl: in out Level_Type) is
      random_harvest: Integer;
   begin
      for i in lvl.Items'Range loop
	 if Bigfoot_Object_Collide(lvl.Player, lvl.Items(i).Position, lvl.Items(i).Width) then
	    if lvl.Items(i).Kind = Sticks then
	       lvl.Player.Sticks := lvl.Player.Sticks + 20;
	       Update_Status(lvl, "Got 20 sticks.");
	    elsif lvl.Items(i).Kind = Rocks then
	       lvl.Player.Rocks := lvl.Player.Rocks + 10;
	       Update_Status(lvl, "Got 10 rocks.");
	    else
	       lvl.Player.Special := lvl.Player.Special + 1;
	       Update_Status(lvl, "Got an apple.");
	    end if;
	    lvl.Items(i).Position := -10;
	    return;
	 end if;
      end loop;
      for i in lvl.Trees'Range loop
	 if Bigfoot_Object_Collide(lvl.Player, lvl.Trees(i).Position, 2) then
	    random_harvest:= Util.Random_Integer(0,10);
	    if random_harvest >= lvl.Trees(i).Sticks then
	       lvl.Player.Sticks := lvl.Player.Sticks + lvl.Trees(i).Sticks;
	       lvl.Trees(i).Sticks := 0;
	    else
	       lvl.Player.Sticks := lvl.Player.Sticks + random_harvest;
	       lvl.Trees(i).Sticks := lvl.Trees(i).Sticks - random_harvest;
	    end if;
	 end if;
      end loop;
      
   end Bigfoot_Harvest;
   
   function Bigfoot_Object_Collide(bf: Bigfoot; pos: Integer; w: Positive) return Boolean is
   begin
      if bf.Position >= pos - 5 and bf.Position <= pos + w then
	 return True;
      else
	 return False;
      end if;
   end Bigfoot_Object_Collide;
   
   procedure Bigfoot_Build(lvl: in out Level_Type) is
      new_structure_idx: Integer := -1;
   begin
      --upgrade
      for i in lvl.Structures'Range loop
	 if Bigfoot_Object_Collide(lvl.Player, lvl.Structures(i).Position, lvl.Structures(i).Width) then
	    if lvl.Structures(i).Upgrade < 3 then
	       if lvl.Player.Sticks >= ((lvl.Structures(i).Upgrade + 1) * 10) then
		  lvl.Player.Sticks := (lvl.Structures(i).Upgrade + 1) * 10;
		  lvl.Structures(i).Upgrade := lvl.Structures(i).Upgrade + 1;
		  if lvl.Structures(i).Upgrade = 2 then
		    lvl.Structures(i).Power := 10;
		    lvl.Structures(i).Width := 3;
		  elsif lvl.Structures(i).Upgrade = 3 then
		    lvl.Structures(i).Power := 30;
		    lvl.Structures(i).Width := 5;
		  end if;
		  Update_Status(lvl, "Upgraded structure!");
	       end if;
	    else
	       Update_Status(lvl, "Structure at max level 3.");
	    end if;
	    return;
	 end if;
      end loop;
      
      --new
      for i in lvl.Structures'Range loop
	 if lvl.Structures(i).Position = -10 then
	   new_structure_idx := i;
	   exit;
	 end if;
      end loop;
      if new_structure_idx /= -1 then
	if lvl.Player.Sticks >= 10 then
	   lvl.Player.Sticks := lvl.Player.Sticks - 10;
	   lvl.Structures(new_structure_idx).Position := lvl.Player.Position;
	   lvl.Structures(new_structure_idx).Upgrade := 1;
	   lvl.Structures(new_structure_idx).Power := 5;
	   lvl.Structures(new_structure_idx).Width := 3;
	else
	   Update_Status(lvl, "New structures cost 10 sticks, you have " & Integer'Image(lvl.Player.Sticks) & ".");
	end if;
      else
	 Update_Status(lvl, "Maximum structures limit met, try upgrading existing structures.");
      end if;
   end Bigfoot_Build;
   
   procedure Spawn_Items(lvl: in out Level_Type; num: Integer) is
      available_item_idx: Integer := -1;
      random_kind: Integer;
   begin
      for i in 1..num loop
	 available_item_idx := -1;
	 for j in lvl.Items'Range loop
	    if lvl.Items(j).Position = -10 then
	      available_item_idx := j;
	      exit;
	    end if;
	 end loop;
	 if available_item_idx /= -1 then
	    lvl.Items(available_item_idx).Position := Util.Random_Integer(15, lvl.Width - 15);
	    random_kind := Util.Random_Integer(1, 3);
	    if random_kind = 1 then
	       lvl.Items(available_item_idx).Kind := Rocks;
	       lvl.Items(available_item_idx).Width := 3;
	    elsif random_kind = 2 then
	       lvl.Items(available_item_idx).Kind := Sticks;
	       lvl.Items(available_item_idx).Width := 7;
	    else
	       lvl.Items(available_item_idx).Kind := Food;
	       lvl.Items(available_item_idx).Width := 3;
	    end if;   
	 end if;
	 
      end loop;
   end Spawn_Items;
   
   
   procedure Update_Status(lvl: in out Level_Type; status: String) is
   begin
      lvl.Status(3) := lvl.Status(2);
      lvl.Status(2) := lvl.Status(1);
      lvl.Status(1) := To_Unbounded_String(status);
   end Update_Status;
      
end Level;
