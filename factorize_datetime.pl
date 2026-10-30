#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';

# 西暦 + 月日 + 現在時刻(時分秒) を連結した数値を作る
# 例: 2026年4月11日 15:09:08 -> 20260411150908
my ($sec, $min, $hour, $mday, $mon, $year) = localtime();
$year += 1900;
$mon  += 1;

my $number_str = sprintf('%04d%02d%02d%02d%02d%02d',
    $year, $mon, $mday, $hour, $min, $sec,
);

# 文字列のままだと先頭ゼロの問題が出るので数値化
my $n = 0 + $number_str;

say "対象数値: $n";

my @factors = prime_factors($n);
say "素因数分解: " . join(' × ', @factors);

sub prime_factors {
    my ($x) = @_;

    return ($x) if $x < 2;

    my @result;

    while ($x % 2 == 0) {
        push @result, 2;
        $x /= 2;
    }

    my $d = 3;
    while ($d * $d <= $x) {
        while ($x % $d == 0) {
            push @result, $d;
            $x /= $d;
        }
        $d += 2;
    }

    push @result, $x if $x > 1;
    return @result;
}
