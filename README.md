# MapPerformance

Compare insert and access perforamce of Maps and HashDicts.

tl;dr

Timings in µs on my MacBook Air:

!assets/graph.png!

(remember—graphs have logrithmic Y axes—the actual difference is _significant_)

```
Insertion into Elixir.Map. 10 entries
-------------------------------------

Range:   from 3 to 3617µs
Median:  6µs
Average: 366.6µs


Insertion into Elixir.Map. 100 entries
--------------------------------------

Range:   from 41 to 256µs
Median:  123µs
Average: 113.4µs


Insertion into Elixir.Map. 1000 entries
---------------------------------------

Range:   from 2801 to 4790µs
Median:  4281µs
Average: 3728.1µs


Insertion into Elixir.Map. 10000 entries
----------------------------------------

Range:   from 341559 to 380483µs
Median:  360981µs
Average: 357136.0µs


Insertion into Elixir.HashDict. 10 entries
------------------------------------------

Range:   from 4 to 4218µs
Median:  4µs
Average: 426.2µs


Insertion into Elixir.HashDict. 100 entries
-------------------------------------------

Range:   from 40 to 52µs
Median:  41µs
Average: 42.3µs


Insertion into Elixir.HashDict. 1000 entries
--------------------------------------------

Range:   from 494 to 677µs
Median:  525µs
Average: 541.9µs


Insertion into Elixir.HashDict. 10000 entries
---------------------------------------------

Range:   from 6987 to 12655µs
Median:  9659µs
Average: 9471.4µs




Access into Elixir.Map. 10 entries
----------------------------------

Range:   from 5 to 1413µs
Median:  7µs
Average: 21.91µs


Access into Elixir.Map. 100 entries
-----------------------------------

Range:   from 33 to 129µs
Median:  34µs
Average: 37.74µs


Access into Elixir.Map. 1000 entries
------------------------------------

Range:   from 561 to 1907µs
Median:  694µs
Average: 771.69µs


Access into Elixir.Map. 10000 entries
-------------------------------------

Range:   from 35462 to 50259µs
Median:  38147µs
Average: 38925.61µs


Access into Elixir.HashDict. 10 entries
---------------------------------------

Range:   from 5 to 25µs
Median:  5µs
Average: 6.57µs


Access into Elixir.HashDict. 100 entries
----------------------------------------

Range:   from 39 to 95µs
Median:  40µs
Average: 41.49µs


Access into Elixir.HashDict. 1000 entries
-----------------------------------------

Range:   from 361 to 845µs
Median:  430µs
Average: 454.03µs


Access into Elixir.HashDict. 10000 entries
------------------------------------------

Range:   from 4214 to 7640µs
Median:  4583µs
Average: 4954.37µs


```
