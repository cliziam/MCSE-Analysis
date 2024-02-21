% Elenco degli steps inviduati nel racconto
step(1, "Escape, sea voyage").
step(2, "Captured by a Turkish pirate, imprisoned").
step(3, "Prosperity in Brazil, purchase of plantations").
step(4, "Shipwreck on a Desert Island").
step(5, "Lonely Life, Survival Skills").
step(6, "The discovery of the cannibals").
step(7, "Meeting Friday").
step(8, "Failed departure attempt with a small boat").
step(9, "Escape from the island").
step(10, "Return to my homeland").
step(11, "The end.").


% Descrizione della storia di Robinson Crusoe
story_detail(1, "Escape, sea voyage", "At the age of 19, I decided to leave the house in search of sea adventures.").
story_detail(2, "Captured by a Turkish pirate, imprisonment", "After an initial shipwreck, I was captured by a Turkish pirate.").
story_detail(3, "Prosperity in Brazil, buying plantations", "In Brazil, I bought a plantation and prospered as a farmer.").
story_detail(4, "Shipwreck on a Desert Island", "While traveling to Guinea to purchase slaves for the company, the ship was wrecked on a desert island.").
story_detail(5, "Solitary life, survival skills", "I began a solitary life, building a hut, cultivating the land, raising animals and learning to cook with the island's limited resources.").
story_detail(6, "The discovery of the cannibals", "After many years, I discovered the presence of cannibals on the island.").
story_detail(7, "Meeting Friday", "Friday and I became friends, after many years in solitude finally I wasn't").
story_detail(8, "Failed attempt to leave with a small boat", "I wanted to leave the island with a small boat, but its size was not sufficient to cross the sea.").
story_detail(9, "Escape from the island", "Finally, I manage to have a ship sufficient enough to make the journey and return home.").
story_detail(10, "Return to my homeland", "Back in London, I discovered that I had become rich thanks to the proceeds of the plantation in Brazil.").

% Scelte che l'utente può fare
choices(1, ["Board the ship to begin the journey", "Stay at home and give up the adventure"]).
choices(2, ["Accept your fate as a prisoner", "Try to escape from prison"]).
choices(3, ["Invest your earnings in new business ventures", "Live a peaceful life with your plantation"]).
choices(4, ["Explore the island for resources", "Try to build a boat to leave the island"]).
choices(5, [ "Explore the interior of the island for new discoveries", "Continue improving your cabin and survival skills"]).
choices(6, ["Establish contact with cannibals", "Keep your distance and try to avoid cannibals"]).
choices(7, ["Teach Friday your customs and habits", "Let Friday follow his traditions"]).
choices(8, ["Give up the idea of leaving the island", "Continue improving your little boat"]).
choices(9, ["Prepare a strategy to return to homeland", "Stay on the island"]).
choices(10, ["Embrace your newfound wealth and enjoy life in London", "Promise yourself to live new adventures"]).

% Scelte corrette che consentono il proseguimento della storia
valid_choice(1, "Board the ship to begin the journey" ).
valid_choice(2, "Try to escape from prison").
valid_choice(3, "Invest your earnings in new business ventures").
valid_choice(4, "Explore the island for resources").
valid_choice(5, "Continue improving your cabin and survival skills").
valid_choice(6, "Establish contact with cannibals").
valid_choice(7, "Teach Friday your customs and habits").
valid_choice(8, "Continue improving your little boat").
valid_choice(9, "Prepare a strategy to return to homeland").
valid_choice(10, "Promise yourself to live new adventures").

