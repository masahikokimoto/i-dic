sub print_line {
    local($yomi, $hyouki, $hinshi) = @_;

    return if $yomi =~ /^(��|��|��|��|��|��|��|��|��|��|��|��|��|��)/;
    if ($yomi =~ / /) {
	$yomi =~ s/ //g;
#	$hyouki =~ s/ //g unless $hyouki =~ /^[a-zA-Z'. ]+$/;
	$hyouki =~ s/ //g;
    }
    printf "%s\t%s\t%s\t\n", $yomi, $hyouki, $hinshi;
}
1;
