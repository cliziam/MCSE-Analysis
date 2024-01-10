% Stato iniziale del gioco
:- dynamic current_step/1.
current_step(1).

% Definizione dei passi della storia
step(1, "Naufragio").
step(2, "Sopravvivenza").
step(3, "Costruzione di un rifugio").
step(4, "Incontro con Venerdi'").
step(5, "Fuga dall'isola").
step(6, "Ritorno in Patria").

% Dettagli aggiuntivi per un'esperienza piu' coinvolgente
story_detail(1, "Naufragio", "Durante il viaggio, la tua nave viene colpita da una tempesta e naufraga su un''isola deserta. Sei l'unico superstite. La spiaggia e' il tuo unico rifugio, circondato da una giungla densa e pericoli sconosciuti.").
story_detail(2, "Sopravvivenza", "Per sopravvivere, devi prendere decisioni cruciali. L'isola e' piena di fauna selvatica, e devi scegliere saggiamente tra cacciare per il cibo o tentare di costruire una barca di fortuna per esplorare altre parti dell'isola.").
story_detail(3, "Costruzione di un rifugio", "Mentre ti insedi, gli elementi diventano una sfida. Costruire una capanna robusta ti protegge dalle intemperie, ma costruire un dispositivo di segnalazione potrebbe attirare navi in transito per il soccorso.").
story_detail(4, "Incontro con Venerdi'", "Un giorno, incontri un nativo di nome Venerdi'. La tua scelta di insegnargli le tue abilita' di sopravvivenza o procedere da solo avra' un impatto significativo sul tuo viaggio.").
story_detail(5, "Fuga dall'isola", "E' giunto il momento di fuggire. Cercherai aiuto da una nave in transito o prenderai in mano la situazione costruendo una zattera? Le scelte che fai determineranno il tuo destino.").
story_detail(6, "Ritorno in Patria", "Se riesci a sopravvivere e fuggire, il viaggio non finisce qui.").

% Definizione delle scelte con le loro conseguenze
choices(1, ["Resta sulla spiaggia e costruisci un rifugio temporaneo", "Esplora l'interno dell'isola"]).
choices(2, ["Caccia per il cibo", "Prova a costruire una barca usando legno alla deriva e liane"]).
choices(3, ["Costruisci una capanna robusta", "Costruisci un dispositivo di segnalazione"]).
choices(4, ["Insegna a Venerdi' le tue abilita' di sopravvivenza", "Evita Venerdi' e continua da solo"]).
choices(5, ["Cerca aiuto da una nave in transito", "Costruisci una zattera per fuggire"]).
choices(6, ["Rimani sull'isola con Venerdi'", "Ritorna in Inghilterra via nave"]).

% Regole per gestire le conseguenze delle scelte
consequence(1, "Resta sulla spiaggia e costruisci un rifugio temporaneo", "Hai scelto di restare sulla spiaggia e costruire un rifugio temporaneo. La tua resistenza ai pericoli aumenta, ma la fuga sara' piu' difficile.").
consequence(1, "Esplora l'interno dell'isola", "Hai scelto di esplorare l'interno dell'isola. Trovi risorse preziose ma affronti anche pericoli. Prosegui con il prossimo passo.").
consequence(2, "Caccia per il cibo", "Hai scelto di cacciare per il cibo. Ottieni cibo sufficiente per sopravvivere. Prosegui con il prossimo passo.").
consequence(2, "Prova a costruire una barca usando legno alla deriva e liane", "Hai scelto di provare a costruire una barca. Con determinazione, hai costruito con successo una barca robusta. Prosegui con il prossimo passo.").
consequence(3, "Costruisci una capanna robusta", "Hai costruito una capanna robusta per proteggerti. Prosegui con il prossimo passo.").
consequence(3, "Costruisci un dispositivo di segnalazione", "Hai costruito un dispositivo di segnalazione per attirare navi in transito. Questo pero' ha attirato l'attenzione di predatori.").
consequence(4, "Insegna a Venerdi' le tue abilita' di sopravvivenza", "Hai insegnato a Venerdi' le tue abilita' di sopravvivenza. Venerdi' diventa un prezioso alleato, e insieme affrontate le sfide dell'isola. Prosegui con il prossimo passo.").
consequence(4, "Evita Venerdi' e continua da solo", "Hai scelto di evitare Venerdi'. Il viaggio e' piu' solitario e impegnativo.").
consequence(5, "Cerca aiuto da una nave in transito", "Hai cercato aiuto da una nave in transito. La nave conteneva ammutinati che vogliono abbandonare a riva il comandante. Ottima scelta!").
consequence(5, "Costruisci una zattera per fuggire", "Hai costruito una robusta zattera, ma non abbasttanza da permettert di fuggire").
consequence(6, "Rimani sull'isola con Venerdi'", "Hai scelto di rimanere sull'isola con Venerdi'. Insieme, costruite una nuova vita lontano dalla civilta'. Scelta errata").
consequence(6, "Ritorna in Inghilterra via nave", "Hai deciso di tornare in Inghilterra via nave. Congratulazioni, sei tornato a casa con successo!").

