### Projekt zespołowy WYPOK
1. Nazwa zespołu: ADHD

2. Opis Projektu:
 - Aplikacja służąca do wstawiania odnośników.
Daje ona możliwość do oceniania oraz komentowania strony
przez innych użytkowników oraz zwiera ranking stron
na podstawie ocen użytkowników.

3. Skład zespołu oraz wykonane zadania:
 - Monika Beiger: 
   - testowanie działania poprawności aplikacji
    - naprawa ewentualnych błędów również, bądź poinformowanie pozostałych członków zespołu o ewentualnych nieprawidłowościach
    - spolszczenie komunikatów tyczących logowania
    - wzbogacenie strony o elementy graficzne (ikonki)
 - Artur Koliński:
   - pomysł na projekt
    - pomysł na elemnty projetu
    - dodanie emotikonów
    - dodanie spisu emotikonów
    - dodanie działających linków bezpośrednich
    - zarządzanie pracami nad projektem
    - kontroler sprawdzający tekst komentarzy, zamieniający na emotikony
 - Łukasz Mielewczyk:
   - naprawa trudniejszych błędów
    - spolszczenie komunikatów
    - dodanie możliwości sortowania
    - poprawienie funcjonalności hasztagów
    - dodanie miniaturek dodanych linków
    - dodanie wyszukiwarki
    - stworzenie procedury wyliczającą wartość głosów
    - dodanie możliwości pogrubienia, podkreślenia itp. komentarzy
    - dodanie walidacji danych
    - dodanie bazy MongoDB
    - utworzenie możliwości usuwania kaskadowego danych
    - poprawa funcjonalności działania strony
    - poprawa wyglądu strony (styl css)
 - Jarosław Mokrzycki:
   - pomoc przy tworzeniu regexów
    - znalezienie wzoru służącego do wyliczania wartości głosów
    - dodanie hasztagów (wstępnych)
    - spolszczenie hasztagów
    - testowanie hasztagów
    - odpowiedzialność za wygląd pliku README
    - dodanie opisu programu
    - dodanie danych przykładowych
 - Maciej Posłuszny:
   - skrypt seeds.rb tworzący 10 użytkowników, z których każdy tworzy 10 linków na stronie za pomocą gemu Faker
    - infinite scrolling dla linków na stronie głównej oraz komentarzy w szczegółach linku:
      - gem will_paginate
      - gem will_paginate_bootstrap
      - jQuery + AJAX
      - obsługa żądań JavaScript-owych w kontrolerze (links)
    - drobne poprawki wizualne
 - Michał Tyczyński:
   - stworzenie szkieletu aplikacji
    - wygenerowanie potrzebnych modeli (komentarze, linki, użytkownicy)
    - wygenerowanie potrzebnych kontrolerów (komentarze, linki, użytkownicy)
    - dodanie możliwości głosowania (+/-)
    - dodanie wyglądu bootstarpa
    - stworzenie relacji pomiędzy komentarzami, użytkownikami i linkami
    - wygenerowanie możliwości logowania się oraz modyfikacji konta

4. Użycie wzoru do wyliczania wagi głosów (+/-):
http://www.evanmiller.org/how-not-to-sort-by-average-rating.html

5. Informacje:
 
|Wersja Ruby|Wersja Rails|Baza danych|
|---|---|---|
|2.3.0p0|5.0.0.beta3|MongoDB|