% Per ogni scelta verrà mpostrata una scritta con le conseguenze
consequence(1, "Board the ship to begin the journey" , "Deciding to embark on the adventure, I boarded the ship. The journey into the unknown began.").
consequence(1, "Stay at home and give up the adventure", "Deciding to give up on the adventure, I stayed at home. However, the desire to explore the world always lingered in my heart.").
consequence(2, "Try to escape from prison", "With courage, I attempted to escape from the prison. Through cleverness and determination, I managed to break free, gaining a valuable lesson in survival.").
consequence(2, "Accept your fate as a prisoner", "I accepted my fate and tried to adapt to prisoner life. My thirst for adventure was quelled.").
consequence(3, "Invest your earnings in new business ventures", "I invested my earnings in new ventures. My boldness was rewarded, and the plantation became an even greater success.").
consequence(3, "Live a peaceful life with your plantation", "I chose a quiet life with the plantation. The initial goal I set out for faded away in an instant.").
consequence(4, "Explore the island for resources", "I explored the island in search of resources. I encountered new challenges and opportunities that contributed to my survival.").
consequence(4, "Try to build a boat to leave the island", "I decided to build a boat to leave the island. Lacking enough resources, the boat turned out to be a complete disaster.").
consequence(5, "Continue improving your cabin and survival skills", "I focused my efforts on improving my hut and survival skills. This ensured my comfort and well-being on the island.").
consequence(5, "Explore the interior of the island for new discoveries", "I expanded my explorations. I found new creatures that enriched my experience on the island, but it also exposed me to great dangers.").
consequence(6, "Establish contact with cannibals", "I approached the cannibals with a spirit of peace. I saved a native, Friday, and started a relationship that turned into a friendship and a lesson in cross-cultural understanding.").
consequence(6, "Keep your distance and try to avoid the cannibals", "I chose to avoid the cannibals, trying to stay hidden. This distance maintenance ensured my safety, but I missed an opportunity.").
consequence(7, "Teach Friday your customs and habits", "I decided to teach Friday my customs. Through this teaching, Friday became a loyal companion, and we learned from each other.").
consequence(7, "Let Friday follow his traditions", "I respected Friday's traditions and let him follow his own path. However, this did not help me in trying to escape from the island.").
consequence(8, "Continue improving your little boat", "I persisted in improving the small boat. Despite challenges, I maintained hope of leaving the island.").
consequence(8, "Give up the idea of leaving the island", "I decided to abandon the idea of leaving the island. This choice led to greater acceptance of my current situation without real change.").
consequence(9, "Prepare a strategy to return to homeland", "Deciding to prepare a strategy opens up new hopes for escape.").
consequence(9, "Stay on the island", "Choosing to stay on the island means losing the opportunity to escape.").
consequence(10, "Embrace your newfound wealth and enjoy life in London", "Back in London, you embrace your newfound wealth with gratitude. Enjoy a comfortable and quiet life, but this dampens your adventurous spirit.").
consequence(10, "Promise yourself to live new adventures", "Deciding to live new adventures, you continue your quest for knowledge and adventure. The future unfolds before you with endless possibilities. Congratulations! You have completed the game.").

% Puzzle da risolvere 
puzzle(3, "The Authenticity of the Story: ", "Is the story based on real events?.", "Yes").
puzzle(7, "Answer Friday's questions: ", "Friday poses questions about your life on the island. Reflect on the most challenging aspect of your early days in solitude and how you overcame it. The answer is a single word", "faith").
puzzle(5, "The Famous Parrot: ", "In the story, what is the name of the famous parrot that accompanies the protagonist on the deserted island?", "poll").
% oggetti 
puzzle_object(3, map).
puzzle_object(5, knife).


% discotiguos è utile per fare caoire che start_game potrebbe essere definito in modo non contiguo nel codice
:- discontiguous start_game/0.


% dynamic serve per dire che ha una dichiarazione dinamica e varia durante l'esecuzione del programma
:- dynamic current_step/1.
:- dynamic inventory/1.
inventory([]).
current_step(1).

% Inizializza lo stato del gioco
start_game :-
    write('Welcome to the Adventure of Robinson Crusoe!'), nl, 
    write('Robinson Crusoe, a young Englishman, decides to defy his father''s will and sets out on a sea voyage against his advice.'), nl,  
    write('In this game, you will be Robinson and must make the right decisions to save yourself.'), nl,
    write(' '), nl, 
    retractall(current_step(_)),
    asserta(current_step(1)),
    retractall(inventory(_)),
    asserta(inventory([])),
    make_choice.


% Logica principale per la gestione delle scelte
make_choice :-
    repeat,
    display_current_step,
    display_options,
    read_user_input(UserInput),
    process_user_input(UserInput),
    check_game_completion,
    (current_step(11) ; fail). % Gestione di uscita dal gioco


