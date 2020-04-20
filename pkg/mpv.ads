with Ada.Strings.UnBounded;
with System;
with Interfaces.C.Strings;
with Interfaces.C;
with mpv_client_h; use mpv_client_h;

package MPV is
   
   subtype Context_Addr is System.Address; 
   subtype Return_Value is Integer;
   type Command_Args_List is array(Integer range <>) of Ada.Strings.Unbounded.Unbounded_String; --Interfaces.C.Strings.chars_ptr_array;
   
   function Create return Context_Addr;
   function Initialize(Ctx: in Context_Addr) return Return_Value;
   function Error_String(RV: in Return_Value) return String;
   function Command(Ctx: in Context_Addr; Args: in Command_Args_List) return Return_Value;
   procedure Terminate_Destroy(Ctx: in Context_Addr);
   
end MPV;
