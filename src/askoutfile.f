C------------------------------------------------------------------------------
C Copyright 2008 Nicolas Cardiel
C
C This file is part of BoundFit.
C 
C BoundFit is free software: you can redistribute it and/or modify
C it under the terms of the GNU General Public License as published by
C the Free Software Foundation, either version 3 of the License, or
C (at your option) any later version.
C 
C BoundFit is distributed in the hope that it will be useful,
C but WITHOUT ANY WARRANTY; without even the implied warranty of
C MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
C GNU General Public License for more details.
C 
C You should have received a copy of the GNU General Public License
C along with BoundFit. If not, see <http://www.gnu.org/licenses/>.
C------------------------------------------------------------------------------
        SUBROUTINE ASKOUTFILE(OUTFILE)
        IMPLICIT NONE
        CHARACTER*(*) OUTFILE
C
        INTEGER TRUEBEG
        INTEGER TRUELEN
        CHARACTER*255 READC_B
C
        INTEGER L1,L2
        LOGICAL LECHO
        LOGICAL LOGFILE
C
        COMMON/BLKLECHO/LECHO
C------------------------------------------------------------------------------
        LOGFILE=.TRUE.
        DO WHILE(LOGFILE)
          WRITE(*,100) 'Output ASCII file name......................'
          OUTFILE=READC_B('@','@')
          IF(LECHO)THEN
            L1=TRUEBEG(OUTFILE)
            L2=TRUELEN(OUTFILE)
            WRITE(*,101) OUTFILE(L1:L2)
          END IF
          INQUIRE(FILE=OUTFILE,EXIST=LOGFILE)
          IF(LOGFILE)THEN
            WRITE(*,101) 'ERROR: this file already exist. Try again.'
            WRITE(*,100) 'Press <CR> to continue...'
            READ(*,*)
          END IF
        END DO
C
100     FORMAT(A,$)
101     FORMAT(A)
        END