% Visualizza lo stato corrente
display_current_step :-
    current_step(CurrentStep),
    story_detail(CurrentStep, StepName, StepDescription),
    write('Current Step: '), write(CurrentStep), write(' - '), write(StepName), nl,
    write('Description: '), write(StepDescription), nl.


% Visualizza le opzioni disponibili
display_options :-
    current_step(CurrentStep),
    choices(CurrentStep, Options),
    write('Choose an option by entering the corresponding number: '), write(Options), nl.

% Legge l'input dell'utente
read_user_input(UserInput) :-
    read(UserInput).

% Processa l'input dell'utente
process_user_input(UserInput) :-
    current_step(CurrentStep),
    choices(CurrentStep, Options),
    (integer(UserInput), nth1(UserInput, Options, UserChoice) ->
        process_choice(CurrentStep, UserChoice)
    ;
        write('Invalid input! Choose a valid option.'), nl
    ).

% per fare vedere le opzioni
display_options_and_continue :-
    write('Choose your next step:'), nl,
    write(" "), nl,
    advance_step.

% gestisce gli steps successivi
advance_step :-
    current_step(CurrentStep),
    (inventory_contains(bible) ->
        (CurrentStep =< 8 -> NextStep is 9 ; NextStep is CurrentStep + 1)
    ;
        NextStep is CurrentStep + 1
    ),
    retractall(current_step(_)),
    asserta(current_step(NextStep)).



% Process the user's choice
process_choice(CurrentStep, UserChoice) :-
    consequence(CurrentStep, UserChoice, Consequence),
    write(Consequence), nl,
    (valid_choice(CurrentStep, UserChoice) ->
        (puzzle(CurrentStep, PuzzlePrompt, Feedback, Solution) ->
            write('----------------------------------------------------------------------------- '), nl,
            write('         ALT!! Put yourself to the test! (write the answer in lowercase):     '), nl,
            write(PuzzlePrompt),nl, 
            write('----------------------------------------------------------------------------- '), nl,
            write(Feedback), nl,
            check_puzzle_answer(Solution),
            display_inventory_progress,
            check_inventory_progress,
            display_options_and_continue
        ;
            display_inventory_progress,
            check_inventory_progress,
            display_options_and_continue
        )
    ;
        write('------------------------Invalid choice! Go back one step.------------------------------'), nl, 
        write(''), nl, 
        back_game
    ).

ask(Prompt, Answer) :-
    write(Prompt),
    flush_output(current_output), 
    get_char(_),
    read_line_to_string(user_input, Answer). 

% Check if the puzzle answer is correct
check_puzzle_answer(Solution) :-
    puzzle_prompt(Prompt),
    ask(Prompt, UserAnswer),
    string_lower(Solution, LowerSolution),
    string_lower(UserAnswer, LowerUserAnswer),
    response_answer(LowerUserAnswer, LowerSolution).

% Define the puzzle prompt based on the puzzle ID
puzzle_prompt(Prompt) :-
    current_step(CurrentStep),
    puzzle(CurrentStep, Prompt, _, _).

response_answer(Response, Solution) :-
    (Response == Solution ->
        write('Correct! You unlocked something!'), nl,
        (current_step(CurrentStep), CurrentStep \== 3, CurrentStep \== 5 ->
            add_to_inventory(puzzle_piece) 
        ; 
            true
        ),
        (current_step(CurrentStep), CurrentStep == 3 -> 
            add_to_inventory(map),
            interact_with_map
        ; 
            true
        ),
        (current_step(CurrentStep), CurrentStep == 5 -> 
            add_to_inventory(knife),
            interact_with_knife
        ; 
            true
        )
    ;
        write('Incorrect! The provided answer was not correct.'), nl
    ).

% Controlla se il gioco è completato
check_game_completion :-
    current_step(11),
    write('Thank you for playing the Adventure of Robinson Crusoe! Feel free to play again and explore different paths in the story.'), nl, !.


% se le risposte dei puzzle sono corretti allora aggiunge un elemento all'inventario
add_to_inventory(Item) :-
    inventory(Inventory),
    append(Inventory, [Item], NewInventory),
    retractall(inventory(_)),
    asserta(inventory(NewInventory)).


% Verifica se un elemento è presente nell'inventario
inventory_contains(Item) :-
    inventory(Inventory),
    member(Item, Inventory).


