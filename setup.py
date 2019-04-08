import io
import os
from setuptools import setup, find_packages


HERE = os.path.abspath(os.path.dirname(__file__))

NAME = 'inns'
DESCRIPTION = 'Materials for interactive tutorial at INNS 2019'
URL = 'https://github.com/IlyaKisil/inns-2019'
EMAIL = 'ilyakisil@gmail.com'
AUTHOR = 'Ilya Kisil'
REQUIRES_PYTHON = '>=3.6.0'
VERSION = "0.1.1"

# Required packages for this tutorial
REQUIRED = [
      "pip==19.0.3"
      "ipykernel",
      "matplotlib",
      "seaborn",
      "numpy",
      "pandas",
      "scipy",
      "hottbox",
]



# Import the README and use it as the long-description.
# This will only work if 'README.md' is present in MANIFEST.in
try:
    with io.open(os.path.join(HERE, 'README.md'), encoding='utf-8') as f:
        long_description = '\n' + f.read()
except FileNotFoundError:
    long_description = DESCRIPTION

config = dict(
      name=NAME,
      version=VERSION,
      description=DESCRIPTION,
      long_description=long_description,
      long_description_content_type='text/markdown',
      author=AUTHOR,
      author_email=EMAIL,
      python_requires=REQUIRES_PYTHON,
      url=URL,
      packages=find_packages(exclude=['data', 'notebooks', 'tests*']),
      install_requires=REQUIRED,
      include_package_data=True,
      license='MIT',
      classifiers=[
            'License :: OSI Approved :: MIT License',
            'Programming Language :: Python',
            'Programming Language :: Python :: 3',
            'Programming Language :: Python :: 3.6',
      ],
)

setup(**config)
