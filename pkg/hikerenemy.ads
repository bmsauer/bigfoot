with Gfx;
with BaseEnemy;

limited with Level;

package HikerEnemy is
   
   type HikerEnemy_Type is new BaseEnemy.BaseEnemy_Type with private;
   
   function Create_Enemy (Pos: Integer; Res: Integer) return BaseEnemy.BaseEnemy_Access;
   procedure Update_Enemy_Position(Ene: in out HikerEnemy_Type; Pos: Integer);
   procedure Update_Enemy_Resolve(Ene: in out HikerEnemy_Type; Res: Integer);
   function Get_Enemy_Position(Ene: HikerEnemy_Type) return Integer;
   function Get_Enemy_Resolve(Ene: HikerEnemy_Type) return Integer;
   
  
   procedure Draw_Enemy(Ene: HikerEnemy_Type; lvl: BaseEnemy.Level_Access);
   
private
   type HikerEnemy_Type is new BaseEnemy.BaseEnemy_Type with
     record
      Speed: Integer := 1;
   end record;
   
end HikerEnemy;
