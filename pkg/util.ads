with Ada.Numerics.Discrete_Random;

package Util is
   package Rand_Int is new Ada.Numerics.Discrete_Random(Integer);
   gen : Rand_Int.Generator;
   function Random_Integer(Min: Integer; Max: Integer) return Integer;
   
end Util;
