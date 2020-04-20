with Ada.Real_Time; use Ada.Real_Time;


   
with Ada.Calendar;
with Ada.Calendar.Formatting;
with Ada.Text_IO; use Ada.Text_IO;

package Timer is
   function Time_Since_Epoch return Duration;   
end Timer;
