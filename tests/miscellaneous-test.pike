#charset utf8

constant yml = #"
---
null: ~
true: boolean
false: boolean
string: '12345'
";

int main(int argc, array(string) argv)
{
  mixed data = Parser.YAML.decode(yml);

  werror(">>> %s\n", basename(__FILE__));
  werror("%O\n", data);

  return 0;
}
