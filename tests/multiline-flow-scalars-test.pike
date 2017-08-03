#charset utf8

constant yml = #"
plain:
  This unquoted scalar
  spans many lines.
quoted: \"So does this
  quoted scalar.\n\"
";

int main(int argc, array(string) argv)
{
  mixed data = Parser.Yaml.decode(yml);

  werror(">>> %s\n", basename(__FILE__));
  werror("%O\n", data);

  return 0;
}
