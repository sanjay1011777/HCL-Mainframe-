       IDENTIFICATION DIVISION.
       PROGRAM-ID. SALARY01.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-BASIC       PIC 9(7)V99.
       01 WS-HRA         PIC 9(7)V99.
       01 WS-DA          PIC 9(7)V99.
       01 WS-BONUS       PIC 9(7)V99.
       01 WS-GROSS       PIC 9(9)V99.
       01 WS-OUTPUT      PIC Z(9)9.99.

       PROCEDURE DIVISION.
           DISPLAY "ENTER BASIC SALARY:"
           ACCEPT WS-BASIC

           COMPUTE WS-HRA = WS-BASIC * 0.20
           COMPUTE WS-DA = WS-BASIC * 0.10
           COMPUTE WS-BONUS = WS-BASIC * 0.05

           COMPUTE WS-GROSS =
               WS-BASIC + WS-HRA + WS-DA + WS-BONUS

           MOVE WS-GROSS TO WS-OUTPUT

           DISPLAY "GROSS SALARY: " WS-OUTPUT
           STOP RUN.
