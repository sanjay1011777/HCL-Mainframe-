       IDENTIFICATION DIVISION.
       PROGRAM-ID. Compounded_maturity_value.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
           01 principal PIC 9(6).
           01 rate PIC 9(2).
           01 tenure PIC 9(2).
           01 Maturity_compounded PIC 9(7)V99.
           01 display_format PIC zzzzzz9.99.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "Principal:"
           ACCEPT principal
           DISPLAY "Rate:"
           ACCEPT rate
           DISPLAY "Tenure:"
           ACCEPT tenure
           COMPUTE Maturity_compounded = principal*(1+rate/100)**tenure
           MOVE Maturity_compounded TO display_format
           DISPLAY "Maturity_value:"FUNCTION TRIM(display_format).
