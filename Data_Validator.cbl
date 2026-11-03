       IDENTIFICATION DIVISION.
       PROGRAM-ID. Transaction_validator.
       ENVIRONMENT DIVISION.
           INPUT-OUTPUT SECTION.
           FILE-CONTROL.
           SELECT trans-file ASSIGN TO
            "transactions.txt"
               ORGANIZATION IS LINE SEQUENTIAL
               FILE STATUS IS ws-status.
       DATA DIVISION.
       FILE SECTION.
       FD trans-file.
       01 trans-record PIC x(100).
       WORKING-STORAGE SECTION.
           01 ws-status PIC X(2).
           01 amount PIC x(8).
           01 account_id PIC X(10).
           01 trans_type PIC x(2).
           01 ws-length PIC 9(2).
           01 eof PIC X VALUE 'N'.
           01 invalid_records PIC 9(2) VALUE 0.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           OPEN INPUT trans-file
           IF ws-status NOT='00'
               DISPLAY "unable to open the file . Access Denied"
               STOP RUN
           END-IF
           PERFORM UNTIL eof='Y'
                   READ trans-file
                       AT END
                           MOVE 'Y' to eof
                       NOT AT END
                           PERFORM validate-record
                   END-READ
           END-PERFORM

           CLOSE trans-file
           DISPLAY "invalid records Count:" invalid_records
           STOP RUN.
       validate-record.
           MOVE FUNCTION LENGTH(FUNCTION TRIM(trans-record TRAILING))
               TO ws-length
           IF ws-length NOT= 20
               ADD 1 to invalid_records
           ELSE
               IF trans-record(11:8) IS NOT NUMERIC
                   ADD 1 to invalid_records
               ELSE
                   IF trans-record(19:2) IS NOT="CR" AND
                       trans-record(19:2) IS
                       NOT="DB"
                       ADD 1 to invalid_records
                   ELSE
                       DISPLAY "Account ID:"trans-record(1:10)
                       DISPLAY "Amount:"trans-record(11:8)
                       DISPLAY "Transaction Type:"trans-record(19:2)
                   END-IF
                END-IF
           END-IF.
