module io_helper
    use helper
    implicit none
    
contains

!this subroutine will generate data to output path
subroutine generate_data(output_path,n)
    implicit none
    character(len=*),intent(in)::output_path
    character(10)::fmt
    integer,intent(in)::n
    integer::i
    integer::io
    integer::digit_num
    !fmt = "(I"// division_result //",A$)"

    call digit_count(n, digit_num)
    !write(*,*) "test"
    ! quick hack to change I0 to I<actual_length>
    ! write (unit=fmt,fmt='(A2,I0,A4)') "(I", digit_num, ",A$)"
    ! print *,fmt
    open(newunit=io, file=output_path, status="replace")
    !loop number form 1 to 100
    do i=1,n-1
        call digit_count(i, digit_num)
        ! quick hack to change I0 to I<actual_length>
        write (unit=fmt,fmt='(A2,I0,A4)') "(I", digit_num, ",A$)"
        write(io, fmt) i,","
    end do
    
    call digit_count(i, digit_num)
    ! quick hack to change I0 to I<actual_length>
    write (unit=fmt,fmt='(A2,I0,A4)') "(I", digit_num, ",A$)"
    write(io, fmt) i
    write(*, *) fmt
    close(io)

end subroutine generate_data

end module io_helper
