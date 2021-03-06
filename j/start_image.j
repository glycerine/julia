# set up non-serializable state

const stdout_stream = make_stdout_stream()
set_current_output_stream(stdout_stream)
const stdin_stream = fdio(ccall(:jl_stdin, Int32, ()))
const stderr_stream = fdio(ccall(:jl_stderr, Int32, ()))

# restore shared library handles

# Essential libraries
_jl_libpcre = dlopen("libpcre")
_jl_libgrisu = dlopen("libgrisu")
_jl_libm = dlopen("libm")
_jl_libfdm = dlopen("libfdm")
_jl_librandom = dlopen("librandom"); _jl_librandom_init();

# Optional libraries
_jl_libblas = dlopen("liblapack")
_jl_liblapack = _jl_libblas
_jl_libarpack = dlopen("libarpack")
_jl_libfftw = dlopen("libfftw3")
_jl_libfftwf = dlopen("libfftw3f")
_jl_libsuitesparse = dlopen("libsuitesparse");
_jl_libsuitesparse_wrapper = dlopen("libsuitesparse_wrapper");