% Predicato per verificare la validita' della scelta
valid_choice(1, "Esplora l'interno dell'isola").
valid_choice(2, "Caccia per il cibo").
valid_choice(3, "Costruisci una capanna robusta").
valid_choice(4, "Insegna a Venerdi' le tue abilita' di sopravvivenza").
valid_choice(5, "Cerca aiuto da una nave in transito").
valid_choice(6, "Ritorna in Inghilterra via nave").


% Predicato per gestire la scelta dell'utente e le conseguenze
:- discontiguous start_game/0.
make_choice :-
    provide_story_details,
    current_step(CurrentStep),
    choices(CurrentStep, Options),
    write('Scegli una opzione tra le seguenti inserendo 1 o 2: '), write(Options), nl,
    read(UserInput),
    (integer(UserInput), nth1(UserInput, Options, UserChoice) ->
        consequence(CurrentStep, UserChoice, Consequence),
        write('Hai scelto: '), write(UserChoice), nl,
        write(Consequence), nl,
        (valid_choice(CurrentStep, UserChoice) ->
            advance_step,
            (start -> write('Congratulazioni! Hai vinto.'), nl, !;
             end -> write('Mi dispiace, hai perso.'), nl, !);
         write('Scelta errata! Torna al passo 1.'), nl, retractall(current_step(_)), asserta(current_step(1)), fail);
        write('Scelta non valida! Ricomincia.'), nl, retractall(current_step(_)), asserta(current_step(1)), fail
    ).

% Predicato per aggiungere piu' dettagli alla condizione di vittoria
start :-
    current_step(6),
    provide_story_details.

% Predicato per aggiungere piu' dettagli alla condizione di sconfitta
end :-
    current_step(1),
    provide_story_details.

% Predicato per avanzare al passo successivo
advance_step :-
    current_step(CurrentStep),
    retract(current_step(CurrentStep)),
    NextStep is CurrentStep + 1,
    asserta(current_step(NextStep)).



% Predicato per avviare il gioco
start_game :-
    write('Benvenuto nell''Avventura di Robinson Crusoe! Robinson Crusoe, un giovane inglese, decide di sfidare il volere del padre e intraprende un viaggio per mare contro il suo consiglio. In questo gioco sarai Robinson e dovrai prendere le giuste decisioni per salvarti.'), nl,
    repeat,
    make_choice,
    (start -> write('Congratulazioni! Hai vinto.'), nl;
     end -> write('Mi dispiace, hai perso.'), nl).

% Dichiarazione dinamica del predicato provide_story_details/0
:- dynamic provide_story_details/0.
% Predicato per fornire dettagli sulla storia
provide_story_details :-
    current_step(CurrentStep),
    story_detail(CurrentStep, _, Description),
    write(Description), nl.

% Esegui il gioco
start_game.