display_inventory_progress :-
    inventory(Inventory),
    length(Inventory, Pieces),
    write(' '), nl,
    write('Inventory Progress: '), write(Pieces), write('/2 pieces collected.'), nl.
    
:- dynamic special_item_unlocked/0.

check_inventory_progress :-
    inventory(Inventory),
    length(Inventory, Pieces),
    (Pieces >= 2, \+ special_item_unlocked -> 
        asserta(special_item_unlocked), 
        write('Congratulations! You have gathered enough puzzle pieces to unlock a special item.'), nl,
        unlock_special_item
    ;
        true
    ).

% sblocca la bibbia
unlock_special_item :-
    write('------------------------------------------------------------------------------------------------------'), nl,
    write('                                          You unlocked the Bible!                                      '), nl,
    write('                    You decide to consult the Bible for guidance on your journey.                      '), nl,
    write('               With newfound wisdom, you skip ahead to step 9: Escape from the island'                  ), nl,
    write('-------------------------------------------------------------------------------------------------------'), nl,
    add_to_inventory(bible).


% torna indietro
back_game :-
    current_step(CurrentStep),
    (CurrentStep > 1 ->
        NewStep is CurrentStep - 1,
        retractall(current_step(_)),
        asserta(current_step(NewStep))
    ;
        true
    ),
    retractall(inventory(_)),
    asserta(inventory([])).



adventure_for_object(map) :-
    write('As you study the map, you notice some peculiar markings that seem to lead to a hidden cave.'), nl,
    write('You decide to explore this cave, hoping to uncover its secrets.'), nl,
    explore_cave.

adventure_for_object(knife) :-
    write(-----------------------------------------------------------------------), nl, 
    write('      ______________________________ ______________________'), nl,
    write('    .\'                              | (_)     (_)    (_)   \\'), nl,
    write('  .\'                                |  __________________   |'), nl,
    write('._\'.............................____|_(                  )_/'), nl,
    write('                                                                    '), nl,
    write('------------------------------------------------------------------------'), nl,
    write('While exploring the dense vegetation, you come across a makeshift shelter.'), nl,
    write('Inside, you find a rusty knife hidden among some old belongings.'), nl,
    write('You carefully retrieve the knife, knowing it will be useful for various tasks on the island.'),nl,
    write('                                                                    ').

explore_cave :-
    write('You cautiously enter the dark cave, your heart pounding with excitement.'), nl,
    write('As you delve deeper, you stumble upon an ancient chest hidden in a crevice.'), nl,
    write('Do you open the chest? (yes/no) '), nl,
    flush_output(current_output), 
    read_line_to_string(user_input, Answer),
    string_lower(Answer, LowerInput),
    process_chest_choice(LowerInput).

process_chest_choice("yes") :-
    write('You cautiously open the chest and find a dusty journal inside.'), nl,
    write('The journal appears to belong to a previous inhabitant of the island.'), nl,
    surprise_event_after_chest.

process_chest_choice("no") :-
    write('You decide to leave the chest undisturbed, fearing what secrets it may hold.').

surprise_event_after_chest :-
    random(1, 3, Surprise),
    (Surprise =:= 1 ->
        positive_surprise 
    ;
        negative_surprise 
    ).

positive_surprise :-
    write('-----------------------------------WOWWWW!!!!--------------------------------------------------'), nl,
    write('Suddenly, you stumble upon a hidden chamber filled with valuable treasures!'), nl,
    write('Your eyes widen in amazement as you gather the treasures.'), nl,
    write('You advance two steps in the story.'), nl,
    advance_step.
    
negative_surprise :-
    write('-----------------------------------HELP!!!!--------------------------------------------------'), nl,
    write('Without warning, the ground beneath your feet gives way, and you fall into a pit!'), nl,
    write('You are left bruised and shaken, but fortunately, you manage to climb out of the pit.'), nl,
    write('-------------------------------------Go back one step-----------------------------------------'), nl,
    write('----------------------------------------------------------------------------------------------'), nl,
    back_game. 

interact_with_map :-
    inventory_contains(map), 
    adventure_for_object(map).

interact_with_knife :-
    inventory_contains(knife),
    adventure_for_object(knife).
