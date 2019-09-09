sub print_line {
    local($yomi, $hyouki, $hinshi) = @_;

    $yomi =~ s/ //g;
    $hyouki =~ s/ //g;
    printf "%s\t%s:%s\n", $yomi, $hyouki, $hinshi;
}
1;
