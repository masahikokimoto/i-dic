sub print_line {
   local($yomi, $hyouki, $hinshi) = @_;

   if ($yomi =~ / /) {
       $yomi =~ s/ //g;
       $hyouki =~ s/ //g;
   }

    printf "%s\t%s\t%s\r\n", $yomi, $hyouki, $hinshi;
}
1;
