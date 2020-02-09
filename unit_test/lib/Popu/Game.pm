package Popu::Game;

use strict;
use warnings;
sub reversHash {
    my %in = %{$_[0]};
    my %out;
    foreach my $key (sort keys %in){
        foreach(@{$in{$key}}){
            push @{$out{$_}},$key;
        }
    }
    return \%out;
}

sub getPlayers {
    my ($player_hash_ref,$game) = @_;
    my $game_hash_ref = Popu::Game::reversHash($player_hash_ref);
    if(exists $game_hash_ref->{$game}){
        return @{$game_hash_ref->{$game}};
    }else{
        return "";
    }
}

1;
