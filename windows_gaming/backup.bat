REM Mirror copies everything from google drive to external drive
REM Does not delete from external. If you want to mirror exactly
REM (include removals) change /E to /MIR
robocopy "C:\Users\james\google_drive" "E:\google_drive" /E

echo %date% %time% >> "C:\Users\james\google_drive\backup.log"
