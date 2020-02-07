@a = (1..999999);
@b = (11111..1111111);

sub in_a {
    $num = $_[0];
    @arr = @{$_[1]};

    foreach(@arr){
        return 1 if $_ == $num;
    }
    return 0;
}

sub in_b {
    $num = $_[0];
    @arr = @{$_[1]};
    ($ta,$tb) = (0,@arr - 1);
    while($ta<$tb) {
        $mid = int( ($tb+$ta) / 2 );
        return 1 if $arr[$mid] == $num;
        if($arr[$mid] > $num){
            $tb = $mid;
        }else{
            $ta = $mid;
        }
    }
    return 0;
}

sub in_both {
    return 0 if in_b($_[0],$_[1]) == 0;
    return 0 if in_b($_[0],$_[2]) == 0;
    return 1;
}

in_a(999998,\@a);
in_b(999998,\@a);
in_both(999998,\@a,\@b);
