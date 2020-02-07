# perl performance test
1. install Devel::NYTProf.
    * `cpan Devel::NYTProf`.
2. execute program using Devel::NYTProf.
    * `perl -d:NYTProf perform.pl`
3. generate html result
    * `nytprofhtml --open`
