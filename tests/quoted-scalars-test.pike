#charset utf8

constant yml = #"
---
unicode: \"Sosa did fine.\\u263A\"
control: \"\\b1998\t1999\t2000\n\"
hex esc: \"\\x0d\\x0a is \\r\\n\"
single: '\"Howdy!\" he cried.'
quoted: ' # not a ''comment''.'
tie-fighter: '|\\-*-/|'
";

int main(int argc, array(string) argv)
{
  mixed data = Parser.YAML.decode(yml);

  werror(">>> %s\n", basename(__FILE__));
  werror("%O\n", data);

  return 0;
}
