limited with Level;

package BaseEnemy is
   
   type Level_Access is access Level.Level_Type;
   type BaseEnemy_Type is tagged private;
   type BaseEnemy_Access is access BaseEnemy_Type'Class;
      
	
   function Create_Enemy (Pos: Integer; Res: Integer) return BaseEnemy_Access;
   procedure Update_Enemy_Position(Ene: in out BaseEnemy_Type; Pos: Integer);
   procedure Update_Enemy_Resolve(Ene: in out BaseEnemy_Type; Res: Integer);
   function Get_Enemy_Position(Ene: BaseEnemy_Type) return Integer;
   function Get_Enemy_Resolve(Ene: BaseEnemy_Type) return Integer;
						 
   procedure Draw_Enemy(Ene: BaseEnemy_Type; lvl: Level_Access);
   
private
   type BaseEnemy_Type is 
     tagged record
      Position: Integer;
      Resolve: Integer;
   end record;
   
end BaseEnemy;
