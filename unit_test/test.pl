use lib "./lib";
use Popu::Game;
use Test::More;
use base qw(Test::Class);
use Test::MockObject;

my %players;

sub initial : Test(setup) {
    %players = ( 'Ğ¡A' => ['°ÎºÓ','àªàªÇò'],
    'Ğ¡B' => ['àªàªÇò','°óÍÈÅÜ'],
    'Ğ¡C' => ['°ÎºÓ','àªàªÇò'] );
    print "Begin One Test...\n";
}

sub end : Test(teardown) {
    print "End One Test...\n";
}

sub test_reverse : Test(1) {
    my $games_ref = Popu::Game::reversHash(\%players);
    my %games = ( '°ÎºÓ' => ['Ğ¡A','Ğ¡C'],
        'àªàªÇò' => ['Ğ¡A','Ğ¡B','Ğ¡C'],
        '°óÍÈÅÜ' => ['Ğ¡B'] );
    is_deeply($games_ref,\%games,"reverse_Hash test");
    my $mock = Test::MockObject->new(); 
    $mock->mock( 'fluorinate',
        sub { 'impurifying precious bodily fluids' } );
    print $mock->fluorinate;

}

sub test_getPlayers : Test(2) {
    my @players = Popu::Game::getPlayers(\%players,'°óÍÈÅÜ');
    is_deeply(['Ğ¡B'],\@players,"getPlayers test: match set");
    ok( Popu::Game::getPlayers(\%players,'ÀºÇò') eq "","getPlayers test: empty set");
}
 

Test::Class->runtests();
