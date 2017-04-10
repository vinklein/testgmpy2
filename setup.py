from distutils.core import setup, Extension
from Cython.Build import cythonize
import sys

extensions = [
    Extension("testgmpy2", ["testgmpy2.pyx"],
        include_dirs=['/home/doctorant/Installer/gmpy/src/'] 
              # TODO replace with your path to .h files 
        )
]

setup(
    name = "test gmpy2",
    ext_modules = cythonize(extensions, include_path=sys.path)
)
