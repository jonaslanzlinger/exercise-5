// personal assistant agent 

/* Task 2 Start of your solution */

artificial_light(2).
natural_light(1).
mattress_vibration(0).

best_option(Number) :- Number = 0.

+lights(State) : true <-
   .print("Lights are ", State).

-lights(State) : true <-
   .print("Lights are ", State).

+blinds(State) : true <-
   .print("Blinds are ", State).

-blinds(State) : true <-
   .print("Blinds are ", State).

+mattress(State) : true <-
   .print("Mattress is ", State).

-mattress(State) : true <-
   .print("Mattress is ", State).

+wristband(State) : true <-
   .print("Wristband is ", State).

-wristband(State) : true <-
   .print("Wristband is ", State).

+upcoming_event("now") : owner_state("awake") <-
   .print("Enjoy your event.").
   
+upcoming_event("now") : owner_state("asleep") <-
   .print("Starting wake-up routine.");
   !wake_up.

+!wake_up : owner_state("asleep") & mattress_vibration(Number) & best_option(Number) <-
   .print("Wake up with mattress vibration.");
   setVibrationsMode;
   -+mattress_vibration(2);
   -+artificial_light(1);
   -+natural_light(0);
   .wait(1000);
   !wake_up.

+!wake_up : owner_state("asleep") & natural_light(Number) & best_option(Number) <-
   .print("Wake up with natural light.");
   raiseBlinds;
   -+natural_light(2);
   -+mattress_vibration(1);
   -+artificial_light(0);
   .wait(1000);
   !wake_up.

+!wake_up : owner_state("asleep") & artificial_light(Number) & best_option(Number) <-
   .print("Wake up with artificial light.");
   turnOnLights;
   -+artificial_light(2);
   -+natural_light(1);
   -+mattress_vibration(0);
   .wait(1000);
   !wake_up.

+!wake_up : true <-
   .print("The user is now awake.").

/* Task 2 End of your solution */

/* Import behavior of agents that work in CArtAgO environments */
{ include("$jacamoJar/templates/common-cartago.asl") }