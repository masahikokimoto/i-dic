#!/usr/bin/perl
print "!Microsoft IME Dictionary Tool 98\n";
print "!Version:\n";
print "!Format:WORDLIST\n\n";

sub print_line {
    local($yomi, $hyouki, $hinshi, $dummy, $bikou, $tv, $cf, $av, $kaimei) = @_;

    if ($yomi =~ / /) {
        $yomi =~ s/ //g;
        $hyouki =~ s/ //g;
    }
    printf "%s\t%s\t%s\t", $yomi, $hyouki, $hinshi;

    if ($kaimei =~ /¢ª/ ) {
        print "µìÌ¾¡£";
        $j = 3;
    } else {
        $j = 0;
    }

    $comment = join(" ", $bikou, $tv, $cf, $av);
    if ($comment ne "   ") {
        for ($i = 0; $i < length($comment); $i++) {
            $c = substr($comment, $i, 1);
            if ($c =~ /[\x80-\xff]/) {
                $c = substr($comment, $i++, 2);
            }
            print "$c";
            $j++;
            if ($j >= 60) {
                last;
            }
        }
    }
    print "\n";
}
1;
