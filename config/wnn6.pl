print "\\comment I-DIC\n\\total 0\n\\hinsi\n\n";

sub print_line {
    local($yomi, $hyouki, $hinshi) = @_;

    if ($yomi =~ / /) {
	$yomi =~ s/ //g;
	$hyouki =~ s/ //g;
    } else {
	$hyouki =~ s/ /\\040/g;
    }
    printf "%s %s %s 0\n",$yomi, $hyouki, $hinshi;
}
1;
