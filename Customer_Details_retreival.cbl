       IDENTIFICATION DIVISION.
       PROGRAM-ID. ACCTINQ.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

           EXEC SQL INCLUDE SQLCA END-EXEC.

       01 WS-ACCOUNT-ID PIC X(5).
       01 WS-NAME       PIC X(30).
       01 WS-BALANCE    PIC S9(9)V99 COMP-3.

       PROCEDURE DIVISION.

           MOVE "10001" TO WS-ACCOUNT-ID

           EXEC SQL
               SELECT CUSTOMER_NAME, BALANCE
               INTO :WS-NAME, :WS-BALANCE
               FROM ACCOUNT_MASTER
               WHERE ACCOUNT_ID = :WS-ACCOUNT-ID
           END-EXEC

           EVALUATE SQLCODE
               WHEN 0
                   DISPLAY "CUSTOMER: " WS-NAME
                   DISPLAY "BALANCE: " WS-BALANCE

               WHEN 100
                   DISPLAY "ACCOUNT NOT FOUND"

               WHEN OTHER
                   DISPLAY "DB2 ERROR: " SQLCODE
           END-EVALUATE

           GOBACK.
