% Fatti dinamici
:- dynamic stato/2.

% Fatti
posizione(isola).
stato(robinson, sveglio).
stato(robinson, affamato).
stato(robinson, assetato).
stato(robinson, freddo).
stato(fuoco, spento).
stato(robinson, legna(0)).


% Regole
avventura :-
    write('Benvenuto in Robinson Crusoe: Avventura sull\'isola!'), nl,
    write('Sei appena naufragato su un\'isola deserta. Cerca di sopravvivere!'), nl,
    write('Ti svegli sulla spiaggia di un\'isola deserta.'), nl,
    write('Cosa vuoi fare?'), nl,
    write('1. Esplora l\'isola'), nl,
    write('2. Cerca cibo'), nl,
    write('3. Accendi il fuoco'), nl,
    write('4. Cerca acqua'), nl,
    write('5. Esci dall\'isola'), nl,
    write('6. Costruisci casa'), nl,
    write('7. Trova legna'), nl, 

    inizia_avventura.

inizia_avventura :-
    leggi_scelta(Scelta),
    esegui_scelta(Scelta).

leggi_scelta(Scelta) :-
    write('Inserisci il numero: '),
    read(Scelta).

esegui_scelta(Scelta) :-
    Scelta = 1,
    esplora_isola.
esegui_scelta(Scelta) :-
    Scelta = 2,
    cerca_cibo.
esegui_scelta(Scelta) :-
    Scelta = 3,
    accendi_fuoco.
esegui_scelta(Scelta) :-
    Scelta = 4,
    cerca_acqua.
esegui_scelta(Scelta) :-
    Scelta = 5,
    esci_dall_isola.

esegui_scelta(Scelta) :-
    Scelta = 6,
    stato(robinson, legna(Legna)),
    Legna >= 3,  
    costruisci_casa.

esegui_scelta(Scelta) :-
    Scelta = 7,
    trova_legna.

esegui_scelta(_) :-
    write('Scelta non valida. Riprova.'), nl,
    inizia_avventura.

esplora_isola :-
    posizione(isola),
    write('Esplori l\'isola e scopri nuovi luoghi.'), nl,
    % Aggiungi altre azioni di esplorazione qui
    inizia_avventura.

cerca_cibo :-
    stato(robinson, affamato),
    write('Cerchi cibo.'), nl,
    % Logica di ricerca di cibo (esempio: cibo trovato)
    write('Hai trovato delle bacche commestibili!'), nl,
    modifica_stato(robinson, affamato, sazio),  % Modifica lo stato da affamato a sazio
    inizia_avventura.
cerca_cibo :-
    write('Non hai fame al momento.'), nl,
    inizia_avventura.

accendi_fuoco :-
    stato(fuoco, spento),
    write('Accendi il fuoco per scaldarti.'), nl,
    % Logica di accensione del fuoco (esempio: fuoco acceso)
    write('Hai acceso il fuoco. Ti senti piu\' caldo.'), nl,
    modifica_stato(robinson, freddo, caldo),  % Modifica lo stato da freddo a caldo
    modifica_stato(fuoco, spento, acceso),  % Modifica lo stato da spento a acceso
    inizia_avventura.
accendi_fuoco :-
    write('Il fuoco e\' gia\' acceso.'), nl,
    inizia_avventura.

cerca_acqua :-
    stato(robinson, assetato),
    write('Cerchi acqua potabile.'), nl,
    % Logica di ricerca di acqua (esempio: acqua trovata)
    write('Hai trovato una sorgente d\'acqua potabile!'), nl,
    modifica_stato(robinson, assetato, idratato),  % Modifica lo stato da assetato a idratato
    inizia_avventura.
cerca_acqua :-
    write('Non hai sete al momento.'), nl,
    inizia_avventura.

esci_dall_isola :-
    write('Decidi di costruire una zattera e lasciare l\'isola.'), nl,
    % Logica di costruzione della zattera (esempio: zattera costruita)
    write('Congratulazioni, hai completato l\'avventura!'), nl,
    halt.

% Aggiunta di una regola generica per la modifica dello stato
modifica_stato(Soggetto, VecchioStato, NuovoStato) :-
    retract(stato(Soggetto, VecchioStato)),
    asserta(stato(Soggetto, NuovoStato)).


trova_legna :-
    write('Cerchi legna per il fuoco e per eventuali costruzioni.'), nl,
    % Logica di ricerca di legna (esempio: legna trovata)
    write('Hai trovato della legna! Ora puoi usarla per accendere il fuoco o costruire qualcosa.'), nl,
    % Incrementa la quantità di legna disponibile
    modifica_stato(robinson, legna(QuantitaLegna), legna(NuovaQuantita)),
    NuovaQuantita is QuantitaLegna + 1,
    inizia_avventura.

costruisci_casa :-
    stato(robinson, legna(QuantitaLegna)),
    QuantitaLegna >= 3,  % Verifica se hai abbastanza legna per costruire una casa
    write('Decidi di costruire una casa per proteggerti dal freddo e dormire al sicuro.'), nl,
    % Logica di costruzione della casa (esempio: casa costruita)
    write('Hai costruito una casa! Ora hai un riparo sicuro.'), nl,
    modifica_stato(robinson, freddo, al_caldo),  % Modifica lo stato da freddo a al_caldo
    % Decrementa la quantità di legna disponibile
    NuovaQuantitaLegna is QuantitaLegna - 3,  % Ad esempio, si necessitano 3 pezzi di legna per costruire una casa
    modifica_stato(robinson, legna(QuantitaLegna), legna(NuovaQuantitaLegna)),
    inizia_avventura.

% Esegui il gioco
:- avventura.
