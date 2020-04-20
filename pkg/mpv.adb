with Ada.Text_IO; use Ada.Text_IO;


package body MPV is
   
   function Create return Context_Addr is   
   begin
      return mpv_create;
   end Create;
   
   function Initialize(Ctx: in Context_Addr) return Return_Value is
      mpv_return_value: Interfaces.C.int;
   begin
      mpv_return_value :=  mpv_initialize(Ctx);
      return Return_Value(mpv_return_value);
   end Initialize;
   
   function Error_String(RV: in Return_Value) return String is
      char_value : Interfaces.C.Strings.chars_ptr;
      mpv_error_code : Interfaces.C.int := Interfaces.C.int(RV);
   begin
      char_value := mpv_error_string(mpv_error_code);
      return Interfaces.C.Strings.Value(char_value);
   end Error_String;
   
   function Command(Ctx: in Context_Addr; Args: in Command_Args_List) 
     -- todo: allow for more than 4 command arguments
		   return Return_Value is
      mpv_return_value: Interfaces.C.int;
      mpv_command_args: Interfaces.C.Strings.chars_ptr_array(1..5);
      
   begin
      for i in Integer range 1..5 loop
	 if (i > Args'Length) then
	    mpv_command_args(Interfaces.C.size_t(i)) := Interfaces.C.Strings.null_ptr;
	    exit;
	 else
	    mpv_command_args(Interfaces.C.size_t(i)) := Interfaces.C.Strings.New_String(Ada.Strings.Unbounded.To_String(Args(i)));
	 end if;
      end loop;   
      mpv_return_value := mpv_command(Ctx, mpv_command_args'Address); --Args'Address);
      return Return_Value(mpv_return_value);
   end Command;
   
   procedure Terminate_Destroy(Ctx: in Context_Addr) is
   begin
      mpv_terminate_destroy(Ctx);
   end Terminate_Destroy;  
end MPV;
