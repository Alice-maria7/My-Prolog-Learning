% --- Facts ---
% All patients have sneezing
sneezing(a).
sneezing(b).

% Some patient has itching (Patient a)
itching(a).

% Some patient does not have fever (Patient b)
no_fever(b).

% --- Rules ---
% Every patient with allergy needs medicine
medicine(X) :-
    patient(X),
    allergy(X).

% Every patient with sneezing has allergy symptoms
allergy(X) :-
    patient(X),
    sneezing(X).

% If a patient has allergy and needs medicine, then they visit a doctor
visits_doctor(X) :-
    patient(X),
    allergy(X),
    medicine(X).

% Defining who is a patient based on the facts provided
patient(a).
patient(b).