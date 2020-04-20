with Ada.Strings.UnBounded; use Ada.Strings.UnBounded;

with Termbox;
with Gfx;
with Util;

package Level is
   
   type Level_Type; --forward declaration
   type Exit_Values is (Level_Success, Level_Failure, Continue);
   type Scare_Values is (Whoop, Knock, Scream);
   
   type BaseEnemy_Type is tagged private;
   type BaseEnemy_Access is access BaseEnemy_Type'Class;
   function Create_Enemy (Pos: Integer; Res: Integer) return BaseEnemy_Access;
   procedure Update_Enemy_Position(Ene: in out BaseEnemy_Type; Pos: Integer);
   procedure Update_Enemy_Resolve(Ene: in out BaseEnemy_Type; Res: Integer);
   function Get_Enemy_Position(Ene: BaseEnemy_Type) return Integer;
   function Get_Enemy_Resolve(Ene: BaseEnemy_Type) return Integer;
   function Update_Enemy(Ene: in out BaseEnemy_Type; lvl: Level_Type) return Exit_Values;
   procedure Whoop_Enemy(Ene: in out BaseEnemy_Type; s: Scare_Values);
   procedure Draw_Enemy(Ene: BaseEnemy_Type; lvl: Level_Type);
   
   type HikerEnemy_Type is new BaseEnemy_Type with private;
   function Create_Hiker(Pos: Integer; Res: Integer; Speed: Integer) return BaseEnemy_Type'Class;
   procedure Draw_Enemy(Ene: HikerEnemy_Type; lvl: Level_Type);
   
   type CamperEnemy_Type is new BaseEnemy_Type with private;
   function Create_Camper(Pos: Integer; Res: Integer; Sp: Integer; Cs: Integer) return BaseEnemy_Type'Class;
   procedure Draw_Enemy(Ene: CamperEnemy_Type; lvl: Level_Type);
   
   type ResearcherEnemy_Type is new BaseEnemy_Type with private;
   function Create_Researcher(Pos: Integer; Res: Integer; Sp: Integer) return BaseEnemy_Type'Class;
   procedure Draw_Enemy(Ene: ResearcherEnemy_Type; lvl: Level_Type);
   procedure Whoop_Enemy(Ene: in out ResearcherEnemy_Type; s: Scare_Values);
						 
   type LoggerEnemy_Type is new BaseEnemy_Type with private;
   function Create_Logger(Pos: Integer; Res: Integer; Sp: Integer; Fc: Integer) return BaseEnemy_Type'Class;
   procedure Draw_Enemy(Ene: LoggerEnemy_Type; lvl: Level_Type);
   
   type Tree is
      record
	 Position: Positive;
	 Max_Sticks: Integer;
	 Sticks: Integer;
	 Dead: Boolean := False;
      end record;
   
   type Tree_Array is array(Positive range <>) of Tree;
   
   type Bigfoot is
      record
	 Position: Integer;
	 Sticks: Integer;
	 Rocks: Integer;
	 Special: Integer;
      end record;
   
   type Structure is
      record
	 Position: Integer := -10;
	 Upgrade: Integer := 0;
	 Power: Positive:= 1;
	 Width: Positive := 1;
      end record;
   
   type Structure_Array is Array(Positive range 1..50) of Structure;
   
   type Item_Type is (Rocks, Sticks, Food);
   
   type Item is
      record
	 Position: Integer := -10; --offscreen when "picked up"
	 Kind: Item_Type;
	 Width: Positive := 1;
      end Record;
   
   type Item_Array is Array(Positive range <>) of Item;
   
   
   type Rock_Array is Array(Positive Range 1..50) of Integer; --integers representing rock positions for throws
   
   type Status_Array is Array(1..3) of Unbounded_String;
   
   type Enemy_Array is Array(Positive range <>) of BaseEnemy_Access;
	
   type Level_Type (ntrees: Positive; nenemies: Positive; nitems: Positive) is
     record
	Stick_Goal: Positive := 200;
	Stick_Goal_Progress: Integer := 0;
	Num_Trees: Positive := ntrees;
	Trees: Tree_Array(1..ntrees);
	Max_Items: Integer := nitems;
	Structures: Structure_Array;
	Items: Item_Array(1..nitems);
	Enemies: Enemy_Array(1..nenemies);
	Rocks: Rock_Array;
	Status: Status_Array;
	Player: Bigfoot;
	Screen_Width: Positive := 80;
	Cam_X: Integer := 0;
	Width: Positive := 80 * 5; --this is the width of the world
	Height: Positive := 20;
     end record;
   
   function Create_Level(sgoal: Positive; ntrees: Positive; nenemies: Positive; nitems: Positive) return Level_Type;
   procedure Draw_Level(lvl: Level_Type);
   procedure Draw_Trees(lvl: Level_Type);
   procedure Draw_Stump(lvl: Level_Type);
   procedure Draw_Bigfoot(lvl: Level_Type);
   procedure Draw_Hud(lvl: Level_Type);
   procedure Draw_Items(lvl: Level_Type);
   procedure Draw_Structures(lvl: Level_Type);
   procedure Draw_Enemies(lvl: Level_Type);
   
   function Update_Level(lvl: in out Level_Type; Process_Key: Integer)  return Exit_Values;
   function Update_Level_Periodic(lvl: in out Level_Type) return Exit_Values;
   function Update_Bigfoot(lvl: in out Level_Type; Process_Key: Integer) return Exit_Values;
   function Update_Trees(lvl: in out Level_Type) return Exit_Values;
   function Update_Enemies(lvl: in out Level_Type) return Exit_Values;
   
   procedure Bigfoot_Harvest(lvl: in out Level_Type);
   function Bigfoot_Object_Collide(bf: Bigfoot; pos: Integer; w: Positive) return Boolean;
   procedure Bigfoot_Build(lvl: in out Level_Type);
   
   procedure Spawn_Items(lvl: in out Level_Type; num: Integer);
   
   procedure Update_Status(lvl: in out Level_Type; status: String);
   
private
   type BaseEnemy_Type is 
     tagged record
      Position: Integer;
      Resolve: Integer;
      Speed: Integer;
   end record;
   
   type HikerEnemy_Type is new BaseEnemy_Type with
      record
	 null;
      end record;
   
   type CamperEnemy_Type is new BaseEnemy_Type with
      record
	 Campsite: Integer;
      end record;
   
   type ResearcherEnemy_Type is new BaseEnemy_Type with
      record
	 null;
      end record;
     
   type LoggerEnemy_Type is new BaseEnemy_Type with
      record
	 Felling_Chance: Integer;
      end record;
   
end Level;
