!   Project 1: Gaussian Elimination
!   By: Joseph Goergen
!   Class: CS415(Principles of Programming Languages)
!   2-10-18
!
!   This program fetches the number that is going to determain how big the matrix is going to be.
!   Then it takes in an input of a text file named "SIMEQ.DAT" in and puts it into a n x n matrix.
!   It divides by a given row by the matrix at the (row,row) position in the matrix.
!       It then eliminates the numbers under the (row,row) matrix by only using the numbers in (row,n)
!   Then it moves diagonally to the next (row,row) position.
!   It then distributes from the right side over to the corresponding value the subtracts from both sides.
!   Then it writes the result into a file called "SOLV.DAT".
!SIMEQ.DAT ex:
!   2
!   1 -2 -6
!   1 1 8


program Gaussian
    implicit none
    integer number, j, k
    double precision, dimension(120,120) :: matrix
    integer, dimension(:), allocatable :: readArray
    character ch
    open (unit=2, file="SIMEQ.DAT")
    
    read (2,*) number
    allocate(readArray(number+1))
    
    !Reads the line into a temporary array then feeds it into a 2 dimensional array
    do 23 k = 1, number
        read (2,*) readArray
        do 24 j = 1, number+1
            matrix(k,j) = readArray(j)
        24 continue
    23 continue
    
    do 20 k = 1, number-1
        !Loops through and reduces on row k
        call reduce(k)
        do 21 j = k + 1, number
            !Makes everything below row/coloumn k into 0 while following gaussian rules
            call elimination(j, k, matrix(j,k))
        21 continue
    20 continue
    call reduce(number)

    !This loops through the getValueByItself subroutine going from the bottom of the matrix to up
    do 22 k = 1, number - 1
        call getValueByItself(number - k)
    22 continue
    
    5 format(A,A,i7)
    open (unit=2, file="SOLV.DAT")
    !This loops just writes the values in a presentable way
    ! X = n1
    ! Y = n2
    ! Z = n3
    ! A = n4
    do 25 k = 1, number
        if (k < 4)then
            ch = achar(k + 87)
        else
            ch = achar(k + 61)
        end if
        write (2,5) ch,' = ', IDNINT(matrix(k,number+1))
    25 continue
    
    
contains


!This subroutine makes the 'changedRow' in the matrix to 0 with using
! the 'otherRow' in the matrix as the multiplier
subroutine elimination(changedRow, otherRow, value)
    integer changedRow, otherRow, i
    double precision value
    double precision, dimension(120) :: tempMatrix
    
    do 10 i = 1, number+1
        tempMatrix(i) = matrix(otherRow, i) * value
    10 continue
    
    do 11 i = 1, number+1
        matrix(changedRow, i) = matrix(changedRow,i) - tempMatrix(i)
    11 continue
end subroutine

!The reduce subroutine reduces everything in the row given by the
! value in the row,row position in the matrix.
subroutine reduce(row)
    integer row, i
    double precision reduceBy
    reduceBy = matrix(row,row)
    do 10 i = row, number+1
        matrix(row,i) = matrix(row,i) / reduceBy
    10 continue
end subroutine


!The getValueByIteslf subroutine multiplies the corresponding value and subtracts it from the right side
!ex:    x + 5y = 2;     y = 4
!       x + 5(4) = 2;
!       x = -18
subroutine getValueByItself(row)
    integer row, i
    do 10 i = 0, number - 1
        if(row < number-i)then
            matrix(row, number - i) = matrix(number - i, number + 1) * matrix(row, number - i)
            matrix(row, number + 1) = matrix(row, number + 1) - matrix(row, number - i)
            matrix(row, number - i) = 0
        end if
    10 continue
end subroutine

end program
