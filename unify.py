function unify(E1, E2);
    begin
        case
            both E1 and E2 are constants or the empty list:
                if E1 = E2 then return {}
                else return FAIL;
            E1 is a variable:
                if E1 occurs in E2 then return FAIL
                 else return {E2/E1}
            E2 is a variable
                if E2 occurs in E1 then FAIL
                    else return {E1/E2}
            either E1 or E2 are empty then return FAIL
            otherwise:
                begin
                    HE1 := first element of E1;
                    HE2 := first element of E2;
                    SUBS1 := unify(HE1, HE2);
                    if SUBS1 := FAIL then return FAIL;
                    TE1 := apply(SUBS1, rest of E1);
                    TE2 := apply(SUBS1, rest of E2);
                    SUBS2 := unify(TE1, TE2);
                    if SUBS2 = FAIL then return FAIL;
                         else return composition(SUBS1, SUBS2)
                end
            end
        end