use lib "./lib";
use Popu::Game;
use Test::More;
use base qw(Test::Class);
use Test::MockObject;

my %players;

sub initial : Test(setup) {
    %players = ( 'СA' => ['�κ�','����'],
    'СB' => ['����','������'],
    'СC' => ['�κ�','����'] );
    print "Begin One Test...\n";
    my $mock = Test::MockObject->new(); 
    $mock->fake_module( 'Popu::Game',
        fluorinate=>sub() {print  'impurifying precious bodily fluids' } );
}

sub end : Test(teardown) {
    print "End One Test...\n";
}

sub test_reverse : Test(1) {
    my $games_ref = Popu::Game::reversHash(\%players);
    my %games = ( '�κ�' => ['СA','СC'],
        '����' => ['СA','СB','СC'],
        '������' => ['СB'] );
    is_deeply($games_ref,\%games,"reverse_Hash test");
}

sub test_getPlayers : Test(2) {
    my @players = Popu::Game::getPlayers(\%players,'������');
    is_deeply(['СB'],\@players,"getPlayers test: match set");
    ok( Popu::Game::getPlayers(\%players,'����') eq "","getPlayers test: empty set");
}
 

Test::Class->runtests();
