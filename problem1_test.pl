:- unload_file('problem1_kb').
:- consult('problem1_kb').

:- open('problem1_test_output.txt', write, Stream), set_output(Stream).

% 01. Ai là mẹ của Prince Charles ?
:-
    write('01. Ai la me cua Prince Charles?\n'),
    mother(Who, 'Prince Charles'),
    writeln(Who).

% 02. Prince Charles đã ly hôn với ai? 
:-
    write('\n02. Prince Charles da ly hon voi ai?\n'),
    divorced('Prince Charles', Who),
    writeln(Who).

% 03. Ai là con trai của Kate Middeton?
:-
    write('\n03. Ai la con trai cua Kate Middeton?\n'),
	forall(
        son(Who, 'Kate Middleton'),
        writef('%w\n', [Who])
    ),
    writeln('').

% 04. Ai là con gái của Prince Phillip ?
:-
    write('\n03. Ai la con gai cua Phillip ?\n'),
	forall(
        daughter(Who, 'Prince Phillip').
        writef('%w\n', [Who])
    ),
    writeln('').

% 05. Princess Anne có những anh chị em nào?
:-
    write('\n05. Princess Anne co nhung anh chi em nao?\n'),
    forall(
        sibling('Princess Anne', Who).
        writef('%w\n', [Who])
    ),
    writeln('').

% 06. Mia Grace có phải là con gái của Mile Tindall không?
:-
    write('\n06. Mia Grace co phai la con gai cua Mile Tindall không?\n'),
    (daughter('Mia Grace Tindall', 'Mike Tindall')
    ->  writeln(true);
        writeln(false)
    ).

% 07. Ai là ông của Isla Phillips ?
:-
    write('\n07. Ai la ong cua Isla Phillips ?\n'),
	grandfather(Who, 'Isla Phillips'),
	writeln(Who).

% 08. Zara Phillips có phải cô/dì của Prince George không?
:-
    write('\n08. Zara Phillips cco phai co/di cua Prince George khong?\n'),
    (aunt('Zara Phillips', 'Prince George')
    ->  writeln(true);
        writeln(false)
    ).
	
% 09. Zara Phillips có đứa cháu gái nào?
:-
    write('\n09. Zara Phillips cco nhung dua chau gai nao?\n'),
    forall(
        niece(Who,'Zara Phillips'),
        writef('%w\n', [Who])
    ),
    writeln('').

% 10.Prince Edward có phải cha của Princess Beatrice không?
:-
    write('\n10. Prince Edward co phai la cha cua Princess Beatrice không?\n'),
    (father('Prince Edward', 'Princess Beatrice')
    ->  writeln(true);
        writeln(false)
    ).

% 11. Prince Edward có phải chú của Prince Beatrice không ?
:-
    write('\n11. Prince Edward co phai la chu cua Prince Beatrice không ?\n'),
    (uncle('Prince Edward', 'Princess Beatrice')
    ->  writeln(true);
        writeln(false)
    ).

% 12. Princess Anne là bà của ai?
:-
    write('\n12. Princess Anne la ba cua ai?\n'),
    forall(
        grandmother('Princess Anne', Who).
        writef('%w\n', [Who])
    ),
    writeln('').

% 13. Kate Middleton có phải chị/em của Prince Harry không?
:-
    write('\n13. Kate Middleton co phai la chi/em Prince Harry không?\n'),
    (sister('Kate Middleton', 'Prince Harry')
    ->  writeln(true);
        writeln(false)
    ).

% 14. Ai là anh/em trai của Prince Harry?
:-
    write('\n14. Ai la anh/em trai cua Prince Harry?\n'),
    forall(
        brother('Prince Harry', Who),
        writef('%w', [Who])
    ),
    writeln('').

% 15. Princess Charlotte có phải là cháu gái của Camilla Parker Bowles không?
:-
    write('\n15. Princess Charlotte co phai la chau gai cua Camilla Parker Bowles không?\n'),
    (granddaughter('Princess Charlotte', 'Camilla Parker Bowles')
    ->  writeln(true);
        writeln(false)
    ).

% 16. Ai là bà của Princess Charlotte?
:-
    write('\n16. Ai la ba` cua Princess Charlotte?\n'),
    forall(
        grandmother(Who, 'Princess Charlotte'),
        writef('%w\n', [Who])
    ),
    writeln('').

% 17. Prince George có phải cháu trai của Prince Charles không?
:-
    write('\n17. Prince George co phai chau trai cua Prince Charles không?\n'),
    (grandson('Prince George', 'Prince Charles'),
    ->  writeln(true);
        writeln(false)
    ).

% 18. Ai là chị/em gái của Isla Phillips?
:-
    write('\n18. Ai la chi/em gai cua Isla Phillips?\n'),
    forall(
        sister('Isla Phillips', Who),
        writef('%w\n', [Who])
    ),
    writeln('').
	
% 19. Ai là chị/em gái của Isla Phillips?
:-
    write('\n18. Ai la chi/em gai cua Isla Phillips?\n'),
    forall(
        sister('Isla Phillips', Who),
        writef('%w\n', [Who])
    ),
    writeln('').
	
% 20. Ai là chồng của Princess Anne?
:-
    write('\n20. Ai la chong cua Princess Anne?\n'),
    forall(
        husband(Who, ‘Princess Anne’).
        writef('%w\n', [Who])
    ),
    writeln('').
	
% 21. Prince Edward là ông của ai?
:-
    write('\n18. Prince Edward la ong cua ai?\n'),
    forall(
        grandfather(‘Prince Edward’, Who),
        writef('%w\n', [Who])
    ),
    writeln('').
	
% 22. Ông bà của Autumn Kelly là ai?
:-
    write('\n18. Ong ba cua Autumn Kelly la ai?\n'),
    forall(
        grandparent(Who, ‘Autumn Kelly’),
        writef('%w\n', [Who])
    ),
    writeln('').

% 23. Những ai chưa có gia đình?
:-
    write('\n23. Nhung ai chua co gia dinh?\n'),
    forall(
        (
            (male(X);female(X)),
            not(married(X, _)),
            not(divorced(X, _))
        ),
        writef('%w\n', [X])
    ),
    writeln('').

% 24. Những bà mẹ nào chưa có con?
:-
    write('\n24. Nhung ba me nao co dung 2 con?\n'),
    forall(
        (
            female(X),
            aggregate_all(count, mother(X, _), Count),
            Count = 2
        ),
        writef('%w\n', [X])
    ),
    writeln('').

% 25. Những cặp vợ chồng nào chưa có con?
:-
    write('\n25. Nhung cap vo chong nao chua co con?\n'),
    forall(
		(
			married(X, Y),
			not(parent(X, _))       
		),
		writef('%w - %w\n', [X, Y])
	),
	writeln('').

	
:- halt.
