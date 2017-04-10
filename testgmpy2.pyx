# distutils: libraries = gmp

cdef extern from "Python.h":
    ctypedef struct PyObject:
        pass
    
cdef extern from "gmp.h":
    ctypedef struct __mpz_struct:
        pass
    ctypedef __mpz_struct mpz_t[1]
    void mpz_set_si (mpz_t rop, signed long int op)
    
cdef extern from "gmpy2.h":
    cdef (PyObject *)GMPy_MPZ_New(void *)
    cdef int import_gmpy2()
    
cdef extern from "gmpy2_mpz.h":
    cdef mpz_t MPZ(PyObject *)

import_gmpy2()

def test():
    cdef PyObject * z = GMPy_MPZ_New(NULL)
    mpz_set_si(MPZ(z),999)
    return <object> z