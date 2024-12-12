module helper
    implicit none
    
contains

function digit_count(d) result(r)
    implicit none
    integer, intent(in)::d
    integer::v
    integer::r
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

end function digit_count

end module helper
