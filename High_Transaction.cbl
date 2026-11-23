       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAXTRAN.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-TABLE.
          05 WS-AMOUNT PIC 9(7)V99 OCCURS 5 TIMES.
       01 WS-I         PIC 9.
       01 WS-MAX       PIC 9(7)V99.
       01 WS-OUTPUT    PIC Z(7)9.99.

       PROCEDURE DIVISION.
           PERFORM VARYING WS-I FROM 1 BY 1
               UNTIL WS-I > 5
               DISPLAY "ENTER TRANSACTION AMOUNT:"
               ACCEPT WS-AMOUNT(WS-I)
           END-PERFORM

           MOVE WS-AMOUNT(1) TO WS-MAX

           PERFORM VARYING WS-I FROM 2 BY 1
               UNTIL WS-I > 5
               IF WS-AMOUNT(WS-I) > WS-MAX
                   MOVE WS-AMOUNT(WS-I) TO WS-MAX
               END-IF
           END-PERFORM

           MOVE WS-MAX TO WS-OUTPUT
           DISPLAY "HIGHEST TRANSACTION: " WS-OUTPUT

           STOP RUN.
