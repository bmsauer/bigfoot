package body BaseEnemy is
   
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
						 
   procedure Draw_Enemy(Ene: BaseEnemy_Type; lvl: Level_Access) is
   begin
      return;
   end Draw_Enemy;
   
   
end BaseEnemy;
