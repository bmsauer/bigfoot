package body Util is
   function Random_Integer(Min: Integer; Max: Integer) return Integer is
      rand : Integer;
      
   begin
      rand := Rand_Int.Random(gen) mod ((Max - Min) + 1); 
      return rand + min;
   end Random_Integer;
   
begin
   Rand_Int.Reset(gen);
end Util;
