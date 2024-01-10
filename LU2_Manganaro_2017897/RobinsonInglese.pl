% Initial game state
:- dynamic current_step/1.
current_step(1).

% Definition of story steps
step(1, "Shipwreck").
step(2, "Survival").
step(3, "Building a Shelter").
step(4, "Encounter with Friday").
step(5, "Escape from the Island").
step(6, "Return to Homeland").

% Additional details for a more engaging experience
story_detail(1, "Shipwreck", "During the journey, your ship is hit by a storm and wrecks on a deserted island. You are the sole survivor. The beach is your only refuge, surrounded by dense jungle and unknown dangers.").
story_detail(2, "Survival", "To survive, you must make crucial decisions. The island is full of wildlife, and you must wisely choose between hunting for food or attempting to build a makeshift boat to explore other parts of the island.").
story_detail(3, "Building a Shelter", "As you settle in, elements become a challenge. Building a sturdy hut protects you from the weather, but building a signaling device might attract passing ships for rescue.").
story_detail(4, "Encounter with Friday", "One day, you encounter a native named Friday. Your choice to teach him your survival skills or proceed alone will have a significant impact on your journey.").
story_detail(5, "Escape from the Island", "It's time to escape. Will you seek help from a passing ship or take matters into your own hands by building a raft? The choices you make will determine your fate.").
story_detail(6, "Return to Homeland", "If you can survive and escape, the journey does not end here.").
story_detail(2, "Survival", "To survive, you must make crucial decisions. The island is full of wildlife, and you must wisely choose between hunting for food or attempting to build a makeshift boat to explore other parts of the island. Additionally, you recall a specific event from your journal. Identify it to unveil a hidden clue.").
story_detail(4, "Encounter with Friday", "One day, you encounter a native named Friday. Your choice to teach him your survival skills or proceed alone will have a significant impact on your journey. Friday challenges you with questions about your experiences on the island.").

% Definition of choices with their consequences
choices(1, ["Stay on the beach and build a temporary shelter", "Explore the interior of the island"]).
choices(2, ["Hunt for food", "Try to build a boat using driftwood and vines"]).
choices(3, ["Build a sturdy hut", "Build a signaling device"]).
choices(4, ["Teach Friday your survival skills", "Avoid Friday and continue alone"]).
choices(5, ["Seek help from a passing ship", "Build a raft to escape"]).
choices(6, ["Stay on the island with Friday", "Return to England by ship"]).

% Definition of puzzles 
puzzle(2, "Unearth the turning point: ", "As you delve into the annals of your past, recall a pivotal moment chronicled in your journal. Identify it to unveil the profound realization that shaped your early experiences on the island.", "Solitude").
puzzle(4, "Answer Friday's questions: ", "Friday poses questions about your life on the island. Reflect on the most challenging aspect of your early days in solitude and how you overcame it. The answer is a single word.", "Faith").

% Rules to manage choice consequences
consequence(1, "Stay on the beach and build a temporary shelter", "You chose to stay on the beach and build a temporary shelter. Your resilience to dangers increases, but escape will be more challenging.").
consequence(1, "Explore the interior of the island", "You chose to explore the interior of the island. You find valuable resources but also face dangers. Proceed to the next step.").
consequence(2, "Hunt for food", "You chose to hunt for food. You obtain enough food to survive. Proceed to the next step.").
consequence(2, "Try to build a boat using driftwood and vines", "You chose to try to build a boat. With determination, you successfully built a sturdy boat. Proceed to the next step.").
consequence(3, "Build a sturdy hut", "You built a sturdy hut for protection. Proceed to the next step.").
consequence(3, "Build a signaling device", "You built a signaling device to attract passing ships. However, this also attracted the attention of predators.").
consequence(4, "Teach Friday your survival skills", "You taught Friday your survival skills. Friday becomes a valuable ally, and together you face the challenges of the island. Proceed to the next step.").
consequence(4, "Avoid Friday and continue alone", "You chose to avoid Friday. The journey becomes more solitary and demanding.").
consequence(5, "Seek help from a passing ship", "You sought help from a passing ship. The ship contained mutineers who want to abandon the captain ashore.").
consequence(5, "Build a raft to escape", "You built a robust raft, but not enough to allow a successful escape.").
consequence(6, "Stay on the island with Friday", "You chose to stay on the island with Friday. Together, you build a new life away from civilization.").
consequence(6, "Return to England by ship", "You decided to return to England by ship. Congratulations, you have successfully returned home!").

% Predicate to check the validity of the choice
valid_choice(1, "Explore the interior of the island").
valid_choice(2, "Hunt for food").
valid_choice(3, "Build a sturdy hut").
valid_choice(4, "Teach Friday your survival skills").
valid_choice(5, "Seek help from a passing ship").
valid_choice(6, "Return to England by ship").

% Predicate to manage user choice and consequences
:- discontiguous start_game/0.
make_choice :-
    provide_story_details,
    current_step(CurrentStep),
    choices(CurrentStep, Options),
    write('Choose an option by entering 1 or 2: '), write(Options), nl,
    read(UserInput),
    (integer(UserInput), nth1(UserInput, Options, UserChoice) ->
        consequence(CurrentStep, UserChoice, Consequence),
        write(Consequence), nl,
        (valid_choice(CurrentStep, UserChoice) ->
            (puzzle(CurrentStep, PuzzlePrompt, Feedback, Solution) ->
                write('Puzzle: '), write(PuzzlePrompt), write(Feedback), nl,
                read(UserAnswer),
                ((UserAnswer = Solution) ->
                write('Correct! You unlocked hidden resources.'), nl;
                downcase_atom(UserAnswer, LowerUserAnswer),
                downcase_atom(Solution, LowerSolution),
                LowerUserAnswer == LowerSolution ->
                    write('Correct! You unlocked hidden resources.'), nl;
                    write('Incorrect! '), write('Correct answer: '), write(Solution), nl
            ); true
            ),
            advance_step,
            (CurrentStep == 6 -> 
                start, nl, !;
                make_choice)
         ;
            write('Wrong choice! Go back to step 1.'), nl, retractall(current_step(_)), asserta(current_step(1)), fail
        )
    ;
        write('Invalid choice! Restart.'), nl, retractall(current_step(_)), asserta(current_step(1)), fail
    ).


start :-
    current_step(6),
    provide_story_details,
    write('Congratulations! You have successfully returned home.'), nl.

end :-
    current_step(1),
    provide_story_details.

advance_step :-
    current_step(CurrentStep),
    retract(current_step(CurrentStep)),
    NextStep is CurrentStep + 1,
    asserta(current_step(NextStep)).

start_game :-
    write('Welcome to the Adventure of Robinson Crusoe! Robinson Crusoe, a young Englishman, decides to defy his father''s will and sets out on a sea voyage against his advice.'),nl,  
    write('In this game, you will be Robinson and must make the right decisions to save yourself.'), nl,
        repeat,
        make_choice,
        (start, nl;
        end, nl).


:- dynamic provide_story_details/0.
provide_story_details :-
    current_step(CurrentStep),
    story_detail(CurrentStep, _, Description),
    write(Description), nl.

% Run the game
start_game.