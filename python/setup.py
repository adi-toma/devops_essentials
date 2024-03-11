
from setuptools import setup, find_packages

setup(
    name = "Greetings",
    version = "0.1.0",
    packages = find_packages(exclude=['*test']),
    scripts = ['scripts/greet'],
    install_requires = ['argparse'],
    author ="Panainte Diana", 
    author_email="panaintediana@yahoo.com"
)