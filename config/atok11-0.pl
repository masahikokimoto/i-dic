print "!!DICUT11\n";

sub print_line {
    local($yomi, $hyouki, $hinshi) = @_;

    $yomi =~ s/ //g;
    $hyouki =~ s/ //g;
    printf "%s\t%s\t%s\n", $yomi, $hyouki, $hinshi;
}
1;
