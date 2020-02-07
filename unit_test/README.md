# perl installation
1. install cygwin and strawberry perl.(donot install active perl, because ppm does not work on perl 5.26 and after version)

# perl coverage test 
1. install Devel::Cover.
   * `cpan Devel::Cover` 
2. clean the coverage result.
   * `cover -delete`
3. write the program, like wiki.pl.
4. execute wiki.pl under Devel::Cover.
   * `perl -MDevel::Cover wiki.pl`
5. merge the coverage result.
   * `cover`
6. then the coverage result will appear in cover_db.

# perl performance test
1. install Devel::NYTProf.
    * `cpan Devel::NYTProf`.
2. execute program using Devel::NYTProf.
    * `perl -d:NYTProf perform.pl`
3. generate html result
    * `nytprofhtml --open`
