program name
    use io_helper
    implicit none
    ! variable declaration section
    character(50)::filepath
    integer, allocatable::int_arr(:)

    filepath="data.txt"
    ! 1st phase generate data
    call generate_data(filepath, 100)
    
    ! 2nd phase parse the input
    int_arr = parse_input_as_ints(filepath)
    write (*,*) size(int_arr)
    print *,int_arr(:)
end program name
