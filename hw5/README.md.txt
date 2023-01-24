Write a collection of Prolog rule definitions.

**Submission Guidlines**

Submission via 'cssubmit 35 a 5'. Your file shall be called 
**'myhw5.plog'**. Your file should include your **name**.

**Description:**

Consider the following set of Prolog facts:

male(bart). % bart is male

male( homer).

male( abe).

male( herbert).

male( krusty).

male( orville).

female( marge). % marge is female

female( lisa).

female( maggie).

female( selma).

female( patty).

female( ling).

female( jacqueline).

female( yuma).

parent( homer, bart). % homer is the parent of bart

parent( homer, maggie).

parent( homer, lisa).

parent( abe, homer).

parent( abe, herbert).

parent( orville, abe).

parent( marge, bart).

parent( marge, maggie).

parent( marge, lisa).

parent( selma, ling).

parent( jacqueline, marge).

parent( jacqueline, selma).

parent( jacqueline, patty).

parent( yuma, abe).

Write a Prolog program that includes the above facts and definitions of the
following Prolog Rules:

● father(X, Y)
True if X is the father of Y.

● mother(X, Y)
True if X is the mother of Y.

● sister(X, Y)
True if X is the sister of Y.

● brother(X, Y)
True if X is the brother of Y.

● uncle(X, Y)
True if X is the uncle of Y.

● aunt(X, Y)
True if X is the aunt of Y.

● grandfather(X, Y)
True if X is the grandfather of Y.

● grandmother(X, Y)
True if X is the grandmother of Y.

● ancestor(X, Y)
True if X is an ancestor of Y.
( X is an ancestor of Y if: X is the parent of Y, or X is the parent of an
ancestor of Y).
● descendant(X, Y)

True if X is a descendant of Y.
( X is a descendant of Y if: Y is the parent of X, or X's parent is a descendant
of Y).
● males(L)

True if L is a list that consists of all male objects.

● lineage(L)

True if, given L = [a 1 , a 2 , a 3 ….a n ], a i+1 is the parent of a i for all 0 <= i < n.
eg. lineage([bart, homer, abe]) should evaluate to true .