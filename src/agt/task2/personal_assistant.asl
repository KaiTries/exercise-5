// personal assistant agent 
/* Task 2 Start of your solution */

/* SubTask 3 Define beliefs about wake up preference */
artificial_light(2).
natural_light(1).
vibrations(0).

/* SubTask 3 Define inference rules */
best_option(Option):- Option = 0.



/* SubTask 1 print relevant beliefs */
+mattress(State) : true <-
    .print("Mattress is ", State).

+owner_state(State) : true <-
    .print("Owner state is ", State).

+lights(State) : true <-
    .print("Lights are ", State).

+blinds(State) : true <-
    .print("Blinds are ", State).


/* SubTask 2 React to event times*/
+upcoming_event("now") : owner_state("awake") <-
    .print("Upcoming event is now");
    .print("Enjoy your event").

+upcoming_event("now") : owner_state("asleep") <-
    .print("Upcoming event is now");
    .print("Starting wake up routine.");
    !wake_up_user.

+upcoming_event(Event) : true <-
    .print("Upcoming event is ", Event).


/* SubTask 4 & 5 Implement logic to wake up user */
+!wake_up_user : true & owner_state("asleep") <-
    .print("Starting wake up routine");
    !try_wake_up_method;
    .wait(1000);
    !wake_up_user.

+!wake_up_user : true & owner_state("awake")<-
    .print("Owner is already awake").

/* SubTask 5 Update beliefts after wake up method is chosen */
+!try_wake_up_method : artificial_light(Number) & best_option(Number) <-
    .print("Wake up user with artificial light");
    -+artificial_light(2);
    -+natural_light(1);
    -+vibrations(0);
    turnOnLights.

+!try_wake_up_method : natural_light(Number) & best_option(Number) <-
    .print("Wake up user with natural light");
    -+vibrations(1);
    -+artificial_light(0);
    -+natural_light(2);
    raiseBlinds.

+!try_wake_up_method : vibrations(Number) & best_option(Number) <-
    .print("Wake up user with vibrations");
    -+vibrations(2);
    -+artificial_light(1);
    -+natural_light(0);
    setVibrationsMode.

+!try_wake_up_method : true <-
    .print("No wake up method available").







/* Task 2 End of your solution */

/* Import behavior of agents that work in CArtAgO environments */
{ include("$jacamoJar/templates/common-cartago.asl") }