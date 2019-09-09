print "!!DICUT9\n";

sub print_line {
    local($yomi, $hyouki, $hinshi) = @_;

    $yomi =~ s/ //g;
    $hyouki =~ s/ //g;
    printf "%s,%s,%s\n", $yomi, $hyouki, $hinshi;
}
1;
