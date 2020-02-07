use strict;

use warnings;

sub GetDivInt
{
    my ($a,$b) = @_;
    return 0 if($a== 0 || $b == 0);
    my $r = $a/$b;
    if($r < 0.0001){
        $r = 0;
    }
    $r = $1 if($r =~ /^(\d+)\./);
    return $r;
}

sub echo {
    print "@_\n";
}

print GetDivInt(3,4);
print GetDivInt(0,2);
