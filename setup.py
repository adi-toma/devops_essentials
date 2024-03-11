
from setuptools import setup, find_packages

setup(
    name = "Greetings",
    version = "0.1.0",
    author_email = "author@example.com"
    packages = find_packages(exclude=['*test']),
    scripts = ['scripts/greet'],
    install_requires = ['argparse']
)
