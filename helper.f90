module helper
    implicit none
    
contains

subroutine digit_count(d, r)
    implicit none
    integer, intent(in)::d
    integer::v
    integer, intent(out)::r
    integer::division_result

    v = d
    !exploit the fact integer division always rounding to bottom
    division_result = v/10
    r = 1
    do while(division_result > 0)
        v = division_result
        division_result = v/10
        r = r + 1
    end do 

end subroutine digit_count

function count_int_in_string(strs, strlen) result(counter)
    implicit none
    character(len=*), intent(in)::strs
    integer, intent(in)::strlen
    integer :: counter
    integer::i
    
    counter = 0
    do i=1,strlen
        if(strs(i:i) .eq. ',') then
            counter = counter + 1
        end if
    end do
    counter = counter + 1
end function count_int_in_string

end module
