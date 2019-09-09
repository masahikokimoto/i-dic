sub print_line {
    local($yomi, $hyouki, $hinshi) = @_;

    if ($yomi =~ / /) {
	$yomi =~ s/ //g;
	$hyouki =~ s/ //g;
    }
    if ($hyouki =~ / /) {
	$hyouki =~ s/(.*)/"\1"/;
    }
    printf "%s\t%s\t%s\n", $yomi, $hyouki, $hinshi;
}
1;
