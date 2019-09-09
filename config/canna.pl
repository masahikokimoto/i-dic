sub print_line {
    local($yomi, $hyouki, $hinshi, $include_space) = @_;

    $yomi =~ s/ //g;
    if ($include_space) {
	$hyouki =~ s/ /\\ /g;
    } else {
	$hyouki =~ s/ //g;
    }
    printf "%s\t%s\t%s\n", $yomi, $hinshi, $hyouki;
}
1;
