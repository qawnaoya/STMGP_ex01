program ex01
    use, intrinsic :: iso_fortran_env
    implicit none

    type :: arguments
        character(:), allocatable :: v
    end type

integer(int32) :: argc
type(arguments), allocatable :: arg(:)

argc = command_argument_count()
allocate (arg(0:argc))

get_arguments: block
    integer(int32) :: n, length_nth_arg
    do n = 0, argc
        ! n番目の引数の長さを取得
        call get_command_argument(number=n, length=length_nth_arg)

        ! n番目の配列を割り当て
        allocate (character(length_nth_arg) :: arg(n)%v)

        ! n番目の引数を取得
        call get_command_argument(number=n, value=arg(n)%v)

        print *, n, arg(n)%v

    end do
end block get_arguments

end program ex01
