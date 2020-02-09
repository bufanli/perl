use lib "./lib";
use Game;
use Test::More;
use base qw(Test::Class);

my %players;

sub initial : Test(setup) {
    %players = ( 'СA' => ['�κ�','����'],
    'СB' => ['����','������'],
    'СC' => ['�κ�','����'] );
    print "Begin One Test...\n";
}

sub end : Test(teardown) {
    print "End One Test...\n";
}

sub test_reverse : Test(1) {
    my $games_ref = Game::reversHash(\%players);
    my %games = ( '�κ�' => ['СA','СC'],
        '����' => ['СA','СB','СC'],
        '������' => ['СB'] );
    is_deeply($games_ref,\%games,"reverse_Hash test");
}

sub test_getPlayers : Test(2) {
    my @players = Game::getPlayers(\%players,'������');
    is_deeply(['СB'],\@players,"getPlayers test: match set");
    ok( Game::getPlayers(\%players,'����') eq "","getPlayers test: empty set");
}
 

Test::Class->runtests();
