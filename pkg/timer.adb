package body Timer is
   function Time_Since_Epoch return Duration is
      The_Clock : Ada.Real_Time.Time := Ada.Real_Time.Clock;

      -- Convert to Time_Span   
      As_Time_Span : Ada.Real_Time.Time_Span := The_Clock - Time_Of(0, Time_Span_Zero);

      Dur : Duration := Ada.Real_Time.To_Duration(As_Time_Span);
   begin

      return Dur;
   end Time_Since_Epoch;
end Timer;
