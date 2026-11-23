       IDENTIFICATION DIVISION.
       PROGRAM-ID. BANKTRAN.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-BALANCE PIC 9(7)V99.
       01 WS-AMOUNT  PIC 9(7)V99.
       01 WS-TYPE    PIC X.
       01 WS-OUTPUT  PIC Z(7)9.99.

       PROCEDURE DIVISION.
           DISPLAY "ENTER ACCOUNT BALANCE:"
           ACCEPT WS-BALANCE

           DISPLAY "ENTER D FOR DEPOSIT, W FOR WITHDRAWAL:"
           ACCEPT WS-TYPE

           DISPLAY "ENTER TRANSACTION AMOUNT:"
           ACCEPT WS-AMOUNT

           EVALUATE WS-TYPE
               WHEN "D"
                   ADD WS-AMOUNT TO WS-BALANCE
                   DISPLAY "DEPOSIT SUCCESSFUL"

               WHEN "W"
                   IF WS-AMOUNT <= WS-BALANCE
                       SUBTRACT WS-AMOUNT FROM WS-BALANCE
                       DISPLAY "WITHDRAWAL SUCCESSFUL"
                   ELSE
                       DISPLAY "INSUFFICIENT BALANCE"
                   END-IF

               WHEN OTHER
                   DISPLAY "INVALID TRANSACTION TYPE"
           END-EVALUATE

           MOVE WS-BALANCE TO WS-OUTPUT
           DISPLAY "AVAILABLE BALANCE: " WS-OUTPUT

           STOP RUN.
