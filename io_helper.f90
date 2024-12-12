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
    !write(*, *) fmt
    close(io)

end subroutine generate_data

function parse_input_as_ints(input_path) result(ints)
    implicit none
    character(len=*),intent(in)::input_path
    integer, allocatable::ints(:)
    character(1000)::strs
    character(:), allocatable::core_str
    integer::io, slen, int_arr_size
    integer::i, j, lpos, rpos
    
    open(newunit=io, file=input_path, status="old")
    read(io, "(A)") strs
    allocate(character(slen)::core_str)
    
    !print *, slen
    close(io)
    
    slen = len(trim(strs))
    core_str = strs(1:slen)
    
    
    !write (*,*) strs
    !write (*,*) core_str
    
    int_arr_size = count_int_in_string(core_str, slen)
    !print *, int_arr_size
    
    !dummy
    allocate(ints(int_arr_size))
    j = 1
    lpos = 0
    do i=1,slen
        if(core_str(i:i) == ",") then
            rpos = i - 1
            read(core_str(lpos:rpos), *) ints(j)
            lpos = i + 1
            j = j + 1
        end if
    end do
    
    !post processing
    read(core_str(lpos:), *) ints(j)

end function parse_input_as_ints

end module io_helper
