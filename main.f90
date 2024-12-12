program name
    use io_helper
    implicit none
    ! variable declaration section
    character(50)::filepath
    integer, allocatable::int_arr(:)

    filepath="data.txt"
    ! 1st phase generate data
    call generate_data(filepath, 100)
end program name
