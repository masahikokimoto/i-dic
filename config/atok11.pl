print "!!DICUT11\n";

sub print_line {
    local($yomi, $hyouki, $hinshi, $include_space) = @_;

    $yomi =~ s/ //g;
    if (!$include_space) {
	$hyouki =~ s/ //g;
    }
    printf "%s\t%s\t%s\n", $yomi, $hyouki, $hinshi;
}
1;
