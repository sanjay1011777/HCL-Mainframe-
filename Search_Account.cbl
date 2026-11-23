       IDENTIFICATION DIVISION.
       PROGRAM-ID. ACCTSRCH.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-ACCOUNTS.
          05 WS-ACCOUNT PIC X(5) OCCURS 5 TIMES.

       01 WS-SEARCH-ID PIC X(5).
       01 WS-I         PIC 9.
       01 WS-FOUND     PIC X VALUE "N".

       PROCEDURE DIVISION.
           MOVE "10001" TO WS-ACCOUNT(1)
           MOVE "10002" TO WS-ACCOUNT(2)
           MOVE "10003" TO WS-ACCOUNT(3)
           MOVE "10004" TO WS-ACCOUNT(4)
           MOVE "10005" TO WS-ACCOUNT(5)

           DISPLAY "ENTER ACCOUNT ID:"
           ACCEPT WS-SEARCH-ID

           PERFORM VARYING WS-I FROM 1 BY 1
               UNTIL WS-I > 5
               IF WS-ACCOUNT(WS-I) = WS-SEARCH-ID
                   MOVE "Y" TO WS-FOUND
                   EXIT PERFORM
               END-IF
           END-PERFORM

           IF WS-FOUND = "Y"
               DISPLAY "ACCOUNT FOUND"
           ELSE
               DISPLAY "ACCOUNT NOT FOUND"
           END-IF

           STOP RUN.
