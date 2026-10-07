% ==========================================
% MED - PRESCRIPTION DRUG INTERACTION
% WARNING SYSTEM
% ==========================================

% -------- MEDICINES --------

medicine(paracetamol).
medicine(aspirin).
medicine(ibuprofen).
medicine(warfarin).
medicine(amoxicillin).
medicine(metformin).

% -------- DRUG INTERACTIONS --------

interacts(warfarin, aspirin).
interacts(warfarin, ibuprofen).
interacts(aspirin, ibuprofen).

% -------- INTERACTION SEVERITY --------

severity(warfarin, aspirin, high).
severity(warfarin, ibuprofen, high).
severity(aspirin, ibuprofen, moderate).

% -------- CHECK INTERACTION --------

drug_interaction(X, Y) :-
    interacts(X, Y).

drug_interaction(X, Y) :-
    interacts(Y, X).

% -------- FIND SEVERITY --------

interaction_severity(X, Y, Level) :-
    severity(X, Y, Level).

interaction_severity(X, Y, Level) :-
    severity(Y, X, Level).

% -------- CHECK DRUGS --------

check_drugs(X, Y, interaction(Level)) :-
    drug_interaction(X, Y),
    interaction_severity(X, Y, Level).

check_drugs(X, Y, safe) :-
    medicine(X),
    medicine(Y),
    \+ drug_interaction(X, Y).

% -------- WARNING --------

warning(X, Y) :-
    check_drugs(X, Y, interaction(Level)),
    write('WARNING: Drug interaction detected!'), nl,
    write('Medicine 1: '), write(X), nl,
    write('Medicine 2: '), write(Y), nl,
    write('Severity: '), write(Level), nl,
    write('Please consult a qualified healthcare professional.'), nl.

% -------- SAFE --------

safe(X, Y) :-
    check_drugs(X, Y, safe),
    write('No known interaction found between '),
    write(X),
    write(' and '),
    write(Y),
    write('.'), nl.